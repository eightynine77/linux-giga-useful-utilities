#!/bin/bash

raw_mode=false
if [[ "$1" == "--raw" || "$1" == "-r" ]]; then
  raw_mode=true
fi

if ! $raw_mode; then
echo
  echo 'To see your system temperature in millidegree, type "systemp -r" or "systemp --raw"'
  echo
fi

for i in /sys/class/thermal/thermal_zone*; do
  temp=$(cat "$i/temp")
  if $raw_mode; then
    echo "$(basename "$i") temp: ${temp} m°C" - "(millidegree)"
  else
    echo "$(basename "$i") temp: $((temp / 1000))°C" 
  fi
done
