#!/bin/bash

dir="$HOME/dotfiles"

ignores=("install.sh" ".gitignore" ".gitmodules")

for file in "$dir"/*; do
    filename=$(basename "$file")

    if [ -d "$file" ]; then
        continue
    fi

    ignorable=false
    for ignore in "${ignores[@]}"; do
        if [ "$filename" = "$ignore" ]; then
            ignorable=true
            break
        fi
    done
    if [ "$ignorable" = true ]; then
        echo "ignoring $filename"
        continue
    fi

    if [ -e "$HOME/$filename" ]; then
        echo "$filename already exists"
        continue
    fi

    #ln -s "$file" "$HOME/filename"
done

echo "Done"
