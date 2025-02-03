#!/bin/bash

shopt -s dotglob # include hidden files

dir="$HOME/dotfiles"

linkables=(".aliases" ".bash_logout" ".bashrc" ".gitconfig" ".p10k.zsh" ".scripts.sh" ".vimrc")
# .zshrc might have to be done later
# linkable directory?

echo "$dir"
for file in "$dir"/*; do
    filename=$(basename "$file")
    echo "$filename"

    # skip directories
    if [ -d "$file" ]; then
        continue
    fi


    for linkable in "${linkables[@]}"; do
        if [ "$filename" = "$linkable" ]; then
            echo "Creating symbolic link to $filename"
            ln -s "$file" "$HOME/$filename"
        fi
    done

    

    # will need to check for existing files

    # if [ -e "$HOME/$filename" ]; then
    #     # read -p "$filename already exists. Do you want to override it? (y/n): " answer
    #     # case $answer in
    #     #     [Yy]* )
    #     #         ln -sf "$file" "$HOME/$filename"
    #     #         echo "Overridden $filename"
    #     #         ;;
    #     #     [Nn]* )
    #     #         echo "Skipped $filename"
    #     #         ;;
    #     #     * )
    #     #         echo "Invalid input. Skipping $filename"
    #     #         ;;
    #     # esac
    #     echo "Overriding existing $filename..."
    #     ln -sf "$file" "$HOME/$filename"
    #     echo "Created symbolic link to $filename"
    #     continue
    # fi
    #
    # ln -s "$file" "$HOME/$filename"
    # echo "Created symbolic link to $filename"
done
