echo ">>>>>> Mac Setup START >>>>>>"

export MAC_CONF_DIR="$(pwd)"

"$MAC_CONF_DIR/bin/update_bomebrew.sh"
"$MAC_CONF_DIR/bin/update_ohmyzsh.sh"
"$MAC_CONF_DIR/bin/install_apps.sh"
"$MAC_CONF_DIR/bin/set_symlink.sh"

echo "<<<<<< Mac Setup END <<<<<<"
