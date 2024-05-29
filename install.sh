#!/bin/bash

zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

dir="$HOME/dotfiles"

if [ ! -d "$dir" ]; then
    echo "~/dotfiles not found. Cloning repository..."
    git clone https://github.com/rmassaroni/bulkOS-Ubuntu.git "$dir"
fi

ignores=("install.sh" ".gitignore" ".gitmodules" "README.md" "zap.zsh")
shopt -s dotglob

for file in "$dir"/*; do
    filename=$(basename "$file")

    if [ -d "$file" ]; then
        continue
    fi

    ignorable=false
    for ignore in "${ignores[@]}"; do
        if [ "$filename" = "$ignore" ]; then
            ignorable=true
        fi
    done
    if [ "$ignorable" == true ]; then
        echo "ignoring $filename"
        continue
    fi

    if [ -e "$HOME/$filename" ]; then
        # read -p "$filename already exists. Do you want to override it? (y/n): " answer
        # case $answer in
        #     [Yy]* )
        #         ln -sf "$file" "$HOME/$filename"
        #         echo "Overridden $filename"
        #         ;;
        #     [Nn]* )
        #         echo "Skipped $filename"
        #         ;;
        #     * )
        #         echo "Invalid input. Skipping $filename"
        #         ;;
        # esac
        echo "Overriding existing $filename..."
        ln -sf "$file" "$HOME/$filename"
        echo "Created symbolic link to $filename"
        continue
    fi

    ln -s "$file" "$HOME/$filename"
    echo "Created symbolic link to $filename"
done





if ! command -v zsh &> /dev/null
then
    echo "Zsh is not installed. Installing Zsh..."
    sudo apt-get install -y zsh
fi
sudo apt-get install -y zsh
if [ "$SHELL" != "$(command -v zsh)" ]
then
    echo "Setting Zsh as the default shell..."
    chsh -s "$(command -v zsh)"
fi

#ln -s "$dir/zap.zsh" "$HOME/.local/share/zap/zap.zsh"

echo "Done"

