#!/bin/bash
source "$(dirname "$0")/../shared/notify.sh"

title="Meal Reminder"
msg="Take time to eat.\nAvoid skipping meals."

notify "$title" "$msg"
