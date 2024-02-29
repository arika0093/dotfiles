#!/bin/bash
TARGET_BRANCH=${1:-'master'}
# based repository
DOTFILE_REPOSITORY="https://github.com/arika0093/dotfiles.git"
# tar.gz location
TARBALL_LOCATION="https://github.com/arika0093/dotfiles/archive/${TARGET_BRANCH}.tar.gz"

# ---------------------------------------------------------------
DOT_DIR="$HOME/dotfiles"

has() {
  type "$1" > /dev/null 2>&1
}

if [ ! -d ${DOT_DIR} ]; then
  # install this repository
  if has "git"; then
    git clone -b ${TARGET_BRANCH} ${DOTFILE_REPOSITORY} ${DOT_DIR}
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

  # ... and install!
  bash ${DOT_DIR}/init.sh ${DOT_DIR}
else
  # if not exist `.config/dotfiles-installed`; then not installed yet.
  # for example, vscode will be downloaded and execute install.sh only.
  if [ ! -f ${DOT_DIR}/.config/dotfiles-installed ]; then
    bash ${DOT_DIR}/init.sh ${DOT_DIR}
  else
    echo "dotfiles already exists and installed."
    exit 0  
  fi
fi

