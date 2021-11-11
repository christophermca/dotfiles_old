#!/bin/bash
HISTCONTROL=ignoreboth
EDITOR='vim'
export EDITOR;
DISPLAY=:0
export DISPLAY
export BASH_SILENCE_DEPRECATION_WARNING=1

  # python
#export PYTHONPATH="~/scripts/Wyndex"
#export PROJECT_HOME=~/.virutalenv
#export PROJECT_HOME=~/pyve
#source /usr/local/bin/virtualenvwrapper.sh


# git_completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# bash_completion
if command -v brew > /dev/null; then

  if [ -f `brew --prefix`/etc/bash_completion ]; then
     . `brew --prefix`/etc/bash_completion
  fi

  # bash-git-prompt
  if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
     source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
  fi

fi
