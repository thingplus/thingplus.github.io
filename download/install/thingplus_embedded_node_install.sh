#!/bin/bash

NODE_VERSION=0.10.28
PREFIX=/usr/local

node_install() {
  OS=$(uname)

  case $OS in
    'Darwin')
      NODE_FILE=node-v$NODE_VERSION-darwin-x64.tar.gz
    ;;
    'Linux')
      if [ $NODE_VERSION == '0.10.28' ] ; then
        NODE_FILE=node-v$NODE_VERSION-linux-arm-pi.tar.gz
      else
        NODE_FILE=node-v$NODE_VERSION-linux-armv7l.tar.gz
      fi
    ;;
    *)
      echo Invalid OS Version
      exit 1
    ;;
  esac

  wget http://nodejs.org/dist/v$NODE_VERSION/$NODE_FILE
  tar xvfz $NODE_FILE
  rm $NODE_FILE

  cd $(basename $NODE_FILE ".tar.gz")
  rsync -a bin lib share $PREFIX
  cd -
  rm -rf $(basename $NODE_FILE ".tar.gz")
}

argument_parse() {
  while (( $# )); do
	  echo $1 $2

    case $1 in
      -nv|--node_version)
        NODE_VERSION=$2
        ;;
      -p|--prefix)
        PREFIX=$2
        ;;
    esac
    shift 2
  done
}

########## START ##########

argument_parse $@

echo "Install node v$NODE_VERSION @$PREFIX"

node_install

node --version
echo 'node installed'
