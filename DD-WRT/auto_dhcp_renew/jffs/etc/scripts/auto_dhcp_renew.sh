#!/bin/sh
logger "started auto_dhcp_renew"
INTERVAL=10
while true; do
  while [ \! $gw ]; do
    sleep 30
    route -n >/tmp/routes
    while read dest gw foo; do
      if [ $dest = "0.0.0.0" ]; then
        break
      fi
    done </tmp/routes
  done
  logger "auto-repair: default gateway is $gw"
  while ping -qc 2 $gw >/dev/null ; do
    sleep $INTERVAL
  done
  logger "auto-repair: gateway down, restarting WAN"
  kill -USR1 `cat /var/run/udhcpc.pid`
  unset gw
done &