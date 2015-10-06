#!/bin/bash

dir=~/dotfiles
oldDir=~/dotfiles_old

prezto_files="zlogin zlogout zpreztorc zprofile zshenv zshrc"
prezto_dir=".zprezto"

echo -n "Creating $oldDir for backup of any existing dotfiles in ~ ..."
mkdir -p $oldDir
echo "done"

echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

for file in $prezto_files; do
    echo "Moving $file from ~ to $oldDir"
    mv ~/.$file $oldDir/
    echo "Creating symlink to $file in ~"
    ln -s $dir/$prezto_dir/runcoms/$file ~/.$file
done
