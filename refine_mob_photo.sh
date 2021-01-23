#!/bin/bash

set -eu -o pipefail

count=$(find . -depth 1 -name "*.HEIC" | wc -l | sed 's/[[:space:]]*//')
echo "converting $count files .HEIC files to .jpg"

magick mogrify -monitor -format jpg *.HEIC

echo "Remove .HEIC files? [y/n]"
read remove

if [[ "$remove" == "y"]]; then
  find . -depth l -name "*.HEIC" -delete
fi
