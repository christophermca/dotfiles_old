#!/bin/bash
HISTCONTROL=ignoreboth
EDITOR='vim'
export EDITOR;

# $PATH
export PATH="./node_modules/.bin:$PATH"
export PATH="$HOME/bin:$PATH"

# python
#export PROJECT_HOME=~/.virutalenv
#export PROJECT_HOME=~/pyve
#source /usr/local/bin/virtualenvwrapper.sh

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


