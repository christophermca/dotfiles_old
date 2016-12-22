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
    remaster ......... function git rebase upstream master

    TMUX
    --------------
    attach  ......... runs tmux attach

   ";
};


# aliases
alias .bashrc='vim $HOME/.bashrc'
alias gst='git status'
alias gpu='git pull'
alias gw='git commit -am'
alias graph='git log --oneline --graph --abbrev-commit --pretty=format:"%Cgreen %h %Creset%s %n%an - %cr %n%n"'
alias reb='git rebase'
alias rebc='git rebase --continue'
alias ngxS='sudo nginx'
alias ngxK='sudo nginx -s stop'
alias ngxR='sudo nginx -s reload'
alias rem='remaster'

alias copy="tr -d '\n' | pbcopy"
alias restartBash="source ~/.bash_profile && reset"
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
  local readonly CURRENTBRANCH=$(git rev-parse --abbrev-ref HEAD)

  git fetch --all

  if [ $CURRENTBRANCH != 'master' ]; then
    git checkout master
    git reset --hard upstream/master
    git push origin master
    git checkout $CURRENTBRANCH
    git pull --rebase upstream master

  else
    git reset --hard upstream/master

  fi

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
