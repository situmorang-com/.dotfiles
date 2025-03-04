#!/bin/bash

FONT_URL="https://www.1001fonts.com/download/overdrive-sunset.zip"
FONT_DIR="$HOME/Library/Fonts"
TEMP_DIR="/tmp/font"

# Download and unzip the font
echo "Downloading font..."
curl -L "$FONT_URL" -o /tmp/font.zip || { echo "Failed to download font."; exit 1; }

# Check if the downloaded file is a valid ZIP
if unzip -t /tmp/font.zip &>/dev/null; then
    echo "Unzipping font..."
    unzip -o /tmp/font.zip -d "$TEMP_DIR" || { echo "Failed to unzip font."; exit 1; }

    # Install each font file (both .ttf and .otf)
    echo "Installing font..."
    find "$TEMP_DIR" \( -name "*.ttf" -o -name "*.otf" \) -print0 | while IFS= read -r -d '' FONT_FILE; do
        echo "Adding $FONT_FILE to Font Book..."
        cp "$FONT_FILE" "$FONT_DIR"
        /usr/bin/osascript <<EOD
        tell application "Font Book"
            open POSIX file "$FONT_FILE"
            activate
        end tell
EOD
    done

    # Clean up
    rm -rf "$TEMP_DIR" /tmp/font.zip
    echo "Font installed successfully and added to Font Book."
else
    echo "Downloaded file is not a valid ZIP archive."
    rm -f /tmp/font.zip
    exit 1
fi

