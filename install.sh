#!/bin/bash

PACKAGES="stow helix ghostty ttf-iosevka-nerd"
INSTALL="sudo pacman -S"

if [ -f /bin/pacman ]; then
  echo "Using pacman to install required packages"
  $INSTALL $PACKAGES
  cd ~/dotfiles
  stow .
  echo "Finished installing."
  echo "Since zsh has its own setup, install it separately."
else
  echo "ERROR: pacman not found!"
fi
