#!/bin/sh

for f in ????/*.html
do
  dir=$(dirname $f)
  file=$(basename $f .html)
  outFile="$dir/$file.xhtml"
  echo "$f -> $outFile"
  tidy --output-xhtml true $f 2>/dev/null > $outFile
done
