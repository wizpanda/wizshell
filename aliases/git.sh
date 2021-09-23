#!/usr/bin/env bash

# Use base from https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git#aliases

# Branch/tag/commit related
## Reset all changes including the untracked changes
alias gr='git reset --hard && git clean -fd'
## Delete last commit
alias gdc='git reset --soft HEAD~1'

alias gcp='git cherry-pick'
alias gco='git checkout'
alias gs='git status'
alias gd='git diff --color'
alias gdel='git push origin --delete'
alias gsu='git submodule update --init'
alias gm='git merge'

# Cleaning related
alias gclean='git clean -fd'
alias gdelrbr='git remote prune origin'
## Clean everything - merged branches, untracked files, unstashed changes, merged remote branches
alias grepoclean='gr && gclean && gdelrbr'

# Tag related
alias gt='git tag'
alias gta='git tag -a'
#alias gts='git tag --sort=creatordate'
alias gts='git for-each-ref --format="%(color:bold yellow)%(refname:short) %(color:bold blue)%(creatordate) %(color:bold red)%(*authorname)" refs/tags'
## Delete a tag locally and from remote if available
alias gtd='$WIZSHELL_DIRECTORY/private-scripts/git-delete-tag.sh'

# Branch related
alias gb='git branch'
## Delete the local branch and remote tracking branch (useful when remote branch was rebased)
# shellcheck disable=SC2142
alias gbD='deleteBranch() { gb -D "$1" || true && gb -Dr origin/"$1" }; deleteBranch'
## Delete all local branches that are merged
alias gdelbr='git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -D'
## Checkout to a new branch/tag (pull the branch/tag from remote if not available)
alias gc='$WIZSHELL_DIRECTORY/private-scripts/git-checkout.sh'

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
alias gl1="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=iso --branches"
alias gl2='git log --graph --pretty=oneline --abbrev-commit'
alias gl3="git log --pretty=format:'%Cred%ad%Creset %C(yellow)%h%Creset by %C(bold blue)%an%Creset, %s' --date=iso | sort -r | less"
alias gl4='git log --all --decorate --oneline --graph'

# Rebase related
alias gbase='git rebase'
alias gbasec='git rebase --continue'
alias gbasea='git rebase --abort'
