# Configuration & Customization – Lesson 1: Pacman Hooks

## 🟡 Lesson Overview
- **Focus:** Learn to create and use pacman hooks for automated tasks
- **Time:** 30 minutes
- **Goal:** Set up custom hooks that execute automatically during package operations

## 🔍 Why This Matters
Pacman hooks allow you to automate tasks that should run after certain package operations. This is powerful for maintaining system consistency, performing backups before critical updates, or running necessary commands after specific packages are updated. Mastering hooks gives you more control over your system's behavior during updates.

## 📚 Core Concepts To Learn

| Concept | Purpose | Example |
|---------|---------|---------|
| Hook Types | When hooks trigger | Install, upgrade, remove |
| Target | What packages trigger the hook | linux, nvidia, etc. |
| Operation | What action to perform | Run a script, update config |
| Hook Location | Where hooks are stored | `/etc/pacman.d/hooks/` |

## ✅ Practice Exercise (20 Minutes)

1. **Explore existing hooks**
   ```bash
   sudo ls -la /etc/pacman.d/hooks/
   ```
   If any exist, examine one:
   ```bash
   sudo cat /etc/pacman.d/hooks/some-hook.hook
   ```

2. **Create a hooks directory if it doesn't exist**
   ```bash
   sudo mkdir -p /etc/pacman.d/hooks
   ```

3. **Create a simple notification hook**
   ```bash
   sudo nano /etc/pacman.d/hooks/package-updated-notify.hook
   ```
   
   Add this content:
   ```ini
   [Trigger]
   Operation = Install
   Operation = Upgrade
   Type = Package
   Target = *
   
   [Action]
   Description = Notify about package installation/upgrade
   When = PostTransaction
   Exec = /usr/bin/notify-send "Package Update" "Packages were just installed or updated on your system."
   ```

4. **Create a backup hook for pacman database**
   ```bash
   sudo nano /etc/pacman.d/hooks/pacman-database-backup.hook
   ```
   
   Add this content:
   ```ini
   [Trigger]
   Operation = Upgrade
   Type = Package
   Target = pacman
   
   [Action]
   Description = Backing up pacman database...
   When = PreTransaction
   Exec = /bin/sh -c "mkdir -p /var/backup/pacman && cp -f /var/lib/pacman/local/ALPM_DB_VERSION /var/backup/pacman/ && tar -czf /var/backup/pacman/pacman_database_$(date +%Y%m%d_%H%M%S).tar.gz /var/lib/pacman/local"
   ```

5. **Create a hook for updating GRUB after kernel updates**
   ```bash
   sudo nano /etc/pacman.d/hooks/update-grub.hook
   ```
   
   Add this content:
   ```ini
   [Trigger]
   Operation = Install
   Operation = Upgrade
   Operation = Remove
   Type = Package
   Target = linux
   Target = linux-lts
   Target = linux-zen
   Target = linux-hardened
   
   [Action]
   Description = Updating GRUB config...
   When = PostTransaction
   Exec = /usr/bin/grub-mkconfig -o /boot/grub/grub.cfg
   ```

6. **Test your hooks (optional)**
   To test the notification hook, you can install a small package:
   ```bash
   sudo pacman -S cowsay
   ```
   You should see a notification after the installation.

## 🧠 Reflection Questions (5 Minutes)
- What types of tasks are best suited for pacman hooks?
- How could hooks help prevent system issues during updates?
- What's the difference between PreTransaction and PostTransaction hooks?

## 🔍 Exploring Further
- Check the Arch Wiki page on pacman hooks:
  ```bash
  xdg-open https://wiki.archlinux.org/title/Pacman#Hooks
  ```
- Look at the alpm-hooks man page:
  ```bash
  man alpm-hooks
  ```

## 📝 Demo Review & Journal Prompt
Today I learned how to create and use pacman hooks for automated tasks.
I created hooks for notifications, database backups, and GRUB updates.
I understand how hooks can be triggered by specific packages or operations.
Next time, I'll explore more advanced hook configurations or learn about other customization options.

## 🌟 Bonus Challenge
Create a more advanced hook that logs all package operations to a custom log file:

```bash
sudo nano /etc/pacman.d/hooks/package-logger.hook
```

```ini
[Trigger]
Operation = Install
Operation = Upgrade
Operation = Remove
Type = Package
Target = *

[Action]
Description = Logging package operations...
When = PostTransaction
Exec = /bin/sh -c "echo \"[$(date '+%Y-%m-%d %H:%M:%S')]: Package operation completed by user $(whoami)\" >> /var/log/pacman-custom.log && pacman -Qe | wc -l | xargs -I{} echo \"Total explicitly installed packages: {}\" >> /var/log/pacman-custom.log"
```

## 📚 Resources for Further Learning
- [Arch Wiki: Pacman Hooks](https://wiki.archlinux.org/title/Pacman#Hooks)
- [Arch Wiki: ALPM Hooks](https://wiki.archlinux.org/title/ALPM_hooks)
- [EndeavourOS Forum: Useful Pacman Hooks](https://forum.endeavouros.com/)