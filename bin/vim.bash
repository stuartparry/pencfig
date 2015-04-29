#!/bin/bash
#
# a simple dmenu session script 
#
###

DMENU='dmenu -i -b -fn -xos4-terminus-medium-r-*--12-*-*-*-*-*-iso10646-1 -nb #000000 -nf #999999 -sb #000000 -sf #31658C'
filelist=`find ~/bin -print`
for file in $filelist; do 
    echo ${basename ${file}}
done

case "$choice" in
  logout) i3-msg exit & ;;
  shutdown) /usr/bin/systemctl poweroff & ;;
  reboot) /usr/bin/systemctl reboot & ;;
  lock) slock & ;;
esac
