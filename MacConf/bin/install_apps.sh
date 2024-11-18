echo "<-------- Install apps START -------->"

if ! command -v brew &> /dev/null; then
    echo "!!! Homebrew is not installed."
    echo "!!! Please run < update_homebrew.sh > first."
    exit 1
fi

apps=(
    # Format: "Description:Installation Command"
    "NVM:brew install nvm"
    "Neovim:brew install neovim"
    "Wezterm:brew install --cask wezterm"
    "VSCode:brew install --cask visual-studio-code"
    "NerdFont:brew install --cask font-jetbrains-mono-nerd-font"
)

for app in "${apps[@]}"; do
    description=${app%%:*}
    command=${app#*:}

    echo ">> Checking if $description is installed..."

    # Check if the application is already installed using brew
    if [[ $command == *"brew install"* ]]; then
        app_name=$(echo $command | cut -d ' ' -f 3)  # Extract the app name from the install command

        if brew list --formula | grep -q "^$app_name\$" || brew list --cask | grep -q "^$app_name\$"; then
            echo ">> $description is already installed. Skipping..."
        else
            echo ">> Installing $description..."
            eval $command

            if [[ $? -eq 0 ]]; then
                echo ">> $description installed successfully!"
            else
                echo "!!! Failed to install $description."
            fi
        fi
    else
        echo "!!! $description installation command is not recognized. Skipping..."
    fi
done

echo "<-------- Install apps END -------->"
