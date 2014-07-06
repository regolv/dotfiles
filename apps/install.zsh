#! /usr/bin/env zsh

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

brew cask install --appdir="/Applications" vagrant
brew cask install --appdir="/Applications" virtualbox

brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" sequel-pro

brew cask install --appdir="/Applications" phpstorm-eap
brew cask install --appdir="/Applications" sublime-text3

brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" google-chrome

brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" spectacle
brew cask install --appdir="/Applications" the-unarchiver
brew cask install --appdir="/Applications" vlc
