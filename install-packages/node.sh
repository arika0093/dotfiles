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
