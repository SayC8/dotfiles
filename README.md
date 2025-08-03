# Setup

I am currently using [Omarchy](https://omarchy.org/) bare version as a baseline setup.

```bash
cd ~/
git clone https://github.com/SayC8/dotfiles.git
cd ~/dotfiles
stow .
bash # To refresh bash aliases etc

# If you already have your own .bashrc just add this at the end
# and remove the .bashrc from ~/dotfiles before running "stow ."

ALIASES_FILE="$HOME/.bash_aliases"
if [ -f "$ALIASES_FILE" ]; then
  source "$ALIASES_FILE"
fi

```

## Extra stuff

Edit hyprland.conf to include:

```conf
input {
  kb_options = caps:escape
  repeat_delay = 300
}
```
