#!/bin/bash
# install apt package 
sudo apt update &&
sudo apt install -y \
  vim \
  git \
  fontconfig unzip # fot use jetbrains mono install

# install spin 
# https://serversideup.net/open-source/spin/installation/install-linux
if [ ! -e "$HOME/.spin"]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/serversideup/spin/main/tools/install.sh)" || true
else
  echo 'spin is already installed.'
fi

# if folder `HOME/.spin` is not exists, then call shell 

