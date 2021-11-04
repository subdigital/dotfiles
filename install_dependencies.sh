#!/bin/bash

set -e

# This will install dependencies used by these dotfiles. Assumes homebrew is installed.

echo "📦 Installing neovim..."
brew install neovim

echo "🔌 Installing vim-plug"
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "📦 Installing fzy..."
brew install fzy

echo "📦 Installing git-delta..."
brew install git-delta

echo "📦 Installing ag..."
brew install ag

echo "📦 Installing wget..."
brew install wget

echo "📦 Installing hub..."
brew install hub

# Symlink vim -> nvim
if [[ "$(readlink /usr/local/bin/vim)" == "/usr/local/bin/nvim" ]]
then
  echo "✅ vim is already symlinked to nvim"
else
  echo "⚙️  symlink vim → nvim"
  ln -s /usr/local/bin/{n,}vim
fi

# Fonts
if [[ ! -f ~/Library/Fonts/DejaVu%20Sans%20Mono%20for%20Powerline.ttf ]]
then
  echo "Installing DejaVu Sans Mono (Powerline) font..."
  cd ~/Library/Fonts && \
    wget https://github.com/powerline/fonts/blob/master/DejaVuSansMono/DejaVu%20Sans%20Mono%20for%20Powerline.ttf && \
    cd -
fi

