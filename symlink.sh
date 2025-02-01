#!/bin/bash

# Define the files to ignore
ignore_files=('.DS_Store' '.git' '.gitignore' '.' '..')

function is_ignored() {
    local file=$1

    for i in "${ignore_files[@]}"; do
        if [ "$i" = "$file" ]; then
            return 0
        fi
    done

    return 1
}

# Function to check if a file is already symlinked to the target path
function already_symlinked() {
    local source_path=$1
    local target_path=$2

    if [ -L "$target_path" ] && [ "$(readlink "$target_path")" = "$source_path" ]; then
        return 0
    else
        return 1
    fi
}

function create_symlinks {
    for file in .*; do
        if is_ignored "$file"; then
            continue
        fi

        source_path=$(pwd)/$file
        target_path=$HOME/$file

        if already_symlinked "$source_path" "$target_path"; then
            echo "Symlink already exists: $target_path"
            continue
        else
            if [[ -e $target_path ]]; then
                read -p "File $target_path already exists. Do you want to overwrite it? (y/n)" yn;
                case $yn in
                    [Yy]* ) echo "DELETING $target_path"; rm -rf $target_path;;
                    * ) echo "SKIPPING $target_path"; continue;
                esac
            fi

            echo "Symlink: $source_path -> $target_path"
            ln -s $source_path $target_path
        fi
    done

    echo "Done."
    echo
}

create_symlinks