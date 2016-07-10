#!/bin/bash
# Author: Dave McMahon
# Date: 10-07-2016
# Script to prompt to backup files to a location
#

read -p "Choose which level of compression you would like to zip with: " file_compression
read -p "Which directory do you want to back them up to: " dir_name

test -d $HOME/$dir_name || mkdir -m 700 $HOME/$dir_name

backup_dir=$HOME/$dir_name

tar1="-cvf $backup_dir/b.tar --exclude $backup_dir $HOME"
tar2="-czvf $backup_dir/b.tar.gz --exclude $backup_dir $HOME"
tar3="-cjvf $backup_dir/b.tar.bzip2 --exclude $backup_dir $HOME"

if [ $file_compression="L" ] ; then
    tar_opt=$tar1
elif [ $file_compression="M" ] ; then
    tar_opt=$tar2
else
    tar_opt=$tar3
fi

tar $tar_opt

exit 0;
