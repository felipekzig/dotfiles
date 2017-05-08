#!/usr/bin/zsh

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update
brew upgrade --all

brew install coreutils
ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

brew install nvim/nvim/nvim
brew install homebrew/dupes/openssh

brew install zsh zsh-completions
brew install tmux

brew install autoconf
brew install automake
brew install awscli
brew install cloog018
brew install cloudfoundry-cli
brew install cmake
brew install cscope
brew install gcc49
brew install gdbm
brew install git
brew install gmp
brew install gmp4
brew install gnutls
brew install isl011
brew install libevent
brew install libgpg-error
brew install libksba
brew install libmpc08
brew install libtasn1
brew install libtool
brew install libyaml
brew install makedepend
brew install mpfr2
brew install nettle
brew install openssl
brew install pcre
brew install pkg-config
brew install python3
brew install readline
brew install sqlite
brew install the_silver_searcher
brew install xz

# Cloud Foundry
brew tap cloudfoundry/tap
brew install cf-cli

# Brew Cask
brew cask install google-chrome
brew cask install google-drive
brew cask install google-hangouts
brew cask install insomnia
brew cask install iterm2
brew cask install skype
brew cask install spotify
brew cask install spotifree
brew cask install visual-studio-code

# Clean up
brew cleanup
