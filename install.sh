#!/bin/bash

dir="$HOME/dotfiles"
install_dir="$dir/install"
backup_dir="$HOME/dotfiles-backup"


shopt -s dotglob #include hidden filenames in searches. 
# this is bash specific and won't work in zsh. 
# setopt GLOB_DOTS is the zsh equivalent
# add these to zshrc or bashrc to make it universal


# Clone dotfiles
if [ -d "$dir" ]; then
    echo "Dotfiles repository already exists at $dir."
    if [ -d "$backup_dir" ]; then
        echo "Removing existing backup directory: $backup_dir"
        rm -rf "$backup_dir" # Remove the old backup
    fi
    echo "Backing up the existing dotfiles to $backup_dir..."
    mv "$dir" "$backup_dir"
else
    echo "~/dotfiles not found."
fi

echo "Cloning a fresh copy of the dotfiles repository..."
git clone https://github.com/rmassaroni/bulkOS.git "$dir"


# symlinks
source "Sourcing symlinks.sh"
source "$install_dir/symlinks.sh"


# zsh
echo "Sourcing zsh.sh"
source "$install_dir/zsh.sh"


# zap
echo "Sourcing zap.sh"
source "$install_dir/zap.sh" # this will probably be sourced from zsh.sh


# GPUSH
bash <(curl https://raw.githubusercontent.com/rmassaroni/gpush/main/install.sh) # needs to be after zap installation and setup


echo "Installation complete." # move after source/exec ?


# source "$HOME/.zshrc" 2>/dev/null
exec zsh
# one of these probably aren't needed
