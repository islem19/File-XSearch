#!/bin/bash
#The following script is to copy the command line and man page in your system

#copy the xsearch to /usr/bin
sudo cp $(pwd)/xsearch.sh /usr/bin/xsearch
sudo chmod 0755 /usr/bin/xsearch
#copy the man page to the right target man(1)
sudo cp $(pwd)/man/xsearch.1 /usr/share/man/man1/xsearch.1
sudo gzip /usr/share/man/man1/xsearch.1
sudo mandb