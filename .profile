EDITOR='vim'
export EDITOR;

if [ -f `brew --prefix`/etc/bash_completion ]; then
       . `brew --prefix`/etc/bash_completion
fi

    eval "$(rbenv init -)"

source ~/.bin/tmuxinator.bash
source ~/.bash-git-prompt/gitprompt.sh

# bash
# No ttyctl, so we need to save and then restore terminal settings
vim()
{
   # osx users, use stty -g
   local STTYOPTS="$(stty --save)"
   stty stop '' -ixoff
   command vim "$@"
   stty "$STTYOPTS"
}
