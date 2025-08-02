#!/bin/bash

set -x

REMOVE="spotify 1password signal-desktop"
INSTALL="bauh"

yay -Rns $REMOVE
yay -S $INSTALL --noconfirm
yay -Yc
