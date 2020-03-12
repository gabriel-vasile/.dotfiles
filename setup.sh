#! /usr/bin/env bash

source ./functions.sh

cur_dir=$(pwd)
backup_dir="$cur_dir/backup-dot"

declare -a packages=(
	"i3" "i3blocks" "vim" "mc" "rxvt-unicode" "rxvt-unicode-256color" "xclip"
	"ack" "build-essential" "curl" "zlib1g-dev" "cmake"
	"libreadline-dev" "libssl-dev" "libxml2-dev" "openssl" "libyaml-dev"
	"unzip" "python" "python-dev" "python-gtk2-dev" "python-pip"
	"software-properties-common" "exuberant-ctags"
	"fonts-inconsolata" "fonts-font-awesome" "git" "gitk"
	"oracle-java8-installer"
	"mysql-server" "mysql-client"
	"libx11-dev" "libxext-dev" "libxrandr-dev" "libpam-dev")

declare -a config_dirs=(
	"$HOME/bin"
	"$HOME/.fonts"
	"$HOME/.vim/colors"
	"$HOME/.config/i3"
	"$HOME/.local/share/mc/skins"
	"$HOME/.config/mc"
	"$HOME/.urxvt/ext"
	"$HOME/Code")

declare -A configs=(
	["./vim/.vimrc"]="$HOME/.vimrc"
	["./vim/foursee.vim"]="$HOME/.vim/colors/foursee.vim"
	["./vim/plugins.vim"]="$HOME/.vim/plugins.vim"
	["./i3/config"]="$HOME/.config/i3/config"
	["./i3/i3-exit"]="$HOME/.config/i3/i3-exit"
	["./i3/sleep.sh"]="$HOME/.config/i3/sleep.sh"
	["./i3/i3blocks.conf"]="$HOME/.i3blocks.conf"
	["./i3/myxbacklight.sh"]="$HOME/bin/myxbacklight.sh"
	["./mc/darkened.ini"]="$HOME/.local/share/mc/skins/darkened.ini"
	["./mc/ini"]="$HOME/.config/mc/ini"
	["./mc/menu"]="$HOME/.config/mc/menu"
	["./mc/mc.ext"]="$HOME/.config/mc/mc.ext"
	["./urxvt/.Xresources"]="$HOME/.Xresources"
	["./urxvt/clipboard"]="$HOME/.urxvt/ext/clipboard"
	["./bash/.profile"]="$HOME/.profile"
	["./bash/.bash_aliases"]="$HOME/.bash_aliases"
	["./ack/.ackrc"]="$HOME/.ackrc"
	["./git/gitconfig"]="$HOME/.gitconfig")


# Keep sudo commands at the top
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-add-repository -y ppa:webupd8team/java


# Install packages
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


# Some config dirs are not created once the package is installed.
# Create these dirs so the config files can be symlinked into.
for config_dir in "${config_dirs[@]}"
do
	if [ ! -d "$config_dir" ] ; then
	    mkdir -p $config_dir
	fi
done

# Symlink config files to their appropriate locations.
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

cd "/tmp"

# Vim plugin manager - Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Adobe Source Code Pro.
wget https://github.com/adobe-fonts/source-code-pro/archive/2.010R-ro/1.030R-it.zip
unzip 1.030R-it.zip
mkdir -p ~/.fonts
cp source-code-pro-2.010R-ro-1.030R-it/OTF/*.otf ~/.fonts/
fc-cache -f -v
