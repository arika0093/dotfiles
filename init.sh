#!/bin/bash
# if you want add dotfile, add it here
DOT_INSTALL_FILES=(
  ".config/git"
  ".config/starship.toml"
  ".vim/colors"
  ".bash_aliases"
  ".bashrc"
	".gitconfig"
  ".vimrc"
)
# ---------------------------------------------------------------
EXECUTE_DIR="$( cd "$( dirname "$0" )" >/dev/null 2>&1 && pwd )"
DOT_DIR=${1:-"$EXECUTE_DIR"}

# install packages
echo "Install console packages..."
. $DOT_DIR/install-packages/console.sh
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
