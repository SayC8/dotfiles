# Setup

## Requirements (kinda)

[Omarchy](https://omarchy.org/)

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

## Custom

- bash aliases

---

## Extra stuff

Edit hyprland.conf to include:

```conf
input {
  kb_options = caps:escape
  repeat_rate = 40
  repeat_delay = 300
  sensitivity = 0.35
}
```
