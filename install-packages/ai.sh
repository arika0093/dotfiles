# install claude-code
if ! command -v claude >/dev/null 2>&1; then
  echo "Installing claude-code..."
  sudo -E npm install -g @anthropic-ai/claude-code
fi

# install SuperClaude
# https://github.com/SuperClaude-Org/SuperClaude_Framework
echo "Installing SuperClaude..."
uvx pip install SuperClaude
uvx SuperClaude install --quick -y
