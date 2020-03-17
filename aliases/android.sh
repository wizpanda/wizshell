#!/usr/bin/env bash

alias adks='adb kill-server'
alias adins='adb install'

# adb logcat

alias adlog='adb logcat'
alias adlogg='adb logcat | grep'
alias adloge="adb logcat AndroidRuntime:E '*:S\'"

# adb devices
alias addvs='adb devices'
alias adcon='adb connect'

## Exampel "adcon 192.168.0.234" which will run the command "adb connect 192.168.0.234:5037"
# shellcheck disable=SC2142
alias adcon='adbConnection(){ adb connect $1:5037 }; adbConnection '

alias adtcp='adb tcpip 5037'

# adb shell

alias ads='adb shell'
