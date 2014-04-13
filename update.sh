#!/bin/sh

# check to make sure we are running ZSH

if [ -n $ZSH_VERSION ]; then
   echo "Good, you appear to be running zsh, we can continue"
   script_dir=$(cd $(dirname $0); pwd)

   echo "We appear to be running the script from $script_dir"

   echo "Updating repository"
   curr_dir=$(pwd)
   cd $script_dir
   git pull
   cd $curr_dir


   echo "Updating required submodules"
   curr_dir=$(pwd)
   cd $script_dir
   git submodule update --recursive
   cd $curr_dir

   echo "All done, please restart your shell sessions"

else
   echo "You're not running zsh, this won't work, exiting..."
fi
