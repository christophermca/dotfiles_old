#!/bin/sh

echo 'Starting Setup'

echo 'symlinking dotfiles'

## symlink dotfiles
if [ ! -L "$HOME/.bash_profile" ]; then
  ln -fs ./.bash_profile ~/.bash_profile
fi

if [ ! -L "$HOME/.profile" ]; then
  ln -fs ./.profile ~/.profile
fi

if [ ! -L "$HOME/.bashrc" ]; then
  ln -fs ./.bashrc ~/.bashrc
fi

if [ ! -L "$HOME/.inputrc" ]; then
  ln -fs ./.inputrc ~/.inputrc
fi

if [ ! -L "$HOME/.vim" ]; then
  ln -fs ./.vim/ ~/.vim
fi

if [ ! "$HOME/.vimrc" ]; then
  ln -fs ./.vim/.vimrc ~/.vimrc
fi

if [ ! -L "$HOME/.gitconfig" ]; then
  ln -fs ./.gitconfig ~/.gitconfig
fi

if [ ! -L "$HOME/.tern-config" ]; then
  ln -fs ./.tern-config ~/.tern-config
fi

if [ ! -L "$HOME/.tmux.conf" ]; then
  ln -fs ./.tmux.conf ~/.tmux.conf
fi

if ! command -v 'brew' >> /dev/null; then
  # TODO Do I need to run this in a subshell?
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
fi

if command -v 'brew' >> /dev/null; then
  brew install ack
fi

echo 'Complete!'
