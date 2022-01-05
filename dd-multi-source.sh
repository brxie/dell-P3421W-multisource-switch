#!/bin/bash

DEVICE_ID="dev:/dev/i2c-7"

HDMI_SRC=17
DP_SRC=15

PRIM_SRC_REG=0x60
SEC_SRC_REG=0xe8


if [ "$1" == "on" ]; then
  sudo ddccontrol -r 0xe9 -w 6 $DEVICE_ID
  sleep 2
  sudo ddccontrol -r $PRIM_SRC_REG -w $HDMI_SRC $DEVICE_ID
  sleep 2
  sudo ddccontrol -r $SEC_SRC_REG -w $DP_SRC $DEVICE_ID
  exit 0
fi

if [ "$1" == "off" ]; then
  sudo ddccontrol -r 0xe9 -w 0 $DEVICE_ID
  sleep 2
  sudo ddccontrol -r $PRIM_SRC_REG -w $DP_SRC $DEVICE_ID
  sleep 2
  sudo ddccontrol -r $SEC_SRC_REG -w $HDMI_SRC $DEVICE_ID
  exit 0
fi


echo ERROR: unrecognized \'$1\' argument
exit 1
