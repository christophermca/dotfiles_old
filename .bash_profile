#!/bin/bash

# Load .bashrc, containing non-login related bash initializations.
source ~/.bashrc

# Load .profile, containing login, non-bash related initializations.
source ~/.profile

# Load .workrc, containing only work related bash config and initializations.
if [ -e "$HOME/.workrc" ]; then
   source ~/.workrc;
fi

# start ssh-agent
if [ ! -v $SSH_AGENT_PID ]; then
  eval "$(ssh-agent -s)" >> /dev/null
fi


if [ -e "$HOME/.bin/attach.bash" ]; then
  source ~/.bin/attach.bash
fi

# PATH
export PATH="/usr/bin:/usr/sbin:/bin:/sbin"
export PATH="$HOME/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:~/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.linuxbrew/bin:/home/cmcadams/.linuxbrew/sbin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"

#RBENV
eval "$(rbenv init - --no-rehash)"

# git bash_completion
if command -v brew > /dev/null ; then

  if [ -f `brew --prefix`/etc/bash_completion ]; then
     . `brew --prefix`/etc/bash_completion
  fi

  # bash-git-prompt
  if [ -f `brew --prefix`/opt/bash-git-prompt/share/gitprompt.sh ]; then
    source `brew --prefix`/opt/bash-git-prompt/share/gitprompt.sh
  fi
fi

export SSH_ASKPASS=ssh_askpass

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# aliases
alias .bash_profile='vim $HOME/.bash_profile'
alias restartBash=restart_bash_profile

#Functions
save_bash_profile() {
  if [ -e "$HOME/Repos/dotfiles" ]; then
    cp ~/.bash_profile ~/Repos/dotfiles/.bash_profile
    cd ~/Repos/dotfiles
    #git add .bash_profile
    #git commit -m 'update bash_profile'
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

restart_bash_profile() {
  local readonly OPTIONS=$1
  if [[ $1 == '--login' || $1 == '-l' ]]; then
    reset && . ~/.bash_profile
  else
    reset && . ~/.bashrc
  fi
}

# Load .tmuxinator, containing tmuxinator logic
 if [ -e "$HOME/.bin/tmuxinator.bash" ]; then
   source ~/.bin/tmuxinator.bash
   alias mux=tmuxinator
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

