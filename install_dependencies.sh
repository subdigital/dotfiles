#!/bin/bash

set -e

# This will install dependencies used by these dotfiles. Assumes homebrew is installed.

echo "📦 Installing neovim..."
brew install neovim

echo "📦 Installing git-delta..."
brew install git-delta

# Symlink vim -> nvim
if [[ "$(readlink /usr/local/bin/vim)" == "/usr/local/bin/nvim" ]]
then
  echo "✅ vim is already symlinked to nvim"
else
  echo "⚙️  symlink vim → nvim"
  ln -s /usr/local/bin/{n,}vim
fi

