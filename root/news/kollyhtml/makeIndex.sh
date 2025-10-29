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
  for file in $d/*.xhtml
  do
    title=$(sed 's/xmlns=".*"//g' $file | xmllint --xpath '/html/head/title/text()' -)
    date=$(sed 's/xmlns=".*"//g' $file | xmllint --xpath '//div[@class="knewsbody"]/p[last()]/text()' - | tail -1)
#     date=$(sed 's/xmlns=".*"//g' $file | xmllint --xpath '//div[@class="knewsbody"]/text()' - | tail -1)
    date=${date:0:8}
    echo -ne "\t\t<li>$date: <a href='$file'>$title</a></li>\n"
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
