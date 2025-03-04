# dotfiles
My macOS configuration files.


Most setup steps are in `.install.sh`


https://dotfiles.github.io/utilities/

SketchyBar Setup
----------------------
The present config for sketchybar is done entirely in lua (and some C), using
[SbarLua](https://github.com/FelixKratz/SbarLua).
One-line install for sketchybar config (requires brew to be installed):
```bash
curl -L https://raw.githubusercontent.com/FelixKratz/dotfiles/master/install_sketchybar.sh | sh
```

# Brew Installation

brew bundle --file ~/.dotfiles/Brewfile
