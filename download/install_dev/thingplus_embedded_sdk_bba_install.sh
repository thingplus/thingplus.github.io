#!/bin/sh

# Destination directory for Thing+ Gateway
GATEWAY_DIR=./gateway
# Destination directory for Open Hardware SDK
SDK_DIR=.

MODEL="debian"
RSYNC_SERVER="rsync.thingplus.net"
RSYNC_USER="openhardware_bbg"
RSYNC_PASSWORD="a93aiiodsiosdiofe0s"
RSYNC_SIZE_ONLY_OPTION="false"

thingplus_config_set() {
  cat <<EOF >./config
MODEL=$MODEL
RSYNC_SERVER=$RSYNC_SERVER
RSYNC_USER=$RSYNC_USER
RSYNC_PASSWORD=$RSYNC_PASSWORD
RSYNC_SIZE_ONLY_OPTION=$RSYNC_SIZE_ONLY_OPTION
DEST_DIR=$GATEWAY_DIR
EOF
}

tube_install () {
  thingplus_config_set
  wget http://support.thingplus.net/download/install/tube_install.sh
  chmod +x ./tube_install.sh
  ./tube_install.sh b2d
  rm ./tube_install.sh
  rm ./config
}

thingplus_openhardware_sdk_install () {
  INSTALL_DIR=$1
  git clone https://github.com/daliworks/openhardware.git $INSTALL_DIR/openhardware
}

thingplus_openhardware_bba_install () {
  INSTALL_DIR=$1
  BBG_SOURCE_DIR=openhardware/bba/grove-sensors/

  cd $INSTALL_DIR/$BBG_SOURCE_DIR;
  npm install
  git clone https://github.com/daliworks/3.Wooden_Lamp_BBG.git 
  git clone https://github.com/daliworks/GrovePi.git 
  cd -
}


########## START ##########

tube_install

if [ ! -d $SDK_DIR ]; then
  mkdir -p $SDK_DIR
fi

thingplus_openhardware_sdk_install $SDK_DIR
thingplus_openhardware_bba_install $SDK_DIR

echo 'Installation is finished'
echo 'Please Reboot'

