#!/bin/sh

# Destination directory for Thing+ Gateway
GATEWAY_DIR=./gateway
# Destination directory for Open Hardware SDK
SDK_DIR=.

NODE_VERSION=0.10.16
NODE_INSTALL_PREFIX=$(PWD)/./openhardware/arduino/node/

MODEL="osx"
#RSYNC_SERVER="rsync.thingplus.net"
RSYNC_SERVER="devrsync.thingbine.com"
RSYNC_USER="osx_b2d"
RSYNC_PASSWORD="'d~yj|H7c!nHAx+Y'"
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

node_install() {
  wget http://support.thingplus.net/download/install/thingplus_embedded_node_install.sh
  chmod +x ./thingplus_embedded_node_install.sh
  ./thingplus_embedded_node_install.sh -nv $NODE_VERSION -p $NODE_INSTALL_PREFIX
  rm ./thingplus_embedded_node_install.sh
}

thingplus_openhardware_sdk_install () {
  INSTALL_DIR=$1
  git clone https://github.com/daliworks/openhardware.git $INSTALL_DIR/openhardware
}

thingplus_openhardware_arduino_install () {
  INSTALL_DIR=$1
  ARDUINO_SOURCE_DIR=openhardware/arduino/grove-starter-kit/

  cd $INSTALL_DIR/$ARDUINO_SOURCE_DIR;
  $NODE_INSTALL_PREFIX/bin/npm install
  cd -
}

########## START ##########

thingplus_install

if [ ! -d $SDK_DIR ]; then
  mkdir -p $SDK_DIR
fi

thingplus_openhardware_sdk_install $SDK_DIR
node_install
thingplus_openhardware_arduino_install $SDK_DIR

echo 'Installation is finished'
