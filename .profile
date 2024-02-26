
#!/bin/bash
HISTCONTROL=ignoreboth
EDITOR='vim'
export EDITOR;
DISPLAY=:0
export DISPLAY
export BASH_SILENCE_DEPRECATION_WARNING=1

# python
if command -v pipx > /dev/null; then
  eval "$(register-python-argcomplete pipx)"
fi


# git_completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# bash_completion
if command -v brew > /dev/null; then

  if [ -f `brew --prefix`/etc/bash_completion ]; then
     . `brew --prefix`/etc/bash_completion
  fi

  # # bash-git-prompt
  # if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  #    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
  # fi

fi
#
# Load .workrc, containing only work related bash config and initializations.
if [ -e "$HOME/.workrc" ]; then
   source ~/.workrc
fi
