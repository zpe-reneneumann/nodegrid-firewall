#!/usr/bin/env bash
#Create by Rene Neumann from ZPE Systems
#last update on 2020-08-17
#

if [ ! -f /etc/logrotate.d/iptables-dropped ]; then
  echo "IPTABLES logrotate settings do not exist yet, lets create it..."
  echo "/var/log/iptables-dropped.log {
      size 10M
      rotate 5
      notifempty
      copytruncate
}" > iptables-dropped
  echo "restart log rotate"
  logrotate /etc/logrotate.conf
fi