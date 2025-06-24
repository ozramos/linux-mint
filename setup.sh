#!/bin/sh
DIR="$(cd "$(dirname "$0")" && pwd)"

# Packages
sudo apt install neovim tmux git jq redshift ttyd xsel

# Configs
. "$DIR/copyconfigs.sh"

# Services
systemctl --user enable --now redshift.service
sudo systemctl disable --now ttyd
