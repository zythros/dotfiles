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

# Rebuild chadwm if config was updated
if [ -f "$HOME/.config/arco-chadwm/chadwm/config.def.h" ]; then
    echo "Rebuilding chadwm..."
    cd "$HOME/.config/arco-chadwm/chadwm"
    rm -f config.h
    sudo make clean install
    echo "Chadwm rebuilt"
fi

echo "Done!"
