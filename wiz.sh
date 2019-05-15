#!/usr/bin/env bash

# To display colored usage of any output:
export NONE='\033[00m'
export RED='\033[01;31m'
export GREEN='\033[01;32m'
export YELLOW='\033[01;33m'
export BLUE='\e[0;36m'
export BOLD='\033[1m'
export UNDERLINE='\033[4m'

# Do necessary changes

export WIZSHELL_DIRECTORY=${WORK_DIRECTORY}/wizshell
export DB_BACKUP_DIRECTORY=${WORK_DIRECTORY}/database-backups
export PATH="$WIZSHELL_DIRECTORY/scripts:$PATH"

# Register all aliases

aliasFiles=(cordova-ionic firebase git gradle grails linux mongodb mysql nginx npm react tomcat utils)

for i in ${aliasFiles}; do
    . ${WIZSHELL_DIRECTORY}/aliases/${i}.sh
done

# Make sure database-directory exists
mkdir -p ${DB_BACKUP_DIRECTORY}