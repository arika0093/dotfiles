#!/bin/bash
# install japanese-font
if ! fc-list | grep -q "vlgothic"; then
  echo "Installing Japanese font..."
  sudo apt-get install -y fonts-vlgothic
fi

# if not installed playwright
if ! claude mcp list | grep -q playwright; then
  npx playwright install chrome -y
  claude mcp add playwright npx @playwright/mcp@latest
fi