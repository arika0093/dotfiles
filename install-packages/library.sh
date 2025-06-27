#!/bin/bash
install_package=(
  # programmer utility
  vim
  git
  curl
  # monitor utility
  btop
)

# install apt package 
sudo apt update &&
sudo apt install -y "${install_package[@]}"

# install GitHub CLI
if ! command -v gh >/dev/null 2>&1; then
  echo "Installing GitHub CLI..."
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
  sudo apt update
  sudo apt install gh
fi

# install gitui from github releases
if ! command -v gitui >/dev/null 2>&1; then
	ARCH=$(uname -m)
  echo "Installing gitui ..."
  wget "https://github.com/extrawurst/gitui/releases/latest/download/gitui-linux-${ARCH}.tar.gz"
  tar -xzf "gitui-linux-${ARCH}.tar.gz"
  sudo mv gitui /usr/local/bin/
  rm "gitui-linux-${ARCH}.tar.gz"
fi

# install walk
if ! command -v walk >/dev/null 2>&1; then
  curl https://raw.githubusercontent.com/antonmedv/walk/master/install.sh | sh
fi