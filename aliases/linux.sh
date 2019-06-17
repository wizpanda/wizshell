#!/usr/bin/env bash

# Navigation
alias work='cd $WORK_DIRECTORY/'
alias b='cd ../'        # Go to parent directory
alias p='cd -'          # Go to previous directory
alias ll='ls -alh'
alias op='xdg-open '    # Open a particular file or directory "op xyz.pdf"
alias dbs='cd $WORK_DIRECTORY/database-backups'
alias mkcd='foo(){ mkdir -p "$1"; cd "$1" }; foo '

alias eb='exec bash'        # When someone is using zsh and want to switch to bash
alias hi='history | grep'
alias recent='ls -lt | head -10'

# Vim
alias v='vim'
alias rc='vim ~/.bashrc'
alias zc='vim ~/.zshrc'
alias al='vim ~/.bash_aliases'

alias bashr='source ~/.bashrc'
alias zshr='source ~/.zshrc'
