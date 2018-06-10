#!/bin/sh
while true; do
  for line in `nvram show | grep =$ `; do
    var=${line%*=}
    nvram unset $var
  done
  sleep 86400
done &