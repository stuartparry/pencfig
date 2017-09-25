#!/bin/bash

### Set directory for extra fonts to be used by X ###
xset +fp /usr/share/fonts/local
xset fp rehash

### Turn off the insanely annoying system beep
xset -b

export ROTATE=False

### DE specific setup
if [ "$1" == "qtile" ]; then
  export DE=qtile
elif [ "$1" == "stumpwm" ]; then
  export ROTATE=wmrotate_stumpwm
elif [ "$1" == "xmonad" ]; then
  export ROTATE=wmrotate_xmonad
fi

### General startup config
xbacklight -set 40 &
amixer -q -c 0 sset Master 85% &
amixer -q -c 0 sset Headphone 90% &
amixer -q -c 0 sset Speaker 90% &
nitrogen --restore &
#udiskie &...

# Start WM or WM rotater script
if [ "$ROTATE" == "wmrotate_xmonad" ]; then
  /home/stuart/bin/wmrotate_xmonad & wmpid=$! 
  # Close X when wmrotate comes down
  wait $wmpid
elif [ "$ROTATE" == "wmrotate_stumpwm" ]; then
  /home/stuart/bin/wmrotate_stumpwm & wmpid=$! 
  # Close X when wmrotate comes down
  wait $wmpid
else
  exec $1
fi 

# Tidy up the cruft
