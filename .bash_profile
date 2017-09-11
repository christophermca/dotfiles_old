#!/bin/bash
## symlink dotfiles

# Checks for bash dot files
if [ ! -L "$HOME/.profile" ]; then
  ln -s ~/Repos/dotfiles/.profile ~/.profile
fi

if [ ! -L "$HOME/.bashrc" ]; then
  ln -s ~/Repos/dotfiles/.bashrc ~/.bashrc
fi

if [ ! -L "$HOME/.inputrc" ]; then
  ln -s ~/Repos/dotfiles/.inputrc ~/.inputrc
fi

# Checks for vim dot files/folders
if [ ! -L "$HOME/.vim" ]; then
  ln -s ~/Repos/dotfiles/.vim/ ~/.vim/
fi

if [ ! -L "$HOME/.vimrc" ]; then
  ln -s ~/Repos/dotfiles/.vim/.vimrc ~/.vimrc
fi

if [ ! -L "$HOME/.vundle" ]; then
  ln -s ~/Repos/dotfiles/.vundle ~/.vundle
fi

# Checks for git dot files
if [ ! -L "$HOME/.gitconfig" ]; then
  ln -s ~/Repos/dotfiles/.gitconfig ~/.gitconfig
fi

# Checks for git dot files
if [ ! -L "$HOME/.tern-config" ]; then
  ln -s ~/Repos/dotfiles/.tern-config ~/.tern-config
fi

# Checks for tmux dot files
if [ ! -L "$HOME/.tmux.conf" ]; then
  ln -s ~/Repos/dotfiles/.tmux.conf ~/.tmux.conf
fi

if [ ! -L "$HOME/.tmuxinator" ]; then
  ln -s ~/Repos/dotfiles/.tmuxinator/ ~/.tmuxinator/
fi

# Load .bashrc, containing non-login related bash initializations.
source ~/.bashrc

# Load .profile, containing login, non-bash related initializations.
source ~/.profile

# Load .cdtrc, containing only cdt related config
if [ -e "$HOME/.cdtrc" ]; then
   source ~/.cdtrc
fi

# Load .workrc, containing only work related bash config and initializations.
if [ -e "$HOME/.workrc" ]; then
   source ~/.workrc
fi

#rbenv
eval "$(rbenv init -)"

# Load .tmuxinator, containing tmuxinator logic
if [ -e "$HOME/.bin/tmuxinator.bash" ]; then
  source ~/.bin/tmuxinator.bash
fi

if [ -e "$HOME/.bin/attach.bash" ]; then
  source ~/.bin/attach.bash
fi

# PATH
export PATH="/usr/bin:/usr/sbin:/bin:/sbin"
export PATH="~/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:~/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
#export PATH="$PYENV_ROOT/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
