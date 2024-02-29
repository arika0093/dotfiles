#!/bin/bash
install_package=(
  # programmer utility
  vim
  git
  curl
  # for use jetbrains mono install
  fontconfig
  unzip
)

# install apt package 
sudo apt update &&
sudo apt install -y "${install_package[@]}"

# install spin 
# https://serversideup.net/open-source/spin/installation/install-linux
# if [ ! -e "$HOME/.spin" ]; then
#   sh -c "$(curl -fsSL https://raw.githubusercontent.com/serversideup/spin/main/tools/install.sh)" || true
# else
#   echo 'spin is already installed.'
# fi

# if folder `HOME/.spin` is not exists, then call shell 

