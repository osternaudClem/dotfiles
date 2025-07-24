#!/bin/bash

sketchybar --add item volume right \
    --set volume \
    icon.color=0xff8aadf4 \
    label.drawing=true \
    script="$PLUGIN_DIR/volume.sh" \
    --subscribe volume volume_change