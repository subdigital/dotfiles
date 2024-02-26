#!/bin/bash

set -e

# This will install dependencies used by these dotfiles. Assumes homebrew is installed.

echo "📦 Installing neovim..."
brew install neovim

echo "📦 Installing git-delta..."
brew install git-delta

echo "📦 Installing rg..."
brew install rg

echo "📦 Installing wget..."
brew install wget

echo "📦 Installing gh and hub..."
brew install gh
brew install hub

echo "🖥️ Installing wezterm..."
brew install --cask wezterm

echo "🚀 Installing starship..."
brew install starship

echo "🤘 Installing zoxide"
brew install zoxide

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
brew install font-iosevka-nerd-font
brew install font-hack-nerd-font
brew install font-jetbrains-mono-nerd-font

