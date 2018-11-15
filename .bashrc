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

    NGINX
    --------------
    ngxS (OFF) ............ sudo nginx
    ngxK  (OFF) ............ sudo nginx -s stop
    ngxR  (OFF) ............ sudo nginx -s reload

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

alias graph='git log --oneline --graph --abbrev-commit --pretty=format:"%Cgreen %h %Creset%s %n%an - %cr %n%n"'
alias rem='remaster'
alias reb='git rebase'
alias rebc='git add . && git rebase --continue'
alias rebs='git rebase --skip'
alias fix='vim `git diff --name-only | uniq | xargs`'

#alias copy="tr -d '\n' | pbcopy"
alias restartBash=restart_bash_profile

#Functions

restart_bash_profile() {
  local readonly OPTIONS=$1
  if [[ $1 == '--full' || $1 == '-f' ]]; then
    reset && . ~/.bash_profile
  else
    reset && . ~/.bashrc
  fi
}
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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

