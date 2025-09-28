#!/bin/bash
export RELPATH=$(dirname $0)/../..

command -v 'menubar' 2>/dev/null 1>&2 || alias menubar="$RELPATH/menubar"

WIFI_PORT=$(networksetup -listallhardwareports | awk '/Hardware Port: Wi-Fi/{getline; print $2}')
WIFI=$(ipconfig getsummary $WIFI_PORT | awk -F': ' '/ SSID : / {print $2}')

if [[ "$WIFI" == *"redacted"* ]] && [[ -x ~/Applications/wifi-unredactor.app/Contents/MacOS/wifi-unredactor ]]; then
  WIFI=$(~/Applications/wifi-unredactor.app/Contents/MacOS/wifi-unredactor 2>/dev/null | jq -r '.ssid // "<redacted>"' 2>/dev/null)
fi

### Depending on click type, show wifi popup or deactivate wifi 

if [[ $BUTTON == "left" ]]; then
  menubar -s "Control Center,WiFi"
else
  if [[ $WIFI != "" ]]; then
    sudo ifconfig $WIFI_PORT down
  else
    sudo ifconfig $WIFI_PORT up
  fi
fi
