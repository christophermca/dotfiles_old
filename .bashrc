#!/bin/bash

# aliases
alias .bashrc='vim $HOME/.bashrc'

###
# GIT aliases
###

GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_THEME=Solarized

alias graph='git log --oneline --graph --abbrev-commit --pretty=format:"%Cgreen %h %Creset%s %n%an - %cr %n%n"'
alias rem='remaster'
alias reb='git rebase'
alias rebc='git add . && git rebase --continue'
alias rebs='git rebase --skip'
alias fix='vim `git diff --name-only | uniq | xargs`'

# alias copy="tr -d '\n' | pbcopy"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
