#!/bin/bash
HISTCONTROL=ignoreboth
EDITOR='vim'
export EDITOR;
set -o vi

# $PATH
export PATH="./node_modules/.bin:$PATH"
export PATH="$HOME/bin:$PATH"

# rbenv
eval "$(rbenv init -)"

# bash_completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
   . `brew --prefix`/etc/bash_completion
fi

# bash-git-prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
   source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi


