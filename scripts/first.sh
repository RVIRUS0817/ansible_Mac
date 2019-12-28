#!/bin/bash

## install xcode
sudo xcodebuild -license
sudo xcode-select --install

## install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew install ansible

## install terminal fonts
cd ~/ && git clone https://github.com/powerline/fonts.git
fonts/install.sh && rm -rf ~/fonts
