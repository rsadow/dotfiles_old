#!/bin/bash

DOTFILES=$HOME/.dotfiles
CONFIG=$HOME/.config

#echo "Initializing submodule(s)"
#git submodule update --init --recursive

echo -e "\nCreating symlinks"
echo "==========================="
links=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $links ; do
    target="$HOME/.$( basename $file ".symlink" )"
    if [ -e $target ]; then
	echo "~${target#$HOME} already exists"
    else
	echo "Creating symlink for $file"
	ln -s $file $target
    fi
done

echo -e "\nInstalling to ~/.config"
echo "============================="

if [ ! -d $CONFIG ]; then
    echo "Creating $CONFIG"
    mkdir -p $CONFIG
fi

for config in $DOTFILES/config/*; do
    target=$CONFIG/$( basename $config )
    if [ -e $target ]; then
	echo "~${target#$HOME} already exists"
    else
	echo "Creating symlinks for $config"
	ln -s $config $target
    fi
    init=$config/init.sh
    if [ -e $init ]; then
	echo "Run init.sh in $config"
	source $init
    fi
done

