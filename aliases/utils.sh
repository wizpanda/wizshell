#!/usr/bin/env bash

# Generate a random password "pass 10"
alias pass="openssl rand -base64"
# List all Java processes
alias js='ps -A | grep java'
# Start a Simple http server to serve files
alias server='python -m SimpleHTTPServer'
alias server3='python3 -m http.server 8000'
# Modify timezone
alias tz='sudo dpkg-reconfigure tzdata'
# Short the current path
alias tt="export PS1='\u@\h: '"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
