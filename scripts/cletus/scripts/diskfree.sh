#!/bin/bash

# -----------------------------------------------------
# Define thresholds for color indicators
# -----------------------------------------------------

threshold_green=50
threshold_orange=75
threshold_red=100

# -----------------------------------------------------
# Get disk usage statistics (replace / with your desired mount point if needed)
# -----------------------------------------------------

MOUNT_POINT="/"

df_output=$(df -h $MOUNT_POINT | awk 'NR==2 {print $5, $3 "/" $2}')

# Extract percentage and used/total from the output
percentage=$(echo "$df_output" | cut -d' ' -f1 | tr -d '%')
used_total=$(echo "$df_output" | cut -d' ' -f2)

# -----------------------------------------------------
# Define CSS class based on thresholds
# -----------------------------------------------------

css_class="green"

if [ "$percentage" -ge $threshold_orange ]; then
    css_class="red"
elif [ "$percentage" -ge $threshold_green ]; then
    css_class="orange"
fi

# -----------------------------------------------------
# Print the JSON formatted string for Waybar
# -----------------------------------------------------

printf '{"text": "%s%%", "alt": "%s", "tooltip": "%s", "class": "%s"}' "$percentage" "$percentage" "$used_total ($percentage%)" "$css_class"