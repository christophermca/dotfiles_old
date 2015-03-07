EDITOR='vim'
export EDITOR;

if [ -f `brew --prefix`/etc/bash_completion ]; then
       . `brew --prefix`/etc/bash_completion
fi

    eval "$(rbenv init -)"

source ~/.bin/tmuxinator.bash
source ~/.bash-git-prompt/gitprompt.sh
