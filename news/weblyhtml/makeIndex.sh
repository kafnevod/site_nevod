#!/bin/sh

echo '<!DOCTYPE HTML PUBLIC -//W3C//DTD HTML 4.0 Transitional//EN>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">

<HTML>
<HEAD>
 <link REL='icon' HREF='../../Images/nevod.ico' TYPE='image/ico'>
 <link REL='stylesheet' TYPE='text/css' HREF='style.css'>
<TITLE>
КОЛ НА ГОЛОВЕ
</TITLE>
</HEAD>
<BODY BACKGROUND='../../Images/net-bg.jpg'>
<TABLE  WIDTH='480' CLASS='knews' ALIGN='center'>

<TR>
    <TD>
<CENTER>
<IMG SRC='../images/Kol.gif' WIDTH='150' HEIGHT='38' BORDER='0' ALT="кол-на-голове">
</CENTER>
<DIV CLASS='knews'>
'
echo "<ul>"
for d in 2???
do
  echo -ne "\t<li>$d\n"
  echo -ne "\t<ul>\n"
  for file in $d/*.html
  do
    title=$(tidy --output-xhtml true $file 2>/dev/null |
    sed -e 's|xmlns="http://www.w3.org/1999/xhtml"||' |
    xmllint  --xpath '/html/head/title/text()' -)
    echo -ne "\t\t<li><a href='$file'>$title</a></li>\n"
  done
  echo -ne "\t</ul>\n"
done
echo "</ul>"
echo '
</TD>
</TR>
</TABLE>
</BODY>
</HTML>'
