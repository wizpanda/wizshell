#!/usr/bin/env bash

alias n='npm '
alias ni='npm install'
alias nig='npm install -g'
alias nu='npm uninstall'
alias nug='npm uninstall -g'
alias ns='npm start'
alias nx='npx'

# Run related
alias nr='npm run'
alias nrs='nr start'

# Version related
alias nver='npm version'
alias nverp='nver patch -m "release: v%s" -f'
alias nvermi='nver minor -m "release: v%s" -f'
alias nverma='nver major -m "release: v%s" -f'
alias npub='npm publish --access public'
