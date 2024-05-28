#!/bin/bash

dir="$HOME/dotfiles"

if [ ! -d "$dir" ]; then
    echo "~/dotfiles not found. Cloning repository..."
    git clone https://github.com/rmassaroni/bulkOS-Ubuntu.git "$dir"
fi

ignores=("install.sh" ".gitignore" ".gitmodules" "README.md")
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
        echo "$filename already exists"
        continue
    fi

    ln -s "$file" "$HOME/$filename"
    echo "Created symbolic link to $filename"
done

echo "Done"
