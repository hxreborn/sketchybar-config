#!/usr/bin/env bash

export RELPATH="$(dirname "${BASH_SOURCE[0]}")/../.."
if ! source "$RELPATH/set_colors.sh" 2>/dev/null; then
    echo "ERROR: Cannot source set_colors.sh from $RELPATH" >&2
    exit 1
fi

is_caffeinating() {
    pgrep -f "caffeinate -d" > /dev/null
}

update_display() {
    if is_caffeinating; then
        sketchybar --set "$NAME" icon="󰅶" icon.color="$CAFFEINATE_ACTIVE_COLOR"
    else
        sketchybar --set "$NAME" icon="󰛊" icon.color="$CAFFEINATE_INACTIVE_COLOR"
    fi
}

toggle_caffeinate() {
    if is_caffeinating; then
        pkill -f "caffeinate -d"
    else
        caffeinate -d > /dev/null 2>&1 &
    fi
}

case "$SENDER" in
    "mouse.clicked")
        toggle_caffeinate
        update_display
        ;;
    "caffeinate_toggle"|"system_woke"|*)
        update_display
        ;;
esac