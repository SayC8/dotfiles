# Setup

I am currently using [Omarchy](https://omarchy.org/) bare version as a baseline setup.
[bob](https://github.com/MordechaiHadad/bob) is used to manage [neovim](https://github.com/neovim/neovim) versions.

When using the install script Bob will install both the stable and nightly versions.
The nightly version is set as the default. (Check .bash_aliases to change)

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

## Neovim

Recently switched to a more barebones setup with nvim v0.12.

The main plugins are:
- [mini](https://github.com/echasnovski/mini.nvim)
- [oil](https://github.com/stevearc/oil.nvim)

Colorscheme:
- [bamboo](https://github.com/ribru17/bamboo.nvim)
- [omarchy-osaka-jade-theme](https://github.com/Justikun/omarchy-osaka-jade-theme)
