# Ubuntu Learning Schedule

**Schedule:** 30-minute sessions | Sunday, Monday, Friday, Saturday

This routine is designed for Ubuntu mastery. It blends command-line usage, system care, and learning from the Ubuntu documentation into a repeatable structure. Each day has a theme you'll return to weekly with new lessons and hands-on tasks.

## 🔵 Sunday: System Maintenance & Updates
*Keep your system lean, updated, and monitored*

- Perform system updates (apt, Snap, Software Center)
- Clean package cache, remove orphaned packages
- Check logs (journalctl, systemd, dmesg)
- Disk and memory usage checks (df -h, free -h)
- Review system health and Ubuntu specific tools

### 🧪 Sample lesson types:
- "How to fix broken packages with apt"
- "Cleaning apt cache and managing kernels"
- "Reading journalctl error logs for last boot"

## 🟢 Monday: Command Line Mastery
*Practice key Ubuntu CLI tools and build shell confidence*

- Deep dive into tools like apt, dpkg, systemctl, journalctl
- Install and remove packages manually (CLI-only)
- Practice with Ubuntu specific tools and commands
- Learn flag options, write CLI cheat notes

### 🧪 Sample lesson types:
- "Using apt vs apt-get effectively"
- "Understanding dpkg -l and removing unused dependencies"
- "Mastering Ubuntu PPAs and repository management"

## 🟡 Friday: Configuration & Customization
*Get hands-on with your system files and GNOME desktop environment*

- Explore ~/.config, ~/.bashrc, ~/.zshrc, /etc
- Customize shell prompt, aliases, themes
- Configure GNOME desktop settings and extensions
- Backup and version dotfiles (git, chezmoi, etc.)

### 🧪 Sample lesson types:
- "Create a custom bash alias set"
- "Customize GNOME desktop with extensions"
- "Version your dotfiles with chezmoi or bare Git repo"

## 🔴 Saturday: Exploration & Projects
*Advance your understanding through reading and applying*

- Browse the Ubuntu documentation, Ubuntu Wiki, Ask Ubuntu
- Pick one new system concept weekly to explore
- Apply: create a systemd unit, timer, cron job, etc.
- Review and document what you've learned
- Push updates to your notes site: linux.zackrylangford.com

### 🧪 Sample lesson types:
- "Understand systemd timers with a working backup example"
- "Configure Snap and optimize application management"
- "Implement a custom systemd service for syncing files"

## 📌 Evergreen Tips for Ubuntu

- Use Software Center for graphical package management
- Clean package cache weekly:
  ```
  sudo apt clean
  sudo apt autoremove
  ```
- Check for configuration changes after large updates:
  ```
  sudo find /etc -name "*.dpkg-*"
  ```
- Use Timeshift for system backups
- Leverage Ubuntu's extensive community support

Let me know when you're ready for Lesson 1 of the new rotation (Sunday: System Maintenance & Updates) and I'll generate it!