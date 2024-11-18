SOURCE="$HOME/Dotfiles/MacConf/config"
declare -A link_map=(
    ["~/.zshrc"]="$SOURCE/zsh/zshrc"
    ["~/.gitconfig"]="$SOURCE/git/gitconfig"
    ["~/.config/nvim"]="$SOURCE/nvim"
    ["~/.config/wezterm"]="$SOURCE/wezterm"
)

for target in "${(@k)link_map}"; do
    source="${link_map[$target]}"
    target=${~target}

    if [[ -e "$target" ]]; then
        if [[ ! -L "$target" ]]; then
            # Backup
            backup="${target}.bak"
            echo ">>> Found existing file at $target. Backing it up to $backup."
            mv "$target" "$backup"
        else
            # Replace
            echo ">>> Existing symlink found at $target. Removing it."
            rm "$target"
        fi
    fi

    # Create symlink
    echo ">>> Linking $target to $source."
    ln -s "$source" "$target"
done

echo ">>> All dotfiles symlinks created successfully!"
