#!/bin/bash

INSTALL="stow"
yay -S $INSTALL --noconfirm
yay -Yc

rm -rv $HOME/.bashrc
cd $HOME/dotfiles/
stow .

if [ -f "$HOME/.bash_aliases" ]; then
  source "$HOME/.bashrc"
  echo "Success"
  sleep 1
  clear
else
  echo "FAILED"
fi
