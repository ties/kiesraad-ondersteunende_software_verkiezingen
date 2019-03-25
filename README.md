This repository contains the source code of 'Ondersteunende Software Verkiezingen'
as published by the Dutch Kiesraad in their [publications](https://www.kiesraad.nl/adviezen-en-publicaties?trefwoord=broncode&periode-van=&periode-tot=&type=Alle+adviezen+en+publicaties).

In order to minimize the diff between commits, the following changes were
applied on the files from each archive:
  * Windows line endings are changed to Unix
  * Tabs are converted to four spaces

```
# Windows/OSX: Use Swiff File Knife for file manipulation
sfk remcr -dir src -file .java .properties .xml .xslt .jsp .js .css .txt .prefs -yes
sfk detab=4 src .java .properties .xml .xslt .jsp .js .css .txt .prefs -yes
# Linux:
find . -type f -regextype egrep -regex '.*\.(java|properties|xml|xslt|jsp|js|css|txt|prefs)'  -print0 | xargs -0 -n 1 -P 10 -IFILE bash -c ' ( echo "Processing FILE..." && expand -t 4 "FILE" > /tmp/expand.$$ && mv /tmp/expand.$$ "FILE" ) || exit 255'
find . -type f -regextype egrep -regex '.*\.(java|properties|xml|xslt|jsp|js|css|txt|prefs)'  -exec dos2unix {} \;
```
