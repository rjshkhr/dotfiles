#!/bin/bash

if ! pidof swww-daemon > /dev/null; then
   swww init
fi

WALLPAPER_DIR="$HOME/Pictures/walls"

get_screen_dimensions() {
   hyprctl monitors -j | jq -r '.[0].width, .[0].height'
}

get_cursor_position() {
   hyprctl cursorpos -j | jq -r '.x,.y'
}

get_random_wallpaper() {
   find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | shuf -n 1
}

read -r screen_width screen_height < <(get_screen_dimensions)
center_pos="$((screen_width / 2)),$((screen_height / 2))"
cursor_pos=$(get_cursor_position)

WALLPAPER=$(get_random_wallpaper)
transitions=("grow" "outer" "simple" "wave" "wipe")
transition_type=${transitions[$RANDOM % ${#transitions[@]}]}

case $transition_type in
   "grow")
       swww img "$WALLPAPER" \
           --transition-fps 165 \
           --transition-type grow \
           --transition-duration 0.7 \
           --transition-pos "$cursor_pos" \
           --transition-bezier .54,0,.34,.99
       ;;
   "outer")
       swww img "$WALLPAPER" \
           --transition-fps 165 \
           --transition-type outer \
           --transition-duration 0.7 \
           --transition-pos "$center_pos" \
           --transition-angle 30 \
           --transition-bezier .54,0,.34,.99
       ;;
   "wave")
       swww img "$WALLPAPER" \
           --transition-fps 165 \
           --transition-type wave \
           --transition-duration 0.7 \
           --transition-angle 130 \
           --transition-pos "$center_pos"
       ;;
   "wipe")
       swww img "$WALLPAPER" \
           --transition-fps 165 \
           --transition-type wipe \
           --transition-duration 0.7 \
           --transition-angle 30 \
           --transition-bezier .54,0,.34,.99
       ;;
esac
