#!/bin/sh

# Packages
sudo apt install neovim tmux git jq redshift

# Configs
. ./copyconfigs.sh
systemctl --user enable --now redshift.service
