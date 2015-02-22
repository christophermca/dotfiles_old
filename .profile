export PATH="/usr/local/bin:$HOME/.rbenv/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)

EDITOR='vim'
export EDITOR;

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

eval "$(rbenv init -)"

source ~/.bin/tmuxinator.bash
source ~/.bash-git-prompt/gitprompt.sh

