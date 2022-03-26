#!/bin/bash

echo "Script Started running at $(pwd)"

current_dir=$(pwd)
echo "Creating Symlink for .zshenv"
ln -s $current_dir/general/.zshenv ~

# Creating ~/.config dir
if [ ! -d "~/.config" ];then
	mkdir ~/.config
fi
if [ ! -d "~/repos" ];then
	mkdir ~/repos
fi

echo "Creating symlink for zsh"
ln -s $current_dir/zsh ~/.config/

echo "Creating symlink for nvim"
ln -s $current_dir/nvim ~/.config/

if [ ! -d "$ZDOTDIR/plugins" ];then
	mkdir $ZDOTDIR/plugins
fi

# syntax highlighting for zsh
git -C $ZDOTDIR/plugins clone https://github.com/zsh-users/zsh-syntax-highlighting.git 

# installing nvim latest branch
# Build prerequisites
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen lua5.3 tree -y
if [ ! -d "~/apps" ];then
	mkdir ~/apps 
fi

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
# Install latest node version using nvm
nvm install node

# Clone nvim
git -C ~/apps clone https://github.com/neovim/neovim.git

# Build nvim
cd ~/apps/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

# Install pyright
npm i -g pyright

# Install ripgrep for nvim
sudo apt-get install ripgrep


# Install miniconda
if [ ! -d "$HOME/miniconda3" ]; then
  conda_flag="-b"
else
  conda_flag="-b -u"
fi
curl -o conda_installer.sh https://repo.anaconda.com/miniconda/Miniconda3-py39_4.11.0-Linux-x86_64.sh
bash conda_installer.sh $conda_flag 
source $HOME/miniconda3/bin/activate
conda update conda -y
rm conda_installer.sh

# Install rust
curl https://sh.rustup.rs -sSf | sh -s -- -y --quiet
source $HOME/.cargo/env
sudo apt-get install bat -y

