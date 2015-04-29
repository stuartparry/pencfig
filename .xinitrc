!/bin/bash

### Set directory for extra fonts to be used by X ###
xset +fp /usr/share/fonts/local
xset fp rehash

if [ "$1" == "openbox-session" ]; then
  export BROWSER=firefox
  export DE=openbox
elif [ "$1" == "dwm" ]; then
  export DE=dwm

  while true; do
    # Power/Battery
    if [ "$(cat /sys/class/power_supply/ADP1/online )" -eq "1" ]; then
      DWM_PWRSRC="AC"
      DWM_BATTERY="$(( `cat /sys/class/power_supply/BAT1/charge_now` * 100 / `cat /sys/class/power_supply/BAT1/charge_full` ))%";
      DWM_RENEW_INT=3;
    else
      DWM_PWRSRC="BAT"
      DWM_BATTERY="$(( `cat /sys/class/power_supply/BAT1/charge_now` * 100 / `cat /sys/class/power_supply/BAT1/charge_full` ))%";
      DWM_RENEW_INT=30;
    fi;

    # WiFi
    if [ "$( cat /sys/class/net/wlan0/operstate )" = "up" ]; then
      DWM_ESSID=$( /sbin/iwgetid -r );
    else
      DWM_ESSID="OFF";
    fi;

    # Volume
    DWM_VOLUME=$( amixer -c0 sget Master | awk -vORS=' ' '/Mono:/ {print($6$4)}' );

    # Date/Time
    DWM_CLOCK=$( date '+%a %e %b %Y | %k:%M' );

    # Output
    DWM_STATUS="Wifi: [$DWM_ESSID] | Power: [$DWM_PWRSRC] [$DWM_BATTERY] | Vol: $DWM_VOLUME | $DWM_CLOCK";
    xsetroot -name "$DWM_STATUS";
    sleep $DWM_RENEW_INT;

  done &

elif [ "$1" == "qtile" ]; then
  export DE=qtile
fi

xbacklight -set 40 &
nitrogen --restore &
exec $1
udiskie &...
