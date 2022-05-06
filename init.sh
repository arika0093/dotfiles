#!/bin/bash
# if you want add dotfile, add it here
DOT_INSTALL_FILES=(
  ".config/git"
  ".vim/colors"
  ".bash_aliases"
  ".bashrc"
  ".vimrc"
)
# ---------------------------------------------------------------
# install packages
echo "Install console packages..."
. ./install-packages/console.sh
echo "Install fonts..."
. ./install-packages/fonts.sh

# make symbolic links to dotfiles
for f in ${DOT_INSTALL_FILES[@]};
do
	ln -snf $DOT_DIR/"$f" $HOME/"$f"
	echo "Installed $f"
done
