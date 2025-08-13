#!/bin/zsh
zshrc() {
   echo "
  ZSHRC
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

bindkey -v

# aliases
alias .zshrc='vim $HOME/.zshrc'

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
alias restartBash="reset && exec zsh"
alias restartZsh=restartBash

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

  # check if remote 'upstream' exists
  git remote | grep 'upstream';

  if [ $? -eq 0 ]; then
	  REMOTE='upstream'
  else
	  REMOTE='origin'
  fi

  # if current branch isnt master
  if [[ -n "$CURRENTBRANCH" ]]; then
    if [[ "$CURRENTBRANCH" != "master" ]]; then
      git checkout master
      # get latest
      git reset --hard $REMOTE/master

      # if forked repository update origin
       if [[ $REMOTE == 'upstream' ]]; then
         read -p "should I update origin/master? (y/n)" response
         if [[ $response == 'y' ]]; then
           echo $response
           # git push origin master -n
         fi
       fi

      git checkout $CURRENTBRANCH
      # git pull --rebase $REMOTE master
    else
      # get latest
      # git reset --hard $REMOTE/master
      echo 'git reset --hard $REMOTE/master'
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

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{green}%*::%n%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f %(!.#.$) '
