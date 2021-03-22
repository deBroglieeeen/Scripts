#!/bin/bash

set -eu -o pipefail
agree="y"
workingd=$(pwd)
count=$(find $workingd -depth 1 -name "*.HEIC" | wc -l | sed 's/[[:space:]]*//')
echo "converting $count files .HEIC files to .jpg"

magick mogrify -monitor -format jpg *.HEIC

echo "Remove .HEIC files? [y/n]"
read remove

if [[ "$remove" == "$agree" ]]; then
  find . -depth 1 -name "*.HEIC" -delete
fi

echo "Resize .jpg files? [y/n]"
read resize

if [[ "$resize" == "$agree" ]]; then
  for file in "*.jpg";  do
    convert $file -resize 800 $file
  done
fi
