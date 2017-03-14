This repository contains the source code of 'Ondersteunende Software Verkiezingen' as published by
the Dutch Kiesraad in their [publications](https://www.kiesraad.nl/adviezen-en-publicaties?trefwoord=broncode&periode-van=&periode-tot=&type=Alle+adviezen+en+publicaties).

In order to minimize the diff between commits, the following changes were applied on the files from
each archive:
  * Windows line endings are changed to Unix
  * Tabs are converted to four spaces

```
# Use Swiff File Knife for file manipulation
sfk remcr -dir src -file .java .properties .xml .xslt .jsp .js .css .txt .prefs -yes
sfk detab=4 src .java .properties .xml .xslt .jsp .js .css .txt .prefs -yes
```
