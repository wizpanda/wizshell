#!/usr/bin/env bash

# Branch/tag/commit related related
alias gr='git reset --hard'             ## Reset all un-staged commits
alias gdc='git reset --soft HEAD~1'     ## Delete last commit

alias gcp='git cherry-pick'
alias gco='git checkout'
alias gc='$WIZSHELL_DIRECTORY/private-scripts/git-checkout.sh'
alias gdbrances='git branch --merged | grep -v \* | xargs git branch -D'    ## Delete all local branches that are merged
alias gs='git status'
alias gd='git diff --color'
alias gdel='git push origin --delete'
alias gm='git merge'
alias gt='git tag'
alias gts='git tag --sort=creatordate'
alias gtd='$WIZSHELL_DIRECTORY/private-scripts/git-delete-tag.sh'
alias gsu='git submodule update --init'
alias gb='git branch'

# Remote operation related
alias gpush='$WIZSHELL_DIRECTORY/private-scripts/git-push-pull.sh push'
alias gpull='$WIZSHELL_DIRECTORY/private-scripts/git-push-pull.sh pull'
alias gpta='git push --tags'
alias gremotes='git remote -v'
alias gra='git remote add'

# Stash related
alias gstash='git stash save'
alias gpop='git stash pop'
alias grestore='git stash apply'
alias gstashes='git stash list'

# Log related
alias gl='git log'
alias gl1="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative --branches"
alias gl2='git log --graph --pretty=oneline --abbrev-commit'
alias gl3='git log --pretty=format:"%ad %h by %an, %s" --date=iso | sort -r | less'
alias gl4='git log --all --decorate --oneline --graph'