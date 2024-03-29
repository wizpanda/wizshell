#!/usr/bin/env bash

# To display colored usage of any output:
export NONE='\033[00m'
export RED='\033[01;31m'
export GREEN='\033[01;32m'
export YELLOW='\033[01;33m'
export BLUE='\033[0;36m'
export BOLD='\033[1m'
export UNDERLINE='\033[4m'

# Do necessary changes

export WIZSHELL_DIRECTORY=${WORK_DIRECTORY}/wizshell
export DB_BACKUP_DIRECTORY=${WORK_DIRECTORY}/database-backups
export PATH="$WIZSHELL_DIRECTORY/scripts:$PATH"

# Register all aliases

aliasFiles=(angular android cordova-ionic ide firebase git gradle grails linux mongodb mysql nest nginx npm react
tomcat unix-network utils aws)

for i in "${aliasFiles[@]}"; do
    . ${WIZSHELL_DIRECTORY}/aliases/"$i".sh
done

# Print all aliases
export function all() {
    for i in "${aliasFiles[@]}"; do
        echo -e "\n${GREEN}${i} aliases${NONE}"
        # Install https://github.com/sharkdp/bat
        bat --paging=never ${WIZSHELL_DIRECTORY}/aliases/"$i".sh
    done

    echo -e "\n${GREEN}https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/README.md${NONE}"
}

if [[ "$(uname)" == "Darwin" ]]; then
    . ${WIZSHELL_DIRECTORY}/aliases/mac.sh
fi

# Make sure database-directory exists
mkdir -p ${DB_BACKUP_DIRECTORY}
