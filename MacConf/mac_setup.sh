echo "<-------- Mac Setup START -------->"

export MAC_CONF_DIR="$(pws)"

for script in "$MAC_CONF_DIR/bin/"*.sh; do
    chmod +x "$script"
done

"$MAC_CONF_DIR/bin/update_homebrew.sh"
"$MAC_CONF_DIR/bin/update_ohmyzsh.sh"
"$MAC_CONF_DIR/bin/install_apps.sh"
"$MAC_CONF_DIR/bin/set_symlink.sh"

ZSHRC_CONFIG_PATH="$MAC_CONF_DIR/config/zsh/zshrc"
sed -i '' "s|export MAC_CONF_DIR=\"\$HOME/Dotfiles/MacConf\"|export MAC_CONF_DIR=\"$MAC_CONF_DIR\"|g" "$ZSHRC_CONFIG_PATH"

ln -sfn "$ZSHRC_CONFIG_PATH" ~/.zshrc

echo "<-------- Mac Setup END -------->"
