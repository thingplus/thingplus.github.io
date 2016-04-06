#!/bin/sh

# Destination directory for Thing+ Gateway
GATEWAY_DIR=./gateway
# Destination directory for Open Hardware SDK
SDK_DIR=.

MODEL="edison"
#RSYNC_SERVER="rsync.thingplus.net"
RSYNC_SERVER="rsync.thingplus.net"
RSYNC_USER="openhardware_edison"
RSYNC_PASSWORD="LyBNnjlQx2YNQ7Cd"
RSYNC_SIZE_ONLY_OPTION="false"

rsync_install() {
  pushd . > /dev/null
  if [ ! -d /usr/local/bin ] ; then
    mkdir -p /usr/local/bin
  fi 
  cd /usr/local/bin
  wget http://support.thingplus.net/download/install/edison_asset/rsync
  chmod +x rsync
  popd > /dev/null
}

git_install() {
  echo "src intel-iotdk http://iotdk.intel.com/repos/1.1/intelgalactic" > /etc/opkg/intel-iotdk.conf
  echo "src all     http://iotdk.intel.com/repos/1.1/iotdk/all" > /etc/opkg/base-feeds.conf
  echo "src x86 http://iotdk.intel.com/repos/1.1/iotdk/x86" >> /etc/opkg/base-feeds.conf
  echo "src i586    http://iotdk.intel.com/repos/1.1/iotdk/i586" >> /etc/opkg/base-feeds.conf
  opkg update
  opkg upgrade
  opkg install git
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

thingplus_openhardware_edison_install () {
  INSTALL_DIR=$1
  EDISON_SRC_DIR=openhardware/edison/grove-starter-kit/

  cd $INSTALL_DIR/$EDISON_SRC_DIR;
  npm install
  cd -
}


########## START ##########

rsync_install
git_install
tube_install

if [ ! -d $SDK_DIR ]; then
  mkdir -p $SDK_DIR
fi

thingplus_openhardware_sdk_install $SDK_DIR
thingplus_openhardware_edison_install $SDK_DIR

echo 'Installation is finished'
echo 'Please Reboot'


