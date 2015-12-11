#!/bin/sh

# Destination directory for Thing+ Gateway
GATEWAY_DIR=./gateway
# Destination directory for Open Hardware SDK
SDK_DIR=.

MODEL="win"
#RSYNC_SERVER="rsync.thingplus.net"
RSYNC_SERVER="devrsync.thingbine.com"
RSYNC_USER="win_b2d"
RSYNC_PASSWORD="'Spn3K9HL8qvF'"
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

thingplus_install () {
  thingplus_config_set
  wget http://support.thingplus.net/download/install/thingplus_install.sh
  chmod +x ./thingplus_install.sh
  ./thingplus_install.sh b2d
  rm ./thingplus_install.sh
  rm ./config
}

thisplus_openhardware_sdk_install () {
  INSTALL_DIR=$1
  git clone https://github.com/daliworks/openhardware.git $INSTALL_DIR/openhardware
}

thisplus_openhardware_arduino_install () {
  INSTALL_DIR=$1
  ARDUINO_SOURCE_DIR=openhardware/arduino/grove-starter-kit/

  cd $INSTALL_DIR/$ARDUINO_SOURCE_DIR;
  npm.cmd install
  cd -
}

cygwin_setup () {
  lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg
  install apt-cyg /bin
  apt-cyg install git wget 
}

########## START ##########
cygwin_setup

thingplus_install

if [ ! -d $SDK_DIR ]; then
  mkdir -p $SDK_DIR
fi

thisplus_openhardware_sdk_install $SDK_DIR
thisplus_openhardware_arduino_install $SDK_DIR

echo 'Installation is finished'

