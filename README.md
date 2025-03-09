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

# Setup Github authentication
Once you authenticate with gh, it can handle token management for you, so you won’t have to enter your PAT or update remote URLs manually.

Follow the prompts. You can choose to authenticate using a web-based flow (which is often easier) or by pasting a personal access token.

Using gh streamlines the process and makes it easier to manage your GitHub repositories without dealing directly with PATs or SSH configuration if you prefer HTTPS.

```bash
gh auth login
```
