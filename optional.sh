#!/bin/bash

PACKAGES="firefox thunderbird gnome-disk-utility gwenview"
INSTALL="sudo pacman -S"

if [ -f /bin/pacman ]; then
  echo "Using pacman to install packages"
  $INSTALL $PACKAGES
  echo "Finished installing."
else
  echo "ERROR: pacman not found!"
fi
