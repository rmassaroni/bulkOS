#!/bin/bash

# should this be does before or after zap and zsh


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

