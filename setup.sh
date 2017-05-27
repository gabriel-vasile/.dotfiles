#! /usr/bin/env bash

source ./functions.sh

cur_dir=$(pwd)
backup_dir="$cur_dir/backup-dot"

declare -a packages=(
	"i3" "vim" "mc" "rxvt-unicode"
	"build-essential" "curl" "zlib1g-dev" "cmake"
	"libreadline-dev" "libssl-dev" "libxml2-dev" "openssl" "libyaml-dev"
	"unzip" "python" "python-dev" "python-gtk2-dev" "python-pip"
	"software-properties-common" "exuberant-ctags" 
	"fonts-font-awesome" "git" "gitk" "oracle-java8-installer" 
	"mysql-server" "mysql-client"
	"libx11-dev" "libxext-dev" "libxrandr-dev" "libpam-dev")

declare -a config_dirs=(
	"$HOME/bin" 
	"$HOME/.config/i3"
	"$HOME/.local/share/mc/skins"
	"$HOME/.config/mc"
	"$HOME/.urxvt/ext")

declare -A configs=(
	["./vim/.vimrc"]="$HOME/.vimrc"
	["./i3/config"]="$HOME/.config/i3/config"
	["./i3/i3-exit"]="$HOME/.config/i3/i3-exit"
	["./i3/sleep.sh"]="$HOME/.config/i3/sleep.sh"
	["./i3/i3blocks.conf"]="$HOME/.i3blocks.conf"
	["./i3/myxbacklight.sh"]="$HOME/bin/myxbacklight.sh"
	["./mc/darkened.ini"]="$HOME/.local/share/mc/skins/darkened.ini"
	["./mc/ini"]="$HOME/.config/mc/ini"
	["./mc/menu"]="$HOME/.config/mc/menu"
	["./urxvt/.Xresources"]="$HOME/.Xresources"
	["./urxvt/.clipboard"]="$HOME/.urxvt/ext/clipboard"
	["./bash/.profile"]="$HOME/.profile"
	["./bash/.bash_aliases"]="$HOME/.bash_aliases"
	["./git/gitconfig"]="$HOME/.gitconfig")


# Keep sudo commands at the top
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-add-repository -y ppa:webupd8team/java


# Install'em
for package in "${packages[@]}"
do
	# Check current status of package
	dpkg -s $package >/dev/null 2>&1
	if [ $? -eq 0 ]; then
		echo "Package $package already installed"
	else
		echo "Installing package $package"
		sudo apt-get -y install $package
	fi
done


# Some folders are not created 
# once the package is installed...
for config_dir in "${config_dirs[@]}"
do
	if [ ! -d "$config_dir" ] ; then
	    mkdir -p $config_dir
	fi
done

# Config'em
for key in "${!configs[@]}"; do
	backup_dot "${configs[$key]}" $backup_dir
	ln -fsn "$cur_dir/$key" "${configs[$key]}"
done


# sxlock used by i3
if [ ! -d "$HOME/bin" ] ; then
    mkdir $HOME/bin
fi
cd "/tmp"
if [ -d "sxlock" ] ; then
    rm -rf sxlock
fi
git clone https://github.com/VasileGabriel/sxlock.git
cd sxlock
make
mv -f ./sxlock $HOME/bin
