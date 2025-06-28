#!/bin/bash
DIR="$(cd "$(dirname "$0")" && pwd)"

# Packages
sudo apt install tmux git jq redshift ttyd xsel qemu-system-x86

# Configs
. "$DIR/copyconfigs.sh"
if [[ ! -d "$HOME/.local/share/nvim/lazy/lazy.nvim" ]]; then
  git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable ~/.local/share/nvim/lazy/lazy.nvim
fi

# Install Brave
if ! command -v brave-browser >/dev/null 2>&1; then
  curl -fsS https://dl.brave.com/install.sh | sh
fi

# Install latest Neovim via AppImage only if not already installed
if ! command -v nvim >/dev/null 2>&1; then
  wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
  chmod +x nvim-linux-x86_64.appimage
  sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim
fi

# Services
systemctl --user enable --now redshift.service
sudo systemctl disable --now ttyd
