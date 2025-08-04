#!/bin/bash

echo "--------------------"
echo "Cleaning up a little"
REMOVE="neovim"
yay -Rns $REMOVE
rm -rfv $HOME/.local/share/nvim
rm -rfv $HOME/.local/state/nvim
rm -rfv $HOME/.cache/nvim

echo "--------------------"
echo "Installing stow and bob (neovim version switcher)"
sleep 1
INSTALL="stow bob"
yay -S $INSTALL
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
