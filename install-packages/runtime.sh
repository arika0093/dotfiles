#!/bin/bash
# install latest node (npm) if not installed
if ! command -v node >/dev/null 2>&1; then
  echo "Installing Node.js..."
  curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
  sudo -E apt install -y nodejs
fi

# install uv
if ! command -v uv >/dev/null 2>&1; then
  echo "Installing uv..."
  curl -Ls https://astral.sh/uv/install.sh | sh
fi

