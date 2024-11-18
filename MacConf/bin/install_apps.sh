echo "<-------- Install apps START -------->"

if ! command -v brew &> /dev/null; then
    echo "ERROR: homebrew is not installed. Please run < update_homebrew.sh > first."
    exit 1
fi

apps=(
    # Format: "Description:Installation Command"
    "NVM:brew install nvm"
    "Neovim:brew install neovim"
    "QQ:brew install --cask qq"
    "Wechat:brew install --cask wechat"
    "QQMusic:brew install --cask qqmusic"
    "Wezterm:brew install --cask wezterm"
    "VSCode:brew install --cask visual-studio-code"
    "NerdFont:brew install --cask font-jetbrains-mono-nerd-font"
)

# Function to install apps
install_apps() {
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
                    echo "ERROR: Failed to install $description."
                    return 1  # Return error if installation fails
                fi
            fi
        else
            echo "ERROR: $description installation command is not recognized. Skipping..."
            return 1  # Return error if command is not recognized
        fi
    done
    return 0  # All installations successful
}

# Loop until all apps are installed
until install_apps; do
    echo "ERROR: Some apps failed to install. Retrying..."
    echo "<-------- Install apps RESTART -------->"
done

echo "<-------- Install apps END -------->"
