echo ">>>>>> Mac Setup START >>>>>>"


for script in "$MAC_CONF_DIR/bin/"*.sh; do
    chmod +x "$script"
done

"$MAC_CONF_DIR/bin/update_homebrew.sh"
"$MAC_CONF_DIR/bin/update_ohmyzsh.sh"
"$MAC_CONF_DIR/bin/install_apps.sh"
"$MAC_CONF_DIR/bin/set_symlink.sh"

echo "<<<<<< Mac Setup END <<<<<<"
