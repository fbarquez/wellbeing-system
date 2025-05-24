#!/bin/bash

notify() {
  local title="$1"
  local message="$2"

  DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus \
  zenity --info --title="$title" --text="$message" --width=350 --timeout=10
}
