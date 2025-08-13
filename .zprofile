#!/bin/zsh
## symlink dotfiles

# Checks for bash dot files
if [ ! -L "$HOME/.zprofile" ]; then
  ln -fs ~/Repos/dotfiles/.zprofile ~/.zprofile
fi

if [ ! -L "$HOME/.bashrc" ]; then
  ln -fs ~/Repos/dotfiles/.zshrc ~/.zshrc
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

# Checks for workrc
if [ ! -L "$HOME/.workrc" ]; then
  ln -fs ~/Repos/dotfiles/.workrc ~/.workrc
fi

#if [ ! -L "$HOME/.tmuxinator" ]; then
#  ln -fs ~/Repos/dotfiles/.tmuxinator/ ~/.tmuxinator/
#fi

# Load .zshrc, containing non-login related shell initializations.
# source ~/.zshrc

# Load .envconfig, containing login
# source ~/.zshenv

# Load .cdtrc, containing only cdt related config
if [ -e "$HOME/.cdtrc" ]; then
   source ~/.cdtrc
fi

# Load .workrc, containing only work related bash config and initializations.
if [ -e "$HOME/.workrc" ]; then
   source ~/.workrc
fi

#rbenv
if [ command -v rbenv &> /dev/null ]; then
	eval "$(rbenv init -)"
fi

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

#PS1
parse_git_branch() {
 if [ -d .git ]; then
   git branch | sed -e '/^[^*]/d' | sed -e 's/* \(.*\)/(\1)/'
 fi
}
#<username> ::Green::[path] ::yellow:: git branch
export PS1="\u\[\033[32m\][\w]\[\033[00m\]\[\033[33m\]\$(parse_git_branch)\[\033[00m\] \$ " #For windows only

#NVM

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(/opt/homebrew/bin/brew shellenv)"
