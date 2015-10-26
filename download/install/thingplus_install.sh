#!/bin/sh

if [ "$1" = "b2d" ]; then
  THINGPLUS_GATEWAY_DIR=""
fi

if [ -f ./config ]; then
  . ./config
else
  cat <<EOF >./config
MODEL="model_name"
RSYNC_SERVER="rsync.thingplus.net"
RSYNC_USER="rsync_user"
RSYNC_PASSWORD="rsync_password"
RSYNC_SIZE_ONLY_OPTION="false"
DEST_DIR="installation_directory"
EOF
  echo "Information: edit ./config file first."
  exit 1;
fi

# ssl-stunnel 
if [ "$4" = "rsync" -a "$5" = "--server" -a "$6" = "--daemon" ]; then
  RSYNC_SSL_CA_CERT=${RSYNC_SSL_CA_CERT:-"./ca-cert.pem"}

  if [ x"$RSYNC_SSL_CERT" = x ]; then
    cert=""
  else
    cert="cert = $RSYNC_SSL_CERT"
  fi
  if [ x"$RSYNC_SSL_CA_CERT" != x -a -f "$RSYNC_SSL_CA_CERT" ]; then
    cafile="CAfile = $RSYNC_SSL_CA_CERT"
    verify=3
  else
    cafile=""
    verify=0
  fi
  port=${RSYNC_SSL_PORT:-1873}

  # If the user specified USER@HOSTNAME::module, then rsync passes us
  # the -l USER option too, so we must be prepared to ignore it.
  if [ x"$1" = x"-l" ]; then
    shift 2
  fi

  hostname=$1
  shift

  if [ x"$hostname" = x -o x"$1" != x"rsync" -o x"$2" != x"--server" -o x"$3" != x"--daemon" ]; then
    echo "Usage: stunnel-rsync HOSTNAME rsync --server --daemon ." 1>&2
    exit 1
  fi

  if which stunnel4 > /dev/null; then
    STUNNEL_BIN="stunnel4";
  elif which stunnel > /dev/null; then
    STUNNEL_BIN="stunnel";
  fi

  # devzero@web.de came up with this no-tmpfile calling syntax:
  $STUNNEL_BIN -fd 6 7<&0 <<EOF_STUNNEL 6<&0 0<&7 7<&-
foreground = yes
debug = crit
connect = $hostname:$port
client = yes
TIMEOUTclose = 0
verify = $verify
$cert
$cafile
EOF_STUNNEL
  exit;
fi 
#ssl-stunnel

INIT_D_SCRIPT=$DEST_DIR/thingplus-gateway/device/update/$MODEL/files/thingplus.sh
SRC_URL="rsync://$RSYNC_USER@$RSYNC_SERVER:8873/$RSYNC_USER"
SIZE_ONLY=${RSYNC_SIZE_ONLY_OPTION}

if [ ! -d $DEST_DIR ]; then
  mkdir -p $DEST_DIR
fi

if [ "$SIZE_ONLY" = "true"  ]; then
  RSYNC_OPTIONS="-rlvz --size-only"
else
  RSYNC_OPTIONS="-avz"
fi

RSYNC=`which rsync`
STUNNEL=`which stunnel`
STUNNEL4=`which stunnel4`
if [ -n "$STUNNEL" -o -n "$STUNNEL4" ]; then
  STUNNEL_OPT="--rsh=$0"
fi

RSYNC_PASSWORD="$RSYNC_PASSWORD" $RSYNC $RSYNC_OPTIONS \
  --delete-after \
  --exclude device/ssl/cert.p12 \
  --exclude device/config/runtime.json \
  $STUNNEL_OPT \
  $SRC_URL $DEST_DIR/$THINGPLUS_GATEWAY_DIR

if [ "$1" = "b2d" ]; then
  mkdir -p $DEST_DIR/thingplus-gateway/device/config
fi

if [ -e $INIT_D_SCRIPT ]; then
  $INIT_D_SCRIPT setup
fi
