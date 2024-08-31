#!/bin/bash
install_package=(
  # programmer utility
  vim
  git
  curl
)

# install apt package 
sudo apt update &&
sudo apt install -y "${install_package[@]}"

