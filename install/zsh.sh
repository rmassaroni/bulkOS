#!/bin/zsh


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

# Remove .zshrc so that an uneeded backup is not created
rm '$HOME/.zshrc'
