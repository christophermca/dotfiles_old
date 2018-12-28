#!/bin/bash

# aliases
alias .bashrc='vim $HOME/.bashrc'

###
# GIT aliases
###

alias graph='git log --oneline --graph --abbrev-commit --pretty=format:"%Cgreen %h %Creset%s %n%an - %cr %n%n"'
alias rem='remaster'
alias reb='git rebase'
alias rebc='git add . && git rebase --continue'
alias rebs='git rebase --skip'
alias fix='vim `git diff --name-only | uniq | xargs`'

# alias copy="tr -d '\n' | pbcopy"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

