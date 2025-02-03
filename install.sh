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
ln -s "$dir/.p10k.zsh" "$HOME/.p10k.zsh"


# zsh
source '$HOME/dotfiles/install/zsh.sh'


# Check if Zap is already installed
# if ! grep -q "zap.zsh" "$HOME/.zshrc"; then
    # echo "Zap not found in .zshrc. Installing Zap..."
#     # Install Zap using the provided installation script
    # zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
    ZAP_NO_MODIFY_RC=true zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
# else
#     echo "Zap is already installed."
# fi
# find better way to see if zap already exists

ln -sf "$dir/.zshrc" "$HOME/.zshrc"


echo "Installation complete."


source "$HOME/.zshrc"
exec zsh
