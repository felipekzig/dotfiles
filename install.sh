#!/usr/bin/zsh

# Pretzo
zsh scripts/pretzo.sh

# MacOS
zsh scripts/macos.sh

# Homebrew
zsh scripts/brew.sh

# NodeJS
zsh scripts/node.sh

# Base 16 – Shell
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# Tmux
git clone git@github.com:tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s ~/dotfiles/files/tmux.conf ~/.tmux.conf

# Git
ln -s ~/dotfiles/files/git/gitconfig ~/.gitconfig
ln -s ~/dotfiles/files/git/gitignore ~/.gitignore-global

# Neovim
zsh scripts/neovim.sh

