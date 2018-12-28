#!/bin/sh

echo 'Starting Setup'

## symlink dotfiles
if [ ! -L "$HOME/.bash_profile" ]; then
  ln -fs ~/Repos/dotfiles/.bash_profile ~/.bash_profile
fi

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

echo 'Complete!'
reset
