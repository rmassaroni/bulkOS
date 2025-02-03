#!/bin/bash


zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
# ZAP_NO_MODIFY_RC=true zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 # might not be needed since we are already force deleting


# Force delete the .zshrc created by zap
ln -sf "$dir/.zshrc" "$HOME/.zshrc"









# # Check if Zap is already installed
# # if ! grep -q "zap.zsh" "$HOME/.zshrc"; then
#     # echo "Zap not found in .zshrc. Installing Zap..."
# #     # Install Zap using the provided installation script
#     # zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
#     ZAP_NO_MODIFY_RC=true zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
# # else
# #     echo "Zap is already installed."
# # fi
# # find better way to see if zap already exists
