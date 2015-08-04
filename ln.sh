#!/bin/bash

# # # # #
# Auth: Jiskiras
# Desc: Makes a backup and creates symlinks for any file/folder found in $dotfiles to $HOME
# Date: 02.18.13
# # # # #

dotfiles=$HOME/.files                                                                                       # Current dotfiles directory
backup=$HOME/.files.bak                                                                                     # Backup dotfiles directory
files=`/bin/ls $dotfiles | /bin/grep -v "ln.sh" | /bin/grep -iv "readme" | perl -CS -pe 's/\p{Space}/ /g'`  # Generate a list of files
list=`echo $files | perl -CS -pe 's/\p{Space}/, /g' | sed -e 's/, $//'`                                     # Generate human-readable list

echo "Found files: $list" && echo

if [ ! -d $dotfiles ]; then
    echo "Making dotfiles directory: $dotfiles" && echo
    mkdir -p $dotfiles
fi

if [ ! -d $backup ]; then
    echo "Making backup directory: $backup" && echo
    mkdir -p $backup
fi

cd $dotfiles
for file in $files; do
    if [ -a $HOME/.$file ]; then
        echo && echo "Moving $HOME/.$file to $backup/$file"
        mv -f $HOME/.$file $backup/$file
    fi
    echo "Symlinking $dotfiles/$file to $HOME/.$file"
    ln -s $dotfiles/$file $HOME/.$file
done

echo && echo "Finished!"
