OH_MY_ZSH_DIR="$HOME/.oh-my-zsh"

if [ -d "$OH_MY_ZSH_DIR" ]; then
    echo ">>> Oh My Zsh is already installed"
    echo ">>> Updating..."
    ZSH="$OH_MY_ZSH_DIR" sh "$OH_MY_ZSH_DIR/tools/upgrade.sh"
else
    echo ">>> Oh My Zsh is not installed"
    echo ">>> Installing now..."
    /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ -d "$OH_MY_ZSH_DIR" ]; then
    echo ">>> Oh My Zsh installation or update completed successfully!"
else
    echo "!!! Oh My Zsh installation or update failed."
    exit 1
fi

# Clone oh-my-zsh plugins to local
if [ -d "$OH_MY_ZSH_DIR" ]; then
    echo ">>> Oh My Zsh installation or update completed successfully!"
    echo ">>> Installing plugins..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo ">>> Plugins download completed!"
else
    echo "!!! Oh My Zsh installation or update failed."
    exit 1
fi
