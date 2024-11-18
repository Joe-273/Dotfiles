#!/bin/bash

if command -v brew >/dev/null 2>&1; then
    echo "Homebrew is already installed. Updating..."
    brew update && brew upgrade
    echo "Homebrew has been updated!"
else
    echo "Homebrew is not installed. Installing now..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Homebrew installation completed!"
fi
