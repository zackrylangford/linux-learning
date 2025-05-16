# Configuration & Customization – Lesson 1: GNOME Desktop Customization

## 🟡 Lesson Overview
- **Focus:** Customize the GNOME desktop environment in Ubuntu
- **Time:** 30 minutes
- **Goal:** Learn to personalize your Ubuntu desktop experience through GNOME settings and extensions

## 🔍 Why This Matters
The desktop environment is your primary interface with Ubuntu. Customizing it to match your workflow increases productivity and makes your computing experience more enjoyable. GNOME is highly customizable, and learning these skills will help you create a personalized environment.

## 📚 Core Concepts To Learn

| Tool/Concept | Purpose | Location |
|--------------|---------|----------|
| GNOME Settings | Basic customization | Activities > Settings |
| GNOME Tweaks | Advanced customization | Install via apt |
| GNOME Extensions | Add functionality | extensions.gnome.org |
| dconf-editor | Low-level configuration | Install via apt |
| gsettings | CLI configuration | Terminal |

## ✅ Practice Exercise (20 Minutes)

1. **Install necessary tools**
   ```bash
   sudo apt install gnome-tweaks gnome-shell-extensions dconf-editor
   ```

2. **Explore GNOME Settings**
   - Open Settings from the system menu
   - Browse through Appearance, Notifications, and Privacy sections
   - Change your wallpaper and accent color

3. **Use GNOME Tweaks for advanced settings**
   ```bash
   gnome-tweaks
   ```
   - Explore the Appearance tab to change themes
   - Check the Top Bar section to show weekday or seconds
   - Try the Window Titlebars options to customize buttons

4. **Install a GNOME extension**
   - Install the browser extension for your browser from extensions.gnome.org
   - Visit https://extensions.gnome.org
   - Search for and install "Dash to Panel" or "Dash to Dock"
   - Configure the extension settings

5. **Use gsettings from the command line**
   ```bash
   # Show all GNOME settings
   gsettings list-recursively | grep -i theme
   
   # Change the theme
   gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
   
   # Reset to default
   gsettings reset org.gnome.desktop.interface gtk-theme
   ```

6. **Explore dconf-editor (with caution)**
   ```bash
   dconf-editor
   ```
   - Navigate to org > gnome > desktop > interface
   - Explore available settings (be careful about changing values)

## 🧠 Reflection Questions (5 Minutes)
- How does the GNOME customization system compare to other desktop environments you've used?
- Which customizations would most improve your daily workflow?
- Why might you use gsettings instead of the graphical interfaces?

## 🔍 Exploring Further
- Check what GNOME extensions are currently enabled:
  ```bash
  gnome-extensions list --enabled
  ```
- Explore theme locations:
  ```bash
  ls -la /usr/share/themes/
  ls -la ~/.themes/ 2>/dev/null || echo "~/.themes directory doesn't exist yet"
  ```

## 📝 Demo Review & Journal Prompt
Today I learned how to customize the GNOME desktop environment in Ubuntu.
I explored both graphical tools like GNOME Settings and Tweaks, and command-line tools like gsettings.
I installed and configured a GNOME extension to enhance my desktop functionality.
Next time, I'll explore how to create and manage custom keyboard shortcuts for improved workflow.

## 🌟 Bonus Challenge
Create a simple script that backs up your current GNOME settings and can restore them later:

```bash
#!/bin/bash
# gnome-backup.sh - Backup and restore GNOME settings

BACKUP_FILE="$HOME/gnome-settings-backup.dconf"

case "$1" in
  backup)
    echo "Backing up GNOME settings to $BACKUP_FILE"
    dconf dump /org/gnome/ > "$BACKUP_FILE"
    echo "Backup complete!"
    ;;
  restore)
    if [ -f "$BACKUP_FILE" ]; then
      echo "Restoring GNOME settings from $BACKUP_FILE"
      dconf load /org/gnome/ < "$BACKUP_FILE"
      echo "Restore complete!"
    else
      echo "Error: Backup file not found!"
    fi
    ;;
  *)
    echo "Usage: $0 {backup|restore}"
    ;;
esac
```

## 📚 Resources for Further Learning
- [GNOME User Help](https://help.gnome.org/)
- [GNOME Extensions Website](https://extensions.gnome.org)
- [Ubuntu Desktop Guide](https://help.ubuntu.com/stable/ubuntu-help/)