#!/usr/bin/env bash

alias ip='ifconfig -a | grep "168\|172"'
alias js='ps -A | grep java'       # List all Java processes
alias server='python -m SimpleHTTPServer'       # Start a Simple http server to serve files
alias tz='sudo dpkg-reconfigure tzdata'      # Modify timezone
alias tt="export PS1='\u@\h: '"              # Short the current path
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"