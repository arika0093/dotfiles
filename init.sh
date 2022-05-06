#!/bin/bash
# if you want add dotfile, add it here
DOT_INSTALL_FILES=(
  ".config/git"
  ".vim/colors"
  ".bash_aliases"
  ".bashrc"
	".gitconfig"
  ".vimrc"
)
# ---------------------------------------------------------------
DOT_DIR=${1:-"$HOME/dotfiles"}
# install packages
echo "Install console packages..."
. ./install-packages/console.sh
echo "Install fonts..."
. ./install-packages/fonts.sh

# make symbolic links to dotfiles
echo "Make symbolic links from $DOT_DIR to $HOME"
for f in ${DOT_INSTALL_FILES[@]};
do
	mkdir -p $(dirname $HOME/$f)
	ln -snf $DOT_DIR/"$f" $HOME/"$f"
	echo "Installed $f"
done
