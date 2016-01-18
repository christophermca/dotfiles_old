#!/bin/bash
function bashrc() {
   echo "
   BASHRC
   --------------

      ALIASES
      --------------

      GIT
      --------------
         gst ............... git status
         grea  ............. git pull
         gwr  .............. git commit -am
         co  ............... git checkout
         cob  .............. git checkout -b
         graph  ............ git graph
         reb  .............. git rebase
         rebi  ............. git rebase -i
         rebc  ............. git rebase --continue

      NGINX
      --------------
         ngxS  ............... sudo nginx
         ngxK  ............... sudo nginx -s stop
         ngxR  ............... sudo nginx -s reload

      BASH
      --------------
         copy  ............... copies output
         restartBash  ........ restarts bash from bash_profile as source

   ";
};


# aliases
alias gst='git status'
alias grea='git pull'
alias gwr='git commit -am'
alias co='git checkout'
alias cob='git checkout -b'
alias graph='git log --oneline --graph --abbrev-commit --pretty=format:"%Cgreen %h %Creset%s %n%an - %cr %n%n"'
alias reb='git rebase'
alias rebc='git rebase --continue'
alias ngxS='sudo nginx'
alias ngxK='sudo nginx -s stop'
alias ngxR='sudo nginx -s reload'
alias copy="tr -d '\n' | pbcopy"
alias restartBash="source ~/.bash_profile"

if [ -f "/Applications/Karabiner.app/Contents/Library/bin/karabiner" ]; then
   alias karabiner='/Applications/Karabiner.app/Contents/Library/bin/karabiner'
fi
