# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
xinput set-prop 15 "Device Enabled" 0

export PATH=~/.composer/vendor/bin:$PATH
export PATH=~/Node/bin:$PATH
export PATH=~/gradle-2.12/bin:$PATH

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

# vim
alias v='vim'
alias vf='vim -p'

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
