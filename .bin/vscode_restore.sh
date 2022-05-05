#!/bin/sh
## based: https://qiita.com/miiina016/items/018331b36ecf57ed8973

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
NEW_VSCODE_SETTING_DIR="$SCRIPT_DIR/../.vscode/"
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User

rm "$VSCODE_SETTING_DIR/settings.json"
ln -s "$NEW_VSCODE_SETTING_DIR/settings.json" "${VSCODE_SETTING_DIR}/settings.json"

rm "$VSCODE_SETTING_DIR/keybindings.json"
ln -s "$NEW_VSCODE_SETTING_DIR/keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"

# install extention
cat ".vscode/extensions" | while read line
do
 code --install-extension $line
done

code --list-extensions > ".vscode/extensions"
