#!/bin/bash

set -eu -o pipefail

workingd=$(pwd)
count=$(find $workingd -depth 1 -name "*.HEIC" | wc -l | sed 's/[[:space:]]*//')
echo "converting $count files .HEIC files to .jpg"

magick mogrify -monitor -format jpg *.HEIC

echo "Remove .HEIC files? [y/n]"
read remove

if [[ "$remove" == "y"]]; then
  find . -depth l -name "*.HEIC" -delete
fi

echo "Resize .jpg files? [y/n]"
read resize

if [[ "$resize" == "y" ]]; then
  for file in "*.jpg";  do
    convert $file -resize 200 $file
  done
fi
