#!/bin/sh

THINGPLUS_PREFIX=/opt/thingplus
GATEWAY_DIR=$THINGPLUS_PREFIX/gateway

MODEL="debian"
RSYNC_USER="openhardware_edison"
RSYNC_PASSWORD="LyBNnjlQx2YNQ7Cd"
RSYNC_SIZE_ONLY_OPTION="false"
if [ -n "$DEV_RSYNC_SERVER" ]; then
  RSYNC_SERVER=$DEV_RSYNC_SERVER
else
  RSYNC_SERVER="rsync.thingplus.net"
fi

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

root_permission_check() {
  if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    echo "sudo ./thingplus_embedded_sdk_edison_update.sh"
    exit 1
  fi
}

########## START ##########
root_permission_check
$GATEWAY_DIR/thingplus.sh stop
tube_install
$GATEWAY_DIR/thingplus.sh start

