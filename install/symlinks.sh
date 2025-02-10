#!/bin/bash

shopt -s dotglob # include hidden files

dir="$HOME/dotfiles"
backup_dir="$HOME/dotfiles/local-backups"
mkdir -p "$backup_dir" # create backup directory if it doesn't exist

linkables=(".aliases" ".bash_logout" ".bashrc" ".gitconfig" ".p10k.zsh" ".scripts.sh" ".vimrc")
# linkable directory?

for file in "$dir"/*; do
    filename=$(basename "$file")

    # skip directories
    if [ -d "$file" ]; then
        continue
    fi

    # for linkable in "${linkables[@]}"; do
    #     if [ "$filename" = "$linkable" ]; then
    #         echo "Creating symbolic link to $filename"
    #         ln -s "$file" "$HOME/$filename"
    #     fi
    # done
    for linkable in "${linkables[@]}"; do
        if [ "$filename" = "$linkable" ]; then
            # Check if the file already exists in the home directory
            if [ -e "$HOME/$filename" ]; then
                # Compare the existing file with the new one
                if cmp -s "$file" "$HOME/$filename"; then
                    # Files are identical, delete the existing file
                    echo "Deleting identical file: $HOME/$filename"
                    rm "$HOME/$filename"
                else
                    # Files are different, move the existing file to local-backups
                    if [ -e "$backup_dir/$filename" ]; then
                        echo "Deleting existing backup: $backup_dir/$filename"
                        rm "$backup_dir/$filename"
                    fi
                    echo "Moving old file to backup: $HOME/$filename"
                    mv "$HOME/$filename" "$backup_dir/"
                fi
            fi

            # Create symbolic link to the new file
            echo "Creating symbolic link to $filename"
            ln -s "$file" "$HOME/$filename"
        fi
    done

done

# will this checking process work with existing symlinks?





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
