#!/bin/sh

for f
do
  dir=$(dirname $f)
  file=$(basename $f .html)
  outFile="$dir/$file.xhtml"
  echo "$f -> $outFile"
  fgrep -v 'AREA
MAP' $f |
  sed -e 's|/Images|../../../Images|g' |
  tidy --output-xhtml true - 2>/dev/null > $outFile
done
