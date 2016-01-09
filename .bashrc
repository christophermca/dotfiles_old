#!/bin/bash

# aliases
alias gst='git status'
alias grea='git pull'
alias gwr='git commit -am'
alias co='git checkout'
alias newbr='git checkout -b'
alias graph='git log --oneline --graph --abbrev-commit --pretty=format:"%Cgreen %h %Creset%s %n%an - %cr %n%n"'
alias reb='git rebase'
alias rebc='git rebase --continue'
alias ngxS='sudo nginx'
alias ngxK='sudo nginx -s stop'
alias ngxR='sudo nginx -s reload'
alias copy="tr -d '\n' | pbcopy"

if [ -f "/Applications/Karabiner.app/Contents/Library/bin/karabiner" ]; then
   alias karabiner='/Applications/Karabiner.app/Contents/Library/bin/karabiner'
fi
