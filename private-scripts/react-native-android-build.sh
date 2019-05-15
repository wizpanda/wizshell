#!/bin/bash

RED='\033[01;31m'
GREEN='\033[01;32m'
NONE='\033[00m'

# This script will be used to create debug build for the react native app

echo -e "${GREEN} --------------------------------------------- ${NONE}"
echo -e "${GREEN} Build started for react native app ${NONE}"
echo -e "${GREEN} --------------------------------------------- ${NONE}"
echo -e "${GREEN}➤ Cleaning unused assets for android"
rm -rf ./android/app/src/main/res/drawable-hdpi/*
rm -rf ./android/app/src/main/res/drawable-mdpi/*
rm -rf ./android/app/src/main/res/drawable-xhdpi/*
rm -rf ./android/app/src/main/res/drawable-xxhdpi/*
rm -rf ./android/app/src/main/res/drawable-xxxhdpi/*

echo -e "${GREEN}➤ Bundling in process ${NONE}"
react-native bundle --platform android --dev false --entry-file index.js --bundle-output android/app/src/main/assets/index.android.bundle --assets-dest android/app/src/main/res

cd android

echo -e "${GREEN}➤ Starting android build ${NONE}"
./gradlew assembleDebug

cd app/build/outputs/apk/debug

size="$(ls -al | grep "app-debug.apk" | awk '{print $5 / 1024 /1024}') MB"
echo -e "${GREEN}➤ Generated APK size is: ${RED}${size} ${NONE} ${NONE}"

if [[ $1 == 'i' ]]; then
    adb install app-debug.apk
else
    # Open in finder to make it easy to find and host
    open .
fi
