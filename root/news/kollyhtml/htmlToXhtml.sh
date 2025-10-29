#!/bin/sh
for d in 2???.html
do
  D=$(basename $d .html)
  mkdir -p $D
  for FileOld in $d/*.html
  do
    file=$(basename $FileOld .html)
    FileNew="$D/$file.xhtml"
    echo  "$FileOld -> $FileNew"
    tidy --output-xhtml true  $FileOld > $FileNew 2>/dev/null
  done
done
