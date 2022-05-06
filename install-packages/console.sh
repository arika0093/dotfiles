#!/bin/bash
# starship (local install)
mkdir -p $HOME/.bin
curl -sS https://starship.rs/install.sh | sh -s -- -y -b $HOME/.bin
