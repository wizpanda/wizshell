#!/bin/bash -e

if [[ ! $1 ]]; then
    echo -e "${RED}Please provide a tag name to delete locally & from remote.${NONE}"
    exit 1
fi

set -x;

git tag -d $1
git push --delete origin $1