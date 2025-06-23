#!/bin/sh

# Packages
sudo apt install neovim tmux git jq redshift
systemctl --user enable --now redshift.service

# Configs
. ./copyconfigs.sh
