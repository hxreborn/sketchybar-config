#!/bin/bash

SCRIPT_PATH="export PATH=$PATH; $RELPATH/plugins/caffeinate/script.sh"

caffeinate=(
  icon="󰛊"
  icon.color=$GOLD_MOON
  label.drawing=off
  label.font="$FONT:Regular:14.0"
  script="$SCRIPT_PATH"
  padding_left=0
  background.drawing=off
  update_freq=180
  updates=on
)

sketchybar --add item caffeinate right \
           --set caffeinate "${caffeinate[@]}" \
           --subscribe caffeinate mouse.clicked caffeinate_toggle system_woke