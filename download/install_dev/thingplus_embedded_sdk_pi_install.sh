#!/bin/bash

THINGPLUS_PREFIX=/opt/thingplus
GATEWAY_DIR=$THINGPLUS_PREFIX/gateway
SDK_DIR=$THINGPLUS_PREFIX/.

NODE_VERSION=0.10.16
NODE_INSTALL_PREFIX=/usr/local

MODEL="debian"
RSYNC_SERVER="rsync.thingplus.net"
RSYNC_USER="openhardware_pi"
RSYNC_PASSWORD="SdckrvL3hq9bKHBU"
RSYNC_SIZE_ONLY_OPTION="false"

thingplus_openhardware_pi_install () {
  INSTALL_DIR=$1
  PI_SOURCE_DIR=openhardware/raspberrypi/grovePi-starter-kit
  PI_CAMERA_SOURCE_DIR=openhardware/raspberrypi/camera
  
  pushd .

  rm -rf ~/.node-gyp
  npm cache clean

  cd $INSTALL_DIR/$PI_SOURCE_DIR;
  npm install
  
  cd $INSTALL_DIR/$PI_CAMERA_SOURCE_DIR;
  npm install

  popd
}

thingplus_openhardware_sdk_install () {
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

dropbox_uploader_install () {
  curl "https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh" -o /usr/local/bin/dropbox_uploader.sh
  chmod +x /usr/local/bin/dropbox_uploader.sh
}

tube_install () {
  thingplus_config_set
  wget http://support.thingplus.net/download/install/tube_install.sh
  chmod +x ./tube_install.sh
  ./tube_install.sh b2d
  rm ./tube_install.sh
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

npm_verify() {
  npm help > /dev/null
  return $?
}

########## START ##########
root_permission_check

INSTALLED_NODE_VERSION="$(node --version)"
if [ $INSTALLED_NODE_VERSION != v"$NODE_VERSION" ]; then
  node_install
elif  ! npm_verify; then
  node_install
fi

if [ ! -d $SDK_DIR ]; then
  mkdir -p $SDK_DIR
fi

dropbox_uploader_install
tube_install

thingplus_openhardware_sdk_install $SDK_DIR
thingplus_openhardware_pi_install $SDK_DIR

echo 'Installation is finished'
echo 'Please Reboot'
