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
# xinput set-prop 15 "Device Enabled" 0
export LESS=-RFX
export PATH=$PATH:/usr/local/go/bin
export GOPATH="$HOME/Code/go"
export PATH=$PATH:$(go env GOPATH)/bin

xinput --disable 13
redshift-gtk -l 45.45:28.05 -t 5700:3600 -g 0.8 &
xmodmap -e "keycode 94 = Shift_L"
export KUBECONFIG=$HOME/.kube/admin.conf
