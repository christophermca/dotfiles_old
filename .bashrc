#!/bin/bash
function bashrc() {
   echo "
  BASHRC
  --------------

  ALIASES
  --------------

    GIT
    --------------
    gst .............. git status
    grea ............. git pull
    gwr .............. git commit -am
    co ............... git checkout
    graph ............ git graph
    reb .............. git rebase
    rebi ............. git rebase -i
    rebc ............. git rebase --continue
    rem  ............. alias for remaster
    grst ............. git ReSeTs git branch with upstream/master

    NGINX
    --------------
    ngxS  ............ sudo nginx
    ngxK  ............ sudo nginx -s stop
    ngxR  ............ sudo nginx -s reload

    BASH
    --------------
    copy  ............ copies output
    restartBash  ..... restarts bash from bash_profile as source
    psg  ............. process grep

  FUNCTIONS
  --------------
    GIT
    --------------
    remaster ......... Function git rebase upstream master

    TMUX
    --------------
    attach  ......... runs tmux attach

   ";
};


# aliases
alias gst='git status'
alias gpu='git pull'
alias gw='git commit -am'
alias co='git checkout'
alias graph='git log --oneline --graph --abbrev-commit --pretty=format:"%Cgreen %h %Creset%s %n%an - %cr %n%n"'
alias reb='git rebase'
alias rebc='git rebase --continue'
alias ngxS='sudo nginx'
alias ngxK='sudo nginx -s stop'
alias ngxR='sudo nginx -s reload'
alias rem='remaster'

alias copy="tr -d '\n' | pbcopy"
alias restartBash="source ~/.bash_profile"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

attach() {
  if type "tmux" > /dev/null; then
    SESSION=$1
    BLUE=$(tput setaf 4)
    NORMAL=$(tput sgr0)

    if [ $# -eq 0 ]
    then
      printf "${BLUE}list:________\n${NORMAL}";
      tmux ls
      printf "\n\nWhat session would you like to attach? " -n
      read SESSION
    fi

      echo $SESSION
     $(tmux attach -d -t $SESSION)
  fi
}

function remaster() {
  git co master
  git fetch --all
  git reset --hard upstream/master
  git push
  git co -
  git rebase master
}

if [ -f "/Applications/Karabiner.app/Contents/Library/bin/karabiner" ]; then
   alias karabiner='/Applications/Karabiner.app/Contents/Library/bin/karabiner'
fi

# _NOTES FOR TERMINAL COLORS_

# BLACK=$(tput setaf 0)
# RED=$(tput setaf 1)
# GREEN=$(tput setaf 2)
# YELLOW=$(tput setaf 3)
# LIME_YELLOW=$(tput setaf 190)
# POWDER_BLUE=$(tput setaf 153)
# BLUE=$(tput setaf 4)
# MAGENTA=$(tput setaf 5)
# CYAN=$(tput setaf 6)
# WHITE=$(tput setaf 7)
# BRIGHT=$(tput bold)
# NORMAL=$(tput sgr0)
# BLINK=$(tput blink)
# REVERSE=$(tput smso)
# UNDERLINE=$(tput smul)
