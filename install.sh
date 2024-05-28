#!/bin/bash

dir="$HOME/dotfiles"

for file in "$dotfiles_dir"/*; do
    filename=$(basename "$file")

    if [ -d "$file" ]; then
        continue
    fi
    ln -s "$file" "$HOME/filename"
done

echo "Done"
