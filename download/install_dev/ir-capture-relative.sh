#!/bin/bash
# ./ir-capture 

LIRC_CONF_FILE=/etc/lirc/lircd.conf

IRCODE_RESULT=0
KEY=()

ircode_test() {
	irsend SEND_ONCE AIR_38000 $1
	read -p "code works(y/n)? " CODE_RESULT
	CODE_RESULT=${CODE_RESULT^^}

	if [ $CODE_RESULT == "Y" ]; then 
		return 1;
	fi

	return 0;
}

ircode_insert() {
	sed -e "/begin\ raw_codes/r $1" $LIRC_CONF_FILE > .lircd.conf.sed && mv .lircd.conf.sed $LIRC_CONF_FILE
	sed -i "/begin\ raw_codes/a \ \ name\ $1" $LIRC_CONF_FILE
	sync
}

ircode_get() {
        if [ -f $1 ]; then
                rm -f $1
        fi

        mode2 -d /dev/lirc0 -m > $1 &
        MODE2_PID=$!

        read -p "Push $1 and Enter"

        kill $MODE2_PID

        tail -n +3 $1 > $1.tmp && mv $1.tmp $1
	echo -e "\n" >> $1
}

lirc_start() {
	service lirc start;
	sleep 1;
}

lirc_stop() {
	killall mode2 2>/dev/null
        service lirc stop
	sleep 1
}

lircd_conf_init() {
        LIRCD_CONF_TEMPLATE='begin remote\n
          name  AIR_38000\n
          flags RAW_CODES\n
          eps            30\n
          aeps          100\n
          frequency     38000\n
        \n
          begin raw_codes\n
          end raw_codes\nend remote'

	  echo -e $LIRCD_CONF_TEMPLATE > $LIRC_CONF_FILE
}

keyname_init() {
	KEY+=('ON')
	KEY+=('UP')
	KEY+=('DOWN')
	KEY+=('OFF')
}

keyname_init
lirc_stop
lircd_conf_init

for i in "${KEY[@]}"; do
	cp $LIRC_CONF_FILE .lircd.conf.tmp

	until [ $IRCODE_RESULT -eq  1 ]; do
		lirc_stop

		cp .lircd.conf.tmp $LIRC_CONF_FILE 

		ircode_get $i
		ircode_insert $i

		lirc_start

		ircode_test $i
		IRCODE_RESULT=$?
	done
	IRCODE_RESULT=0
done
