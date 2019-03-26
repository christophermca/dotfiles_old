#!/bin/sh

export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nano

# ----------
HISTCONTROL=ignoreboth
export DOTFILES="$HOME/Repos/dotfiles"
export TERM="xterm-256color"
export EDITOR='vim'
#export DISPLAY=:0
export CHROME_PATH="$Cdrive/Program\ Files\ \(x86\)/Google/Chrome"
alias launchchrome=$CHROME_PATH
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
