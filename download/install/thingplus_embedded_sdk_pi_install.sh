#!/bin/sh

THINGPLUS_PREFIX=/opt/thingplus
GATEWAY_DIR=$THINGPLUS_PREFIX/gateway
SDK_DIR=$THINGPLUS_PREFIX/.

NODE_VERSION=0.10.16
NODE_INSTALL_PREFIX=/usr/local

MODEL="debian"
RSYNC_SERVER="rsync.thingplus.net"
RSYNC_USER="debian_b2d"
RSYNC_PASSWORD="fmLU~e2OhmyKDTj"
RSYNC_SIZE_ONLY_OPTION="false"

thisplus_openhardware_pi_install () {
  INSTALL_DIR=$1
  PI_SOURCE_DIR=openhardware/raspberrypi/grovePi-starter-kit

  cd $INSTALL_DIR/$PI_SOURCE_DIR;
  npm install
  cd -
}

thisplus_openhardware_sdk_install () {
  INSTALL_DIR=$1
  git clone https://github.com/daliworks/openhardware.git $INSTALL_DIR/openhardware
}

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
  ln -s /usr/local/bin/node /usr/bin
}

root_permission_check() {
  if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    echo "sudo ./thingplus_embedded_sdk_pi_install.sh"
    exit 1
  fi
}

########## START ##########
root_permission_check

node --version
if [ "$?" != "0" ]; then
  node_install
fi

if [ ! -d $SDK_DIR ]; then
  mkdir -p $SDK_DIR
fi

thingplus_install

thisplus_openhardware_sdk_install $SDK_DIR
thisplus_openhardware_pi_install $SDK_DIR

echo 'Installation is finished'
echo 'Please Reboot'
