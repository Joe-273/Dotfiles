#!/bin/bash

OH_MY_ZSH_DIR="$HOME/.oh-my-zsh"

if [ -d "$OH_MY_ZSH_DIR" ]; then
    echo "Oh My Zsh is already installed"
    echo "Updating..."
    ZSH="$OH_MY_ZSH_DIR" sh "$OH_MY_ZSH_DIR/tools/upgrade.sh"
else
    echo "Oh My Zsh is not installed"
    echo "Installing now..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ -d "$OH_MY_ZSH_DIR" ]; then
    echo "Oh My Zsh installation or update completed successfully!"
else
    echo "Oh My Zsh installation or update failed."
    exit 1
fi
