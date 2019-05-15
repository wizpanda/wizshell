#!/bin/bash -e

# Make "git push" & "git pull" commands handy

currentBranchName=$(git symbolic-ref --short -q HEAD)
remoteToUse=origin

if [[ $2 == "-f" ]]; then
    flags="-f "

    if [[ $3 ]]; then
        remoteToUse=$3
    fi
fi

if [[ $3 == "-f" ]]; then
    flags="-f "
    remoteToUse=$2
fi

echo -e "${GREEN}git $1 ${remoteToUse} ${flags}${currentBranchName} ${NONE}"

git $1 ${remoteToUse} ${flags} ${currentBranchName}
