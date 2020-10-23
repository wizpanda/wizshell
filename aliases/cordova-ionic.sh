#!/usr/bin/env bash

# Cordova
alias cr='cordova '
alias crun='cr run '
alias crb='cr build'

# Ionic related aliases
alias i='ionic'
alias ic='i cordova'
alias icrun='i cordova run'
alias icb='i cordova build'
alias icp='i cordova prepare'
alias is='i serve'

alias crpt='cordova platform'
alias crpta='cordova platform add'
alias crptr='cordova platform remove'

alias crpl='cordova plugin'
alias crpla='cordova plugin add'
alias crplr='cordova plugin remove'
alias crplu='upgradePlugin(){ cplr $1; cpla $1 }; upgradePlugin'

alias icpt='ionic cordova platform'
alias icpta='ionic cordova platform add'
alias icptr='ionic cordova platform remove'

alias icpl='ionic cordova plugin'
alias icpla='ionic cordova plugin add'
alias icplr='ionic cordova plugin remove'
alias icplu='upgradePlugin(){ icplr $1; icpla $1 }; upgradePlugin'
