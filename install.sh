#!/bin/bash


shopt -s dotglob #include hidden filenames in searches. 
# this is bash specific and won't work in zsh. 
# setopt GLOB_DOTS is the zsh equivalent
# add these to zshrc or bashrc to make it universal





# GPUSH
bash <(curl https://raw.githubusercontent.com/rmassaroni/gpush/main/install.sh)


# Clone dotfiles
dir="$HOME/dotfiles"

if [ -d "$dir" ]; then
    echo "Dotfiles repository already exists at $DOTFILES_DIR."
else
    echo "~/dotfiles not found. Cloning repository..."
    git clone https://github.com/rmassaroni/bulkOS.git "$dir"
fi


# Symlinks
if [ -f "$HOME/.zshrc" ]; then
    echo ".zshrc already exists. Backing up to .zshrc.backup"
    mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

echo "Linking .zshrc from dotfiles..."
ln -s "$dir/.zshrc" "$HOME/.zshrc"


# Check if Zsh is installed
if ! command -v zsh &> /dev/null
then
    echo "Zsh is not installed. Installing Zsh..."
    # will eventually not be able to assume that apt is a given
    sudo apt update
    sudo apt install -y zsh
else
    echo "Zsh is already installed."
fi
# Set Zsh as the default shell if it isn't already
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Setting Zsh as the default shell..."
    chsh -s "$(which zsh)"
else
    echo "Zsh is already the default shell."
fi

echo "Installation complete."


source "$HOME/.zshrc"
exec zsh
