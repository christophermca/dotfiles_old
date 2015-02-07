set -o vi
EDITOR='vim'
export EDITOR;
source ~/.bin/tmuxinator.bash
source ~/.bash-git-prompt/gitprompt.sh



# aliases
alias gst='git status'
alias grea='git pull'
alias gwr='git commit -am'
alias co='git checkout'
alias newbr='git checkout -b'
alias graph='git log --oneline --graph --abbrev-commit --pretty=format:"%Cgreen %h %Creset%s %n%an - %cr %n%n"'
alias reb='git rebase'
alias lcd='cd c:/localdev/'
alias rebc='git rebase --continue'

