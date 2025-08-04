#!/bin/bash
# if you want to copy file/folder, add it here
DOT_INSTALL_FILES=(
  ".config/dotfiles-installed"
  ".config/git"
  # ".config/starship.toml"
  ".vim/colors"
  ".bash_aliases"
  ".bashrc"
	".gitconfig"
  ".vimrc"
  ".local/share/code-server/User/settings.json"
  "scripts"
)
# ---------------------------------------------------------------
EXECUTE_DIR="$( cd "$( dirname "$0" )" >/dev/null 2>&1 && pwd )"
DOT_DIR=${1:-"$EXECUTE_DIR"}

# install packages
echo "Install console libraries..."
. $DOT_DIR/install-packages/library.sh
echo "Install console packages..."
. $DOT_DIR/install-packages/console.sh
echo "Install nodejs, python, etc..."
. $DOT_DIR/install-packages/runtime.sh
echo "Install claude-code, etc..."
. $DOT_DIR/install-packages/ai.sh
echo "Install fonts..."
. $DOT_DIR/install-packages/fonts.sh

# make symbolic links to dotfiles
echo "Make symbolic links from $DOT_DIR to $HOME"
for f in ${DOT_INSTALL_FILES[@]};
do
	mkdir -p $(dirname $HOME/$f)
	ln -snf $DOT_DIR/"$f" $HOME/"$f"
	echo "Installed $f"
done
