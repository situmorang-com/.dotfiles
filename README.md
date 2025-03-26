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

# Creating your first Repo in github
```bash
git init
git add .
git commit -m "Initial commit"
gh repo create <repo-name> --public --source=. --push
```
What This Command Does
gh repo create <repo-name>
Creates a new repository on GitHub with the given name.
--public
Sets the repository visibility to public (you can use --private if preferred).
--source=.
Uses the current directory as the source for the repository. If the current directory isn’t already a Git repository, you’ll need to run git init and commit your files first.
--push
Automatically pushes your local commits to the new GitHub repository.


Working with the File Explorer NVCHAD (Leader - e)

To work with your project's file tree NvimTree provides a number of useful shortcuts for its management, which are:

R (refresh) to perform a reread of the files contained in the project
H (hide) to hide/display hidden files and folders (beginning with a dot .)
E (expand_all) to expand the entire file tree starting from the root folder (workspace)
W (collapse_all) to close all open folders starting from the root folder
- (dir_up) allows you to go back up folders. This navigation also allows you to exit the root folder (workspace) to your home directory
s (system) to open the file with the system application set by default for that file type
f (find) to open the interactive file search to which search filters can be applied
F to close the interactive search
Ctrl + k to display information about the file such as size, creation date, etc.
g + ? to open the help with all the predefined shortcuts for quick reference
q to close the file explorer 

# Install NVCHAD Neovim

```bash
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
```
Run :MasonInstallAll command after lazy.nvim finishes downloading plugins.
Delete the .git folder from nvim folder.
Learn customization of ui & base46 from :h nvui.

## Update
`Lazy sync`


