# generic profile rc used for all shells not just bash

#!/bin/sh
HISTCONTROL=ignoreboth
export DOTFILES="$HOME/Repos/dotfiles"
export TERM="xterm-256color"
export EDITOR='vim'
export DISPLAY=:0
attach() {
  if type "tmux" > /dev/null; then

    local SESSION=$1
    local readonly GREEN=$(tput setaf 2)
    local readonly NORMAL=$(tput sgr0)

    if [ $# -eq 0 ]; then
      tmux ls >> /dev/null 2>&1
      if [ $? -eq 0 ]; then
        printf "${GREEN}list:________\n${NORMAL}";
        tmux ls -F '#{session_name}'
        printf "\n\nWhat session would you like to attach? " -n
        read SESSION
        $(tmux attach -d -t $SESSION)
      else
        printf "${GREEN}No sessions created\n${NORMAL}"
      fi

    else
      if [ $? -ne 0 ]; then
        $(tmux attach -d -t $SESSION)
      else
        printf "ERR: Could not find session \`${SESSION}\`\n"
      fi
    fi
  fi
}

remaster() {
  local readonly CURRENTBRANCH=$(git symbolic-ref --short HEAD)

  git fetch --all

  if [[ -n "$CURRENTBRANCH" ]]; then
    if [[ "$CURRENTBRANCH" != "master" ]]; then
      git checkout master
      git reset --hard upstream/master
      git push origin master --no-verify
      git checkout $CURRENTBRANCH
      git pull --rebase upstream master
    else
      git reset --hard upstream/master
    fi
  fi
}


