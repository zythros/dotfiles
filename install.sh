#!/bin/bash
# Post-nemesis setup script
# Run this after 0-current-choices.sh to apply personal configurations

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing personal dotfiles..."

# Copy .config files
if [ -d "$SCRIPT_DIR/.config" ]; then
    cp -r "$SCRIPT_DIR/.config/"* "$HOME/.config/"
    echo "Copied .config files"
fi

echo "Done!"
