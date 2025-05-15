Schedule: 30-minute sessions | Tuesday–Friday

This routine is designed for Arch-based mastery using EndeavourOS. It blends command-line usage, system care, and learning from the Arch Wiki into a repeatable structure. Each day has a theme you’ll return to weekly with new lessons and hands-on tasks.



🔵 Tuesday: Maintenance & System Hygiene

Keep your system lean, updated, and monitored





Perform system updates (pacman, yay, mirrors)



Clean package cache, remove orphaned packages



Check logs (journalctl, systemd, dmesg)



Disk and memory usage checks (df -h, free -h)



Review .pacnew files and pacman.conf changes

🧪 Sample lesson types:





"How to fix broken packages from AUR"



"Cleaning pacman cache and rebuilding initramfs"



"Reading journalctl error logs for last boot"



🟢 Wednesday: Arch Command Mastery

Practice key Arch/CLI tools and build shell confidence





Deep dive into tools like pacman, makepkg, systemctl, eos-log-tool, reflector



Install and remove packages manually (CLI-only)



Use yay or build from PKGBUILD



Practice flag options, write CLI cheat notes

🧪 Sample lesson types:





"Using makepkg to build from source"



"Understanding pacman -Qdtq and removing unused deps"



"Mastering reflector for fast mirror selection"



🟡 Thursday: Configuration & Customization

Get hands-on with your system files and environment





Explore ~/.config, ~/.bashrc, ~/.zshrc, /etc



Customize shell prompt, aliases, themes



Learn about system hooks and service overrides



Backup and version dotfiles (git, chezmoi, etc.)

🧪 Sample lesson types:





"Create a custom bash alias set"



"Change and persist GRUB timeout or theme"



"Version your dotfiles with chezmoi or bare Git repo"



🔴 Friday: The Arch Way & Exploratory Learning

Advance your understanding through reading and applying





Browse the Arch Wiki, Arch News, Reddit (/r/archlinux)



Pick one new system concept weekly to explore



Apply: create a systemd unit, timer, cron job, etc.



Review and document what you’ve learned



Push updates to your notes site: linux.zackrylangford.com

🧪 Sample lesson types:





"Understand systemd timers with a working backup example"



"Build and use a local package repo"



"Implement a custom systemd service for syncing files"



📌 Evergreen Tips for EndeavourOS





Use eos-welcome to access tools, wiki links, drivers



Clean package cache weekly:
sudo paccache -rk1 (1 version),
sudo pacman -Rns $(pacman -Qdtq) (orphans)



Check for .pacnew files after large updates:
sudo find /etc -name "*.pacnew"



Customize pacman hooks: /etc/pacman.d/hooks/



Let me know when you're ready for Lesson 1 of the new rotation (Tuesday: Maintenance & System Hygiene) and I’ll generate it!