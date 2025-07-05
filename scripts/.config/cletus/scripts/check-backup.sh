#!/usr/bin/env bash

# Check if backup file exists
if [ ! -f /media/data/endeavour-hyprland-full-backup.tar.gz ]; then
  printf '{"text": "No backup", "alt": "No backup", "tooltip": "No backup found", "class": "error"}'
  exit 1
fi

# Get the last modification time of the backup file
LAST_BACKUP_TIME=$(stat -c "%Y" /media/data/endeavour-hyprland-full-backup.tar.gz)
NOW=$(date +%s)
DIFF=$((NOW - LAST_BACKUP_TIME))

if [ $DIFF -lt 3600 ]; then
  updates="$(date -d @$LAST_BACKUP_TIME '+%I:%M %p')"
  css_class="recent"
elif [ $DIFF -lt 86400 ]; then
  updates="Yesterday at $(date -d @$LAST_BACKUP_TIME '+%I:%M %p')"
  css_class="yesterday"
else
  updates="$(date -d @$LAST_BACKUP_TIME '+%a, %B %e %Y, %I:%M %p')"
  css_class="old"
fi

printf '{"text": "%s", "alt": "%s", "tooltip": "Click to update your system", "class": "%s"}' "$updates" "$updates" "$css_class"