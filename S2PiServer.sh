#!/bin/bash

export PATH=$PATH:/usr/local/bin
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules

case "$1" in
  start)
  exec forever start --sourceDir=~/S2Pi -p /var/run/forever S2Pi.js
  ;;
stop)
  exec forever stop --sourceDir=~/S2Pi S2Pi.js
  ;;
*)
  echo "Usage: /etc/init.d/S2PiServer {start|stop}"
  exit 1
  ;;
esac

exit 0