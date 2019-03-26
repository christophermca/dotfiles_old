#!/bin/sh

export QT_QPA_PLATFORMTHEME="qt5ct"
# export EDITOR=/usr/bin/nano

# ----------
HISTCONTROL=ignoreboth
export DOTFILES="$HOME/Repos/dotfiles"
export TERM="xterm-256color"
export EDITOR=/usr/bin/vim
#export DISPLAY=:0
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
