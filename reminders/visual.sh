#!/bin/bash
source "$(dirname "$0")/../shared/notify.sh"

title="Eye Break"
msg="Pause and look away for 20 seconds.\nRelax your eyes."

notify "$title" "$msg"

