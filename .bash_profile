# profile configuration specific to bash

#!/bin/bash

### TODO move symlink work to a new file
## symlink dotfiles
# Checks for bash dot files
if [ ! -L "$HOME/.profile" ]; then
  ln -fs ~/Repos/dotfiles/.profile ~/.profile
fi

if [ ! -L "$HOME/.bashrc" ]; then
  ln -fs ~/Repos/dotfiles/.bashrc ~/.bashrc
fi

if [ ! -L "$HOME/.inputrc" ]; then
  ln -fs ~/Repos/dotfiles/.inputrc ~/.inputrc
fi

# Checks for vim dot files/folders
if [ ! -L "$HOME/.vim" ]; then
  ln -s ~/Repos/dotfiles/.vim/ ~/.vim
fi

if [ ! "$HOME/.vimrc" ]; then
  ln -s ~/Repos/dotfiles/.vim/.vimrc ~/.vimrc
fi

if [ ! -L "$HOME/.vundle" ]; then
  ln -fs ~/Repos/dotfiles/.vundle ~/.vundle
fi

# Checks for git dot files
if [ ! -L "$HOME/.gitconfig" ]; then
  ln -fs ~/Repos/dotfiles/.gitconfig ~/.gitconfig
fi

# Checks for git dot files
if [ ! -L "$HOME/.tern-config" ]; then
  ln -fs ~/Repos/dotfiles/.tern-config ~/.tern-config
fi

# Checks for tmux dot files
if [ ! -L "$HOME/.tmux.conf" ]; then
  ln -fs ~/Repos/dotfiles/.tmux.conf ~/.tmux.conf
fi


# Load .bashrc, containing non-login related bash initializations.
source ~/.bashrc

# Load .profile, containing login, non-bash related initializations.
source ~/.profile

# Load .workrc, containing only work related bash config and initializations.
if [ -e "$HOME/.workrc" ]; then
   source ~/.workrc;
fi

#rbenv
eval "$(rbenv init - --no-rehash)"

#start ssh-agent
if [ ! -v $SSH_AGENT_PID ]; then
  eval "$(ssh-agent -s)" >> /dev/null
fi

# Load .tmuxinator, containing tmuxinator logic
# if [ -e "$HOME/.bin/tmuxinator.bash" ]; then
#   source ~/.bin/tmuxinator.bash
# fi

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
export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
export PATH="/mnt/c/ProgramData/chocolatey/bin:$PATH"

#NVM
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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

#Functions
save_bash_profile() {
  if [ -e "$HOME/Repos/dotfiles" ]; then
    cp ~/.bash_profile ~/Repos/dotfiles/.bash_profile
    cd ~/Repos/dotfiles
    git add .bash_profile
    git commit -m 'update bash_profile'
  fi
}
