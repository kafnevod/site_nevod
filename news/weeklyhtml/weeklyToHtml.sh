#!/bin/bash

set -o noglob

inFile=$1
outFile="$inFile.xhtml"

exec < $inFile

outHTML="<!DOCTYPE HTML PUBLIC -//W3C//DTD HTML 4.0 Transitional//EN>
<META HTTP-EQUIV='Content-Type' CONTENT='text/html; charset=utf-8'>
<HTML>
<HEAD>
<TITLE>Weekly-Quickly $inFile</TITLE>
</HEAD>

<BODY BACKGROUND='../../../Images/net-bg.jpg'>
<BR>
<TABLE CELLSPACING=3 CELLPADDING=1 BORDER=0>
"

read interval

outHTML+="
<TR>
    <TD>
    <BR> <BR>
    </TD>
    <TD>
<CENTER>
<FONT size=+1><B>Weekly-Quickly</B></FONT>
<BR>
<I>$interval</I><BR>
</CENTER>

<BR>
    </TD>
    <TD>
    <BR> <BR>
    </TD>
</TR>
"

read str

n=0
while [ -z "$str" ]
do
  read str
  let n+=1
  if [ $n -gt 1 ]
  then
    exit
  fi
done


head=$str
# echo "INTERVAL=$interval HEAD=$str"


while read str
do
#   body+="$str"
  while [ -n "$str" ]
  do
#     echo "STR=$str"
#     echo $str | od -c
    body+="$str"
    read str
  done
#   echo "HEAD=$head BODY=$body"
  outHTML+="<TR>
    <TD BGCOLOR=#9A9ACC>
    <BR> <BR>
    </TD>
    <TD><CENTER>
    <BR>
<B>$head</B></FONT>
<BR><FONT SIZE=-1>$body</FONT>
    </TD>
    <TD BGCOLOR=#9A9ACC>
    <BR> <BR>
    </TD>
</TR>
"
  body=''
  n=0
  while [ -z "$str" ]
  do
    read str
    let n+=1
    if [ $n -gt 1 ]
    then
      break
    fi
  done
  head=$str
done

outHTML+="</TABLE>
<BR>
<BR>


</BODY>
</HTML>
"
echo $outHTML |
tidy --output-xhtml true - 2>/dev/null  > $outFile
