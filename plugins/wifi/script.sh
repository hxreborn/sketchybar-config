#!/bin/bash
export RELPATH=$(dirname $0)/../..;
source $RELPATH/set_colors.sh

ICON_HOTSPOT=􀉤
ICON_WIFI=􀙇
ICON_WIFI_OFF=􀙈

getname() {
  WIFI_PORT=$(networksetup -listallhardwareports | awk '/Hardware Port: Wi-Fi/{getline; print $2}')
  WIFI="$(system_profiler SPAirPortDataType | awk '/Current Network/ {getline;$1=$1; gsub(":",""); print;exit}')"

  # If SSID is redacted, try wifi-unredactor if available
  if [[ "$WIFI" == "<redacted>" ]]; then
    # Check for wifi-unredactor command in PATH
    if command -v wifi-unredactor &>/dev/null; then
      UNREDACTED=$(wifi-unredactor 2>/dev/null | jq -r '.ssid // empty')
      if [[ -n "$UNREDACTED" && "$UNREDACTED" != "failed to retrieve SSID" ]]; then
        WIFI="$UNREDACTED"
      fi
    # Check for wifi-unredactor app bundle
    elif [[ -x "$HOME/Applications/wifi-unredactor.app/Contents/MacOS/wifi-unredactor" ]]; then
      UNREDACTED=$("$HOME/Applications/wifi-unredactor.app/Contents/MacOS/wifi-unredactor" 2>/dev/null | jq -r '.ssid // empty')
      if [[ -n "$UNREDACTED" && "$UNREDACTED" != "failed to retrieve SSID" ]]; then
        WIFI="$UNREDACTED"
      fi
    fi
  fi

  HOTSPOT=$(ipconfig getsummary $WIFI_PORT | grep sname | awk '{print $3}')
  IP_ADDRESS=$(scutil --nwi | grep address | sed 's/.*://' | tr -d ' ' | head -1)

  if [[ $HOTSPOT != "" ]]; then
    ICON=$ICON_HOTSPOT
    ICON_COLOR=$GLOW
    LABEL=$HOTSPOT
  elif [[ $WIFI != "" ]]; then
    ICON=$ICON_WIFI
    ICON_COLOR=$SELECT
    LABEL="$WIFI"
  elif [[ $IP_ADDRESS != "" ]]; then
    ICON=$ICON_WIFI
    ICON_COLOR=$WARN
    LABEL="on"
  else
    ICON=$ICON_WIFI_OFF
    ICON_COLOR=$CRITICAL
    LABEL="off"
  fi

  wifi=(
    icon=$ICON
    label="$LABEL"
    icon.color=$ICON_COLOR
  )

  sketchybar --set $NAME "${wifi[@]}"
}

setscroll() {

	### For performances, only scroll on hover

	STATE="$(sketchybar --query $NAME | sed 's/\\n//g; s/\\\$//g; s/\\ //g' | jq -r '.geometry.scroll_texts')"

	case "$1" in
	"on")
		target="off"
		;;
	"off")
		target="on"
		;;
	esac

	if [[ "$STATE" == "$target" ]]; then
		sketchybar --set "$NAME" scroll_texts=$1
	fi

}

case "$SENDER" in
"mouse.entered")
	setscroll on
	;;
"mouse.exited")
	setscroll off
	;;
*)
	getname
	;;
esac
