#!/bin/bash
# install latest node (npm) if not installed
if ! command -v node >/dev/null 2>&1; then
  echo "Installing Node.js..."
  curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
  sudo -E apt install -y nodejs
fi

# install claude-code
if ! command -v claude >/dev/null 2>&1; then
  echo "Installing claude-code..."
  sudo -E npm install -g @anthropic-ai/claude-code
fi

# install uv
if ! command -v uv >/dev/null 2>&1; then
  echo "Installing uv..."
  curl -Ls https://astral.sh/uv/install.sh | sh
fi

# install SuperClaude
# https://github.com/SuperClaude-Org/SuperClaude_Framework
echo "Installing SuperClaude..."
uvx pip install SuperClaude
uvx SuperClaude install --quick -y
