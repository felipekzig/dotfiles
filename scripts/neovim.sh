#!/usr/bin/zsh

# Brew module
brew tap neovim/neovim
brew install neovim

# Python
sudo easy_install pip
pip2 install --user neovim
pip3 install --user neovim

# Plug Manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Files
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/files/neovimrc.vim ~/.config/nvim/init.vim
