#!/bin/bash

DOTFILES=$HOME/dotfiles

MODULES="nvim tmux"

INIT_SCRIPT="init.sh":


echo -e "\nCreating symlinks"
echo "========================"
linkables=$(find -H "$DOTFILES" -maxdepth 1 -name '^.*'
for dir in $MODULES ; do
    target="$DOTFILES/$dir"
    echo "$dir:..."
    if [ -e $target ]; then
	echo "exists"
    fi

done

