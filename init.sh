# install packages
. ./install-packages/console.sh
. ./install-packages/fonts.sh

# make symbolic links to dotfiles
for f in ${DOT_INSTALL_FILES[@]};
do
	ln -snf $DOT_DIR/"$f" $HOME/".$f"
	echo "Installed .$f"
done
