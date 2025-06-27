#!/bin/bash
# install latest node (npm) if not installed
if ! command -v node >/dev/null 2>&1; then
  echo "Installing Node.js..."
  curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
  sudo apt-get install -y nodejs
fi

# install claude-code
if ! command -v claude >/dev/null 2>&1; then
  echo "Installing claude-code..."
	sudo npm install -g @anthropic-ai/claude-code
fi

# install SuperClaude
# https://github.com/NomenAK/SuperClaude
if [ ! -d "$HOME/3rd-party/superclaude" ]; then
  echo "Installing SuperClaude..."
  git clone https://github.com/NomenAK/SuperClaude.git "$HOME/3rd-party/superclaude"
  cd "$HOME/3rd-party/superclaude"
  bash install.sh --force
fi