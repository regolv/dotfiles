#! /usr/bin/env zsh

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# ZSH
brew install zsh

# Set as default (does this work at all?)
chsh -s /usr/local/bin/zsh
