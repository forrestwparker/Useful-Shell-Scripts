#!/bin/sh
while true; do
  if ! [ "z$(cat /tmp/resolv.dnsmasq)" = "z$(cat /tmp/resolv.dnsmasq_vpn /tmp/resolv.dnsmasq_isp)" ]; then
    logger DNS resolver configuration change detected before OpenVPN connection closed
    logger Setting OpenVPN server as top domain name resolver
    cat /tmp/resolv.dnsmasq > /tmp/resolv.dnsmasq_isp
    cat /tmp/resolv.dnsmasq_vpn > /tmp/resolv.dnsmasq
    cat /tmp/resolv.dnsmasq_isp >> /tmp/resolv.dnsmasq
    killall -HUP dnsmasq
  fi
  sleep 60
done &