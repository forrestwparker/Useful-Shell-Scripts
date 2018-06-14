#!/bin/sh
iptables -D INPUT -i $dev -m state --state NEW -j DROP
iptables -D FORWARD -i $dev -m state --state NEW -j DROP
iptables -t nat -D POSTROUTING -o $dev -j MASQUERADE
for PID in `ps -w | grep "/jffs/etc/openvpncl/dnsmasq_restart_fix.sh" | awk '{print $1}'` ; do
  kill $PID
done
cat /tmp/resolv.dnsmasq_isp > /tmp/resolv.dnsmasq
rm /tmp/resolv.dnsmasq_isp
rm /tmp/resolv.dnsmasq_vpn
killall -HUP dnsmasq