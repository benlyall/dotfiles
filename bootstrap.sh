#!/bin/sh

# check to make sure we are running ZSH

if [ -n $ZSH_VERSION ]; then
   echo "Good, you appear to be running zsh, we can continue"
   script_dir=$(cd $(dirname $0); pwd)

   echo "We appear to be running the script from $script_dir"

   echo "Creating symbolic link for oh-my-zsh"
   ln -sf $script_dir/oh-my-zsh $HOME/.oh-my-zsh 

   echo "Creating symbolic links for vim"
   ln -sf $script_dir/vim $HOME/.vim
   ln -sf $script_dir/vimrc $HOME/.vimrc

   echo "Creating symbolic link for zshrc"
   ln -sf $script_dir/zshrc $HOME/.zshrc

   echo "Creating symbolic link for dircolors"
   ln -sf $script_dir/dircolors $HOME/.dircolors

   echo "Creating a symbolic link for the shell prompt"
   ln -sf $script_dir/shell_prompt.sh $HOME/.shell_prompt.sh

   echo "Creating dirs for virtualenv"
   mkdir -p $HOME/.virtualenvs
   mkdir -p $HOME/Development

   echo "All done, please restart your shell sessions"

else
   echo "You're not running zsh, this won't work, exiting..."
fi
