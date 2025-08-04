# Setup

I am currently using [Omarchy](https://omarchy.org/) bare version as a baseline setup.
Also [bob]() to manage neovim versions

```bash

cd ~/
git clone https://github.com/SayC8/dotfiles
cd ~/dotfiles
./install.sh

# If you already have your own .bashrc just add this at the end
# and remove the .bashrc from ~/dotfiles before running "stow ."

ALIASES_FILE="$HOME/.bash_aliases"
if [ -f "$ALIASES_FILE" ]; then
  source "$ALIASES_FILE"
fi

```
