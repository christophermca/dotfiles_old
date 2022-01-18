#!/bin/bash
bashrc() {
   echo "
  BASHRC
  --------------
  .bashrc .............. alias for $HOME/.bashrc

  ALIASES
  --------------

    GIT
    --------------
    gst .............. git status
    gw ..............  git commit -am
    graph ............ git graph
    reb .............. git rebase
    rebc ............. git rebase --continue
    rebs ............. git rebase --skip
    rem  ............. alias for remaster
    fix  ............. opens all files with changes in editor

    BASH
    --------------
    copy  ............ copies output
    restartBash  ..... restarts bash from bash_profile as source
    psg  ............. process grep

  FUNCTIONS
  --------------
    GIT
    --------------
    remaster ......... function git rebase upstream master

    TMUX
    --------------
    attach  ......... runs tmux attach
   ";
};


# aliases
alias .bashrc='vim $HOME/.bashrc'

###
# GIT aliases
###

# alias gst='git status'
# alias gpu='git pull'
# alias gw='git commit -am'
alias graph='git log --oneline --graph --abbrev-commit --pretty=format:"%Cgreen %h %Creset%s %n%an - %cr %n%n"'
alias rem='remaster'
alias reb='git rebase'
alias rebc='git add . && git rebase --continue'
alias rebs='git rebase --skip'
alias fix='vim `git diff --name-only | uniq | xargs`'

alias copy="tr -d '\n' | pbcopy"
alias restartBash="reset && source ~/.bash_profile"

#Grep process
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

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
  git remote | grep 'upstream';

  if [ $? -eq 0 ]; then
	  REMOTE='upstream'
  else
	  REMOTE='origin'
  fi

  if [[ -n "$CURRENTBRANCH" ]]; then
    if [[ "$CURRENTBRANCH" != "master" ]]; then
      git checkout master
      git reset --hard $REMOTE/master

      ## if forked repository update origin
      # if [[ $REMOTE == 'upstream' ]]; then
      #   git push origin master --no-verify
      # fi

      git checkout $CURRENTBRANCH
      git pull --rebase $REMOTE master
    else
      git reset --hard $REMOTE/master
    fi
  fi

}

export TERM="xterm-256color"

# _NOTES FOR TERMINAL COLORS_

# BLACK=$(tput setaf 0)
# RED=$(tput setaf 1)
# GREEN=$(tput setaf 2)
# YELLOW=$(tput setaf 3)
# LIME_YELLOW=$(tput setaf 190)
# POWDER_BLUE=$(tput setaf 154)
# BLUE=$(tput setaf 5)
# MAGENTA=$(tput setaf 5)
# CYAN=$(tput setaf 6)
# WHITE=$(tput setaf 7)
# BRIGHT=$(tput bold)
# NORMAL=$(tput sgr0)
# BLINK=$(tput blink)
# REVERSE=$(tput smso)
# UNDERLINE=$(tput smul)

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
export NVM_DIR="/Users/cmcadams/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
