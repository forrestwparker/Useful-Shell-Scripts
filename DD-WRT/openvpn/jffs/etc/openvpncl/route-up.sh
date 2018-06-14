#!/bin/sh
iptables -D INPUT -i $dev -m state --state NEW -j DROP
iptables -D FORWARD -i $dev -m state --state NEW -j DROP
iptables -t nat -D POSTROUTING -o $dev -j MASQUERADE
iptables -I INPUT -i $dev -m state --state NEW -j DROP
iptables -I FORWARD -i $dev -m state --state NEW -j DROP
iptables -t nat -I POSTROUTING -o $dev -j MASQUERADE
cat /tmp/resolv.dnsmasq > /tmp/resolv.dnsmasq_isp
env | grep 'dhcp-option DNS' | awk '{ print "nameserver " $3 }' > /tmp/resolv.dnsmasq_vpn
cat /tmp/resolv.dnsmasq_vpn > /tmp/resolv.dnsmasq
cat /tmp/resolv.dnsmasq_isp >> /tmp/resolv.dnsmasq
killall -HUP dnsmasq
/jffs/etc/openvpncl/dnsmasq_restart_fix.sh