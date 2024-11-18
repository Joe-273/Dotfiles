SOURCE="$HOME/Dotfiles/config"

declare -A links
links["$HOME/.zshrc"]="$SOURCE/zsh/zshrc"

create_symlink() {
    local target=$1
    local link_name=$2

    if [[ -e $link_name && ! -L $link_name ]]; then
        echo "Backing up $link_name to $link_name.bak"
        mv "$link_name" "$link_name.bak"
    fi

    if [[ -L $link_name ]]; then
        echo "Removing existing symlink $link_name"
        rm "$link_name"
    fi

    echo "Creating symlink: $link_name -> $target"
    ln -s "$target" "$link_name"
}

for link_name in "${!links[@]}"; do
    target=${links[$link_name]}
    create_symlink "$target" "$link_name"
done

echo ">>> Dotfiles symlinks created successfully."
