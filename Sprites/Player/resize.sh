#!/bin/sh

# Desired width and height
WIDTH=200
HEIGHT=200

# Loop through all SVG files in the current directory
for svg in *.svg; do
  # Create a backup (optional)
  cp "$svg" "$svg.bak"

  # Edit the `width` and `height` attributes in the <svg> tag
  sed -i -E "s/(<svg[^>]*)(width=\"[^\"]*\")/\1 width=\"$WIDTH\"/" "$svg"
  sed -i -E "s/(<svg[^>]*)(height=\"[^\"]*\")/\1 height=\"$HEIGHT\"/" "$svg"

  echo "Resized $svg to ${WIDTH}x${HEIGHT}"
done
