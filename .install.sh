#!/bin/zsh

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Install Rust
# Install rust
if [ ! -f "$HOME/.cargo/bin/cargo" ]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi
source "$HOME/.cargo/env"

# Install Brew
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

# create Brewfile
# brew bundle dump --describe
# brew bundle dump --file=- | grep '^mas'
# brew bundle

brew install mas # Mac App Store command-line interface
mas install 1528890965 #TextSniper OCR Copy & Paste

# Brew Taps
echo "Installing Brew Formulae..."
brew tap homebrew/cask-fonts
brew tap koekeishiya/formulae

# Brew Formulae
brew install node
brew install Alfred # Application launcher and productivity software

brew install jq # Lightweight and flexible command-line JSON processor
brew install gh # GitHub command-line tool
brew install ripgrep #Search tool like grep and The Silver Searcher
brew install imagemagick # Tools and libraries to manipulate images in many formats
# #APP
brew install LuLu # Open-source firewall to block unknown outgoing connections
brew install btop # Resource monitor. C++ version and continuation of bashtop and bpytop
brew install sqlite # Command-line interface for SQLite
brew install displayplacer # Utility to configure multi-display resolutions and arrangements
brew install yt-dlp # Utility to download videos and audio from youtube and other major platform
brew install ffmpeg # Play, record, convert, and stream audio and video
brew install libavif # Library for encoding and decoding .avif files
brew install numi-cli # Smart calculator
brew install python@3.10 # Interpreted, interactive, object-oriented programming language
brew install skhd # Simple hotkey-daemon for macOS
brew tap iina/homebrew-mpv-iina # IINA is the modern video player for macOS.
brew install mpv-iina

# #Terminal Enhancement
brew install bat # A cat clone with syntax highlighting and Git integration
brew install eza # A modern replacement for ls. Show color and icons in your directory listing
brew install zoxide # Shell extension to navigate your filesystem faster
# ## Add this to the end of your config file (usually ~/.zshrc):
# ## eval "$(zoxide init zsh)"
brew install zsh-autosuggestions # Fish-like fast/unobtrusive autosuggestions for zsh
brew install zsh-syntax-highlighting # Fish shell like syntax highlighting for zsh
brew install tree # Display directories as trees (with optional color/HTML output)
brew install fd # Simple, fast and user-friendly alternative to find
brew install fzf # Command-line fuzzy finder written in Go
# ## Set up fzf key bindings and fuzzy completion
# ## source <(fzf --zsh)
# ## Set up fzf key bindings and fuzzy completion
# ## eval "$(fzf --zsh)"
brew install neovim # Ambitious Vim-fork focused on extensibility and agility
brew install lua-language-server # required for editing neovim lua #dependencies
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
# Run :MasonInstallAll command after lazy.nvim finishes downloading plugins.
# Delete the .git folder from nvim folder.
# Learn customization of ui & base46 from :h nvui.

brew install jesseduffield/lazygit/lazygit
brew install lazygit

# #Sketchy Bar
brew tap FelixKratz/formulae
brew install sketchybar # Custom macOS statusbar with shell plugin, interaction and graph support
brew services start sketchybar
brew install switchaudio-osx # Change macOS audio source from the command-line
brew install lua # Powerful, lightweight programming language
brew install borders # A window border system for macoS (for Aerospace)
# ## Bootstrap with AeroSpace by adding to aerospace.toml
# ## after-startup-command = [
# ##   'exec-and-forget borders active_color=0xffe1e3e4 inactive_color=0xff494d64 width=5.0'
# ## ]
# ##
# ## An example configuration file could look like this: ~/.config/borders/bordersrc
# ## !/bin/bash
# ## options=(
# ## 	style=round
# ## 	width=6.0
# ## 	hidpi=off
# ## 	active_color=0xffe2e2e3
# ## 	inactive_color=0xff414550
# ## )
# ## borders "${options[@]}"

brew services start borders
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.28/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf
(git clone https://github.com/FelixKratz/SbarLua.git /tmp/SbarLua && cd /tmp/SbarLua/ && make install && rm -rf /tmp/SbarLua/)
echo "Cloning Config"
git clone https://github.com/FelixKratz/dotfiles.git /tmp/dotfiles
mv $HOME/.config/sketchybar $HOME/.config/sketchybar_backup
mv /tmp/dotfiles/.config/sketchybar $HOME/.config/sketchybar
rm -rf /tmp/dotfiles
brew services restart sketchybar
# ----


# Brew Casks
brew install --cask DB Browser for SQLite # Browser for SQLite databases
brew install --cask zoom
brew install --cask KeyCastr # Open-source keystroke visualiser
brew install --cask AeroSpace # An i3-like tiling window manager for macoS
brew install --cask Warp # Rust-based terminal
# brew install --cask Cutter Reverse engineering platform powered by Rizin

# ShortcutDetective (deprecated) - Detects which app receives a keyboard shortcut (hotkey). shortcutdetective is built for Intel macOS and so requires Rosetta 2 to be installed.
softwareupdate --install-rosetta --agree-to-license
brew install --cask shortcutdetective

# --- START FONT INSTALLATION ---
git clone git@github.com:shaunsingh/SFMono-Nerd-Font-Ligaturized.git /tmp/SFMono_Nerd_Font
mv /tmp/SFMono_Nerd_Font/* $HOME/Library/Fonts
rm -rf /tmp/SFMono_Nerd_Font/

curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.4/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf
brew install --cask sf-symbols # Tool that provides consistent, highly configurable symbols for apps
brew install --cask font-sf-mono
brew install --cask font-sf-pro
brew install --cask font-hack-nerd-font
brew install --cask font-quicksand # for Obsidian Minimal Theme


# --- Installing fonts not found in brew install --cask font-[fhow to install quicksand font from google using command linehow to install quicksand font from google using command linehow to install quicksand font from google using command linehow to install quicksand font from google using command lineont-name]
FONT_URL="https://static.1001fonts.com/download/overdrive-sunset.zip"
FONT_DIR="$HOME/Library/Fonts"
# Download and unzip the font
curl -L "$FONT_URL" -o /tmp/font.zip
unzip -o /tmp/font.zip -d /tmp/font
# Copy the font files to the Fonts directory
find /tmp/font -name "*.ttf" -exec cp {} "$FONT_DIR" \;
# Clean up
rm -rf /tmp/font /tmp/font.zip
echo "Font installed successfully to $FONT_DIR"

# --- END FONT INSTALLATION ---

# Start Services
echo "Starting Services (grant permissions)..."
brew services start skhd


###############################################################################
# Editor App                                                                    #
###############################################################################

# Karabiner Editor
brew install yqrashawn/goku/goku # karabiner configurator ttps://github.com/yqrashawn/GokuRakuJoudo



# macOS Settings
echo "Changing macOS defaults..."
# defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
# defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# defaults write com.apple.spaces spans-displays -bool false
# defaults write com.apple.dock autohide -bool true
# defaults write com.apple.dock "mru-spaces" -bool "false"
# defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
# defaults write com.apple.LaunchServices LSQuarantine -bool false
# defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
# defaults write NSGlobalDomain KeyRepeat -int 1
# defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# defaults write NSGlobalDomain _HIHideMenuBar -bool true
# defaults write NSGlobalDomain AppleHighlightColor -string "0.65098 0.85490 0.58431"
# defaults write NSGlobalDomain AppleAccentColor -int 1
# defaults write com.apple.screencapture location -string "$HOME/Desktop"
# defaults write com.apple.screencapture disable-shadow -bool true
# defaults write com.apple.screencapture type -string "png"
# defaults write com.apple.finder DisableAllAnimations -bool true
# defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
# defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
# defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
# defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
# defaults write com.apple.Finder AppleShowAllFiles -bool true
# defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# defaults write com.apple.finder ShowStatusBar -bool false
# defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool YES
# defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
# defaults write com.apple.Safari IncludeDevelopMenu -bool true
# defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
# defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
# defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

###############################################################################
# macoS GENARAL UI/UX                                                         #
###############################################################################

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

######
# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Hide all desktop icons because who need 'em'
defaults write com.apple.finder CreateDesktop -bool false

# Disable shadow in screenshots
# defaults write com.apple.screencapture disable-shadow -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Stop iTunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

# Automatically illuminate built-in MacBook keyboard in low light
defaults write com.apple.BezelServices kDim -bool true

# Turn off keyboard illumination when computer is not used for 5 minutes
defaults write com.apple.BezelServices kDimTime -int 300

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Set sidebar icon size to medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool 

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable Notification Center and remove the menu bar icon
# launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

# Disable automatic capitalization as it’s annoying when typing cvode
# defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
# defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
# defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
# defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
# defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Set a custom wallpaper image. `DefaultDesktop.jpg` is already a symlink, and
# all wallpapers are in `/Library/Desktop Pictures/`. The default is `Wave.jpg`.
#rm -rf ~/Library/Application Support/Dock/desktoppicture.db
#sudo rm -rf /System/Library/CoreServices/DefaultDesktop.jpg
#sudo ln -s /path/to/your/image /System/Library/CoreServices/DefaultDesktop.jpg

# Set language and text formats
# Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# `Inches`, `en_GB` with `en_US`, and `true` with `false`.
# defaults write NSGlobalDomain AppleLanguages -array "en" "nl"
# defaults write NSGlobalDomain AppleLocale -string "en_GB@currency=EUR"
# defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
# defaults write NSGlobalDomain AppleMetricUnits -bool true

###############################################################################
# Finder                                                                      #
###############################################################################

# Finder: show hidden files by default
defaults write com.apple.Finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show the ~/Library folder
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true


###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Don’t show recent applications in Dock
# defaults write com.apple.dock show-recents -bool false


# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Enable grouping windows by application in Mission Control
defaults write com.apple.dock expose-group-apps -bool true

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
#defaults write com.apple.dock persistent-apps -array

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
# Top left screen corner → Mission Control
# defaults write com.apple.dock wvous-tl-corner -int 2
# defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Desktop
# defaults write com.apple.dock wvous-tr-corner -int 4
# defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → Start screen saver
# defaults write com.apple.dock wvous-bl-corner -int 5
# defaults write com.apple.dock wvous-bl-modifier -int 0

###############################################################################
# Safari & WebKit                                                             #
###############################################################################

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Warn about fraudulent websites
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# Block pop-up windows
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Update extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true


###############################################################################
# Time Machine                                                                #
###############################################################################

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine backups
hash tmutil &> /dev/null && sudo tmutil disablelocal

###############################################################################
# Photos                                                                      #
###############################################################################

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

###############################################################################
# Transmission.app                                                            #
###############################################################################

# Use `~/Documents/Torrents` to store incomplete downloads
# defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
# defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Documents/Torrents"

# Use `~/Downloads` to store completed downloads
# defaults write org.m0k.transmission DownloadLocationConstant -bool true

# Don’t prompt for confirmation before downloading
# defaults write org.m0k.transmission DownloadAsk -bool false
# defaults write org.m0k.transmission MagnetOpenAsk -bool false

# Don’t prompt for confirmation before removing non-downloading active transfers
# defaults write org.m0k.transmission CheckRemoveDownloading -bool true

# Trash original torrent files
# defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

# Hide the donate message
# defaults write org.m0k.transmission WarningDonate -bool false
# Hide the legal disclaimer
# defaults write org.m0k.transmission WarningLegal -bool false

# IP block list.
# Source: https://giuliomac.wordpress.com/2014/02/19/best-blocklist-for-transmission/
# defaults write org.m0k.transmission BlocklistNew -bool true
# defaults write org.m0k.transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"
# defaults write org.m0k.transmission BlocklistAutoUpdate -bool true

# Randomize port on launch
# defaults write org.m0k.transmission RandomPort -bool true

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Set highlight color to green
defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"


# Python Packages
echo "Installing Python Packages..."
#!/bin/bash

# install all pip packages required
install_pip_packages() {
    packages=(
        aiohttp Markdown matplotlib numpy pandas pydantic
    )
    
    echo -e "\n[i] total packages to install: ${#packages[@]}"
    
    for package in "${packages[@]}"; do
        echo "[→] Installing $package..."
        pip install "$package"
    done
}

# Ensure pip is installed and up-to-date
ensure_pip_installed

# Install all packages
install_pip_packages

echo -e "\n[*] all pip packages installed."


###############################################################################
# SETTINGS                                                                    #
###############################################################################
# Setting up aliases from .dotfiles
echo 'source ~/.dotfiles/.aliases' >> ~/.zshrc

# EZA - move config folder to ~/.config/eza so that theme.yaml can be read
echo 'export EZA_CONFIG_DIR="$HOME/.config/eza"' >> ~/.zshrc

# BTOP
# to setup BTOP Theme just press ESC and choose options
#
