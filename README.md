#dotfiles


##General Information
This is my dotfiles repository.  There are many like it, but this one is mine.

I run across OSX, Linux and cygwin so this is a general dotfiles repo that works across all of them (mostly!).


##Included
Settings are provided for:
* vim
* oh-my-zsh
* minttyrc
* dircolors
* a fancy zsh prompt

##Installation
Clone the repo somewhere:

    git clone https://github.com/BenLyall/dotfiles dotfiles

Run the bootstrap.sh script

    sh dotfiles/bootstrap.sh

Restart your shells sessions and marvel at the wonder!

**Note: bootstrap.sh is potentially destructive, it WILL overwrite any existing files.  Files overwritten are:**
* $HOME/.vim
* $HOME/.vimrc
* $HOME/.oh-my-zsh
* $HOME/.zshrc
* $HOME/.minttyrc
* $HOME/.dircolors
* $HOME/.shell_prompt.zsh 

It will also attempt to create:
* $HOME/.virtualenvs - for python virtualenvwrapper
* $HOME/Development - this is where I store my development files
