#!/bin/bash

sketchybar --add event spotify_change $SPOTIFY_EVENT \
    --add item spotify left \
    --set spotify \
    background.padding_left=4 \
    icon= \
    icon.y_offset=1 \
    icon.font="$FONT_FACE:Bold:20.0" \
    label.drawing=off \
    label.padding_left=3 \
    script="$PLUGIN_DIR/spotify.sh" \
    --subscribe spotify spotify_change mouse.clicked