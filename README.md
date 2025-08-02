# Setup

```bash

cd ~/
git clone https://github.com/SayC8/dotfiles.git
cd ~/dotfiles
stow .
bash # To refresh bash aliases etc

# If you have your own .bashrc just add this at the end
# and remove the .bashrc from ~/dotfiles before running "stow ."

ALIASES_FILE="$HOME/.bash_aliases"
if [ -f "$ALIASES_FILE" ]; then
  source "$ALIASES_FILE"
fi

```

## Extra stuff

I am currently using [Omarchy](https://omarchy.org/) full version as a baseline setup.

Edit hyprland.conf to include:

```conf
input {
  kb_options = caps:escape
  repeat_rate = 40
  repeat_delay = 300
  sensitivity = 0.35
}
```

Also included is a cleanup script to remove the packages I personally don't
use

```bash
./clean_omarchy.sh

```
