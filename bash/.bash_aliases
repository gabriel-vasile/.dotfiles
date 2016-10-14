# ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# cd
alias ..='cd ..'
alias ...='cd ../..'

# apt-get
alias apt-update='sudo apt-get update'
alias apt-upgrade='sudo apt-get upgrade'
alias apt-dist-upgrade='sudo apt-get dist-upgrade'
alias apt-install='sudo apt-get install'
alias apt-clean='sudo apt-get autoremove --purge'
alias apt-search='sudo apt-cache search'

# git
alias g='git'
alias gi='git init'
alias gs='git status'
alias gl='git log'
alias gd='git diff'
alias ga='git add'
alias gb='git branch'
alias gc='git checkout'
alias gcb='git checkout -b'
alias gp='git pull'
alias gm='git merge'
alias gco='git commit'
alias gps='git push'
alias gra='git remote add'
alias grr='git remote rm'
alias gpushom='git push origin master'
alias gpullom='git pull orifin master'
alias grh='git reset --hard'

alias fuck='sudo $(history -p \!\!)'