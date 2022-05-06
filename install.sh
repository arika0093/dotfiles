#!/bin/bash
# if you want add dotfile, add it here
DOT_INSTALL_FILES=(
  ".config/git"
  ".vim/colors"
  ".bash_aliases"
  ".bashrc"
  ".vimrc"
)
# based repository
DOTFILE_REPOSITORY="https://github.com/arika0093/dotfiles.git"
# tar.gz location
TARBALL_LOCATION="https://github.com/arika0093/dotfiles/archive/master.tar.gz"

# ---------------------------------------------------------------
DOT_DIR="$HOME/dotfiles"

has() {
  type "$1" > /dev/null 2>&1
}

if [ ! -d ${DOT_DIR} ]; then
  # dotfiles download
  if has "git"; then
    git clone ${DOTFILE_REPOSITORY} ${DOT_DIR}
  elif has "curl" || has "wget"; then
    if has "curl"; then
      curl -L ${TARBALL_LOCATION} -o master.tar.gz
    else
      wget ${TARBALL_LOCATION}
    fi
    tar -zxvf master.tar.gz
    rm -f master.tar.gz
    mv -f dotfiles-master "${DOT_DIR}"
  else
    echo "curl or wget or git required"
    exit 1
  fi

  # ... actions!
  cd ${DOT_DIR}
  . ./init.sh
else
  echo "dotfiles already exists"
  exit 1
fi

