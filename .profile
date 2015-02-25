export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
export PATH="$JAVA_HOME:usr/local/bin:$PATH"

EDITOR='vim'
export EDITOR;

if [ -f `brew --prefix`/etc/bash_completion ]; then
       . `brew --prefix`/etc/bash_completion
fi

    eval "$(rbenv init -)"

source ~/.bin/tmuxinator.bash
source ~/.bash-git-prompt/gitprompt.sh
