#!/bin/bash

set -e

# This will install dependencies used by these dotfiles. Assumes homebrew is installed.

function install_package() {
  echo "📦 Installing $1..."
  brew install $1
}

function install_cask_package() {
  echo "📦 Installing $1..."
  brew install --cask $1
}

install_package neovim
install_package git-delta
install_package rg
install_package fzf
install_package wget
install_package gh
install_package hub
install_cask_package wezterm
install_package starship
install_package zoxide
install_package lazygit
install_package zsh-autosuggestions
install_package zsh-syntax-highlighting

# Install yazi and plugins
install_package yazi
ya pack --install

# Symlink vim -> nvim
if [[ "$(readlink /usr/local/bin/vim)" == "/usr/local/bin/nvim" ]]
then
  echo "✅ vim is already symlinked to nvim"
else
  echo "⚙️  symlink vim → nvim"
  ln -s /usr/local/bin/{n,}vim || echo "(failed)"
fi

# Fonts
echo "📘 Installing homebrew/cask-fonts"
brew tap homebrew/cask-fonts
install_package font-iosevka-nerd-font
install_package font-hack-nerd-font
install_package font-jetbrains-mono-nerd-font

