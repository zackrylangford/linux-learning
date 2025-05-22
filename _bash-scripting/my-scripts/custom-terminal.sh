#!/bin/bash
# Interactive script to customize the Bash prompt display name and directory color
# Usage: custom-terminal

BASHRC="$HOME/.bashrc"

# Prompt for display name
read -p "Enter your preferred display name (leave blank to use your username): " display_name
if [ -z "$display_name" ]; then
    display_name="\u"  # Use \u for current username
fi

# Prompt for directory color
read -p "Do you want to color the directory? (y/n): " color_dir
if [[ "$color_dir" =~ ^[Yy]$ ]]; then
    dir_color="\\[\\e[34m\\]"  # Blue
    reset_color="\\[\\e[0m\\]"
else
    dir_color=""
    reset_color=""
fi

# Prompt for display name color
read -p "Do you want to color the display name? (y/n): " color_name
if [[ "$color_name" =~ ^[Yy]$ ]]; then
    name_color="\\[\\e[32m\\]"  # Green
    name_reset="\\[\\e[0m\\]"
else
    name_color=""
    name_reset=""
fi

# Build the PS1 string
PS1_line="export PS1=\"${name_color}${display_name}${name_reset}:${dir_color}\\w${reset_color}\\$ \""

# Backup .bashrc
cp "$BASHRC" "$BASHRC.bak.$(date +%Y%m%d%H%M%S)"

# Remove any previous custom-terminal PS1 lines
sed -i '/^export PS1=.*custom-terminal-setup/d' "$BASHRC"

# Add the new PS1 to .bashrc with a marker
{
    echo "# custom-terminal-setup"
    echo "$PS1_line"
} >> "$BASHRC"

# Source the new .bashrc
source "$BASHRC"

echo "\nYour terminal prompt has been updated!"
echo "If you want to revert, restore from the backup: $BASHRC.bak.YYYYMMDDHHMMSS"
