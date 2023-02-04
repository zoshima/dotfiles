#!/bin/bash
timeout=$((15*60000))
idle=$(sudo -u kdi /usr/bin/xprintidle)

if (( $idle > $timeout )); then
  systemctl suspend
fi
