echo -e "\033[34m<-------------- Mac Setup START -------------->\033[0m"

export MAC_CONF_DIR=$(dirname "$(realpath "$0")")

for script in "$MAC_CONF_DIR/bin/"*.sh; do
    chmod +x "$script"
done

"$MAC_CONF_DIR/bin/update_homebrew.sh"
# Homebrew is installed successfully and the environment is configured.
eval "$(/opt/homebrew/bin/brew shellenv)"

"$MAC_CONF_DIR/bin/update_ohmyzsh.sh"

"$MAC_CONF_DIR/bin/install_apps.sh"

"$MAC_CONF_DIR/bin/set_symlink.sh"

ZSHRC_CONFIG_PATH="$MAC_CONF_DIR/config/zsh/zshrc"
sed -i '' "s|export MAC_CONF_DIR=\"\$HOME/Dotfiles/MacConf\"|export MAC_CONF_DIR=\"$MAC_CONF_DIR\"|g" "$ZSHRC_CONFIG_PATH"

ln -sfn "$ZSHRC_CONFIG_PATH" ~/.zshrc

echo -e "\033[34m<-------------- Mac Setup END -------------->\033[0m"