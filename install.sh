#!/bin/bash

dir="$HOME/dotfiles"
install_dir="$dir/install"


shopt -s dotglob #include hidden filenames in searches. 
# this is bash specific and won't work in zsh. 
# setopt GLOB_DOTS is the zsh equivalent
# add these to zshrc or bashrc to make it universal


# Clone dotfiles
if [ -d "$dir" ]; then
    echo "Dotfiles repository already exists at $DOTFILES_DIR."
    # might need to end script early if this happens
else
    echo "~/dotfiles not found. Cloning repository..."
    git clone https://github.com/rmassaroni/bulkOS.git "$dir"
fi


# echo "Linking .zshrc from dotfiles..."
# ln -s "$dir/.p10k.zsh" "$HOME/.p10k.zsh"


# symlinks
source "$install_dir/symlinks.sh"


# zsh
source "$install_dir/zsh.sh"


# zap
source "$install_dir/zap.sh" # this will probably be sourced from zsh.sh


# GPUSH
bash <(curl https://raw.githubusercontent.com/rmassaroni/gpush/main/install.sh) # needs to be after zap installation and setup


echo "Installation complete." # move after source/exec ?


# source "$HOME/.zshrc" 2>/dev/null
exec zsh
# one of these probably aren't needed
