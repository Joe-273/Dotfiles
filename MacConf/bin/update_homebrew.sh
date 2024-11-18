if command -v brew >/dev/null 2>&1; then
    echo ">>> Homebrew is already installed"
    echo ">>> Updating..."
    brew update && brew upgrade
    echo ">>> Homebrew has been updated!"
else
    echo ">>> Homebrew is not installed"
    echo ">>> Installing now..."
    /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo ">>> Homebrew installation completed!"
fi

if command -v brew >/dev/null 2>&1; then
    echo ">>> Homebrew is ready to use."
else
    echo "!!! Homebrew setup failed. Please check manually."
    exit 1
fi
