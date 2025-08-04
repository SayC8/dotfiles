#!/bin/bash

echo "--------------------"
echo "Installing stow and bob (neovim version switcher)"
sleep 1
INSTALL="stow bob"
yay -S $INSTALL --noconfirm
yay -Yc

echo "--------------------"
echo "Installing dots"
sleep 1
rm -rv $HOME/.bashrc
cd $HOME/dotfiles/
stow .
source "$HOME./bashrc"

if [ -f "$HOME/.bash_aliases" ]; then
	source "$HOME/.bashrc"
	echo "--------------------"
	echo "Success"
else
	echo "--------------------"
	echo "FAILED"
fi
