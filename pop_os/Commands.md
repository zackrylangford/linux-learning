# 🧠 Pop!_OS Command Practice Plan

This guide is tailored for a Debian/Ubuntu-based system with realistic daily-use tasks focused on Pop!_OS tools, package management, and system maintenance. The format matches your EndeavourOS practice sheet, optimized for Motion Docs.

---

## 📂 File and Directory Management (Tier 1)

- **`ls`** – List directory contents  
  ➤ Run `ls -lh /etc/apt/` to explore sources.list and repository files.
- **`cd`** – Change current directory  
  ➤ Navigate to your local project: `cd ~/Projects/linux-learning`.
- **`pwd`** – Show current path  
  ➤ Confirm you're inside a Git repo folder with `pwd`.
- **`mkdir`** – Make a new directory  
  ➤ Create a folder to store backups: `mkdir ~/backups`.
- **`rmdir`** – Remove an empty directory  
  ➤ Clean up an abandoned test folder.
- **`rm`** – Remove files or directories  
  ➤ Remove leftover `.deb` package files after install.
- **`cp`** – Copy files or directories  
  ➤ Copy your `.bashrc` to a backup before trying a new prompt.
- **`mv`** – Move or rename files  
  ➤ Rename your latest dotfile backup to include today's date.
- **`touch`** – Create a file or update timestamp  
  ➤ Create a blank `.Xresources` file in your home directory.

---

## 🧭 Navigation & Info (Tier 1)

- **`whoami`** – Show current user  
  ➤ Confirm user identity before running any `sudo apt` commands.
- **`hostname`** – Show system hostname  
  ➤ Check your hostname matches what's in `/etc/hostname`.
- **`date`** – Display current date/time  
  ➤ Run `date` after resume from suspend to confirm correct time.
- **`echo`** – Print text or variable  
  ➤ Echo your `$SHELL` or current `$PATH` for debugging.
- **`history`** – Show command history  
  ➤ Check what update commands you've run in the last week.

---

## 📖 Help & Learning (Tier 1)

- **`man`** – View manual page  
  ➤ Read the `man` page for `apt` to better understand flags.
- **`--help`** – Show command help  
  ➤ Run `pop-upgrade --help` and explore options.

---

## ⚙️ Processes & Monitoring (Tier 2)

- **`ps`** – Show active processes  
  ➤ Run `ps aux | grep gnome-shell` to troubleshoot desktop issues.
- **`top`** – Real-time process monitor  
  ➤ Use `top` and sort by CPU usage to catch any runaways.
- **`kill`** – Terminate process by PID  
  ➤ Kill a frozen GUI app like `firefox` or `libreoffice`.
- **`free`** – Show memory usage  
  ➤ Check memory usage after opening multiple browser tabs.
- **`df`** – Show disk space  
  ➤ Run `df -h` to check how full `/home` and `/boot` are.
- **`du`** – Show directory sizes  
  ➤ Use `du -sh ~/.cache/*` to clean up your cache folders.

---

## 🌐 Networking & Remote Access (Tier 2)

- **`ping`** – Test connectivity  
  ➤ Ping `ubuntu.com` before updating the system.
- **`ssh`** – Secure remote login  
  ➤ SSH into a local server or dev board like a Raspberry Pi.
- **`scp`** – Securely copy files  
  ➤ Copy a dotfiles archive to your remote dev machine.
- **`ifconfig`** – View network interfaces  
  ➤ Use `ip a` instead to get Wi-Fi interface info.

---

## 📦 Package Management (Tier 1)

- **`apt`** – Ubuntu/Debian package manager  
  ➤ Run `sudo apt update && sudo apt upgrade` to fully update the system.
- **`apt-get`** – Legacy package manager  
  ➤ Use `apt` instead for most operations.
- **`dpkg`** – Debian package manager  
  ➤ Install a downloaded .deb file: `sudo dpkg -i package.deb`.
- **`flatpak`** – Universal package manager  
  ➤ Run `flatpak update` to update all Flatpak applications.
- **`pop-upgrade`** – Pop!_OS upgrade tool  
  ➤ Check for system upgrades: `pop-upgrade check`.

---

## 🔐 Users & Permissions (Tier 2)

- **`chmod`** – Change file permissions  
  ➤ Make a script executable: `chmod +x script.sh`.
- **`chown`** – Change ownership  
  ➤ Fix download folder ownership if something was copied with root.
- **`passwd`** – Change password  
  ➤ Change your local password via `passwd` after a password manager update.
- **`sudo`** – Run as superuser  
  ➤ Run `sudo apt install git build-essential` to prepare for development.
- **`sudo -i`** – Enter root shell  
  ➤ Enter root to troubleshoot system boot logs.

---

## 🧰 System Admin & Services (Tier 3)

- **`systemctl`** – Manage systemd services  
  ➤ Restart `NetworkManager` if Wi-Fi is acting up.
- **`service`** – Legacy service control  
  ➤ Use `systemctl` instead on modern Ubuntu/Pop!_OS systems.
- **`journalctl`** – View logs  
  ➤ Run `journalctl -b` to read current boot logs.
- **`mount`** – Mount filesystems  
  ➤ Mount a manually partitioned external SSD.
- **`umount`** – Unmount filesystems  
  ➤ Unmount `/mnt/usb` before unplugging.

---

## 🗂️ Compression & Archiving (Tier 2)

- **`tar`** – Archive directories  
  ➤ Backup your `.config` folder: `tar -czvf config-backup.tar.gz ~/.config`.
- **`zip`** – Create zip archives  
  ➤ Zip your wallpaper collection: `zip -r wallpapers.zip ~/Pictures/Wallpapers`.
- **`unzip`** – Extract archives  
  ➤ Unzip a downloaded theme: `unzip nord-gtk-theme.zip -d ~/.themes`.

---

## 🌍 Web & Transfers (Tier 2)

- **`wget`** – Download files  
  ➤ Download an Ubuntu ISO for a rescue USB.
- **`curl`** – Transfer data  
  ➤ Query a web API: `curl https://api.github.com/users/pop-os`.

---

## 🔧 Pop!_OS Specific Commands (Tier 1)

- **`pop-upgrade`** – System upgrade tool  
  ➤ Check for system upgrades: `pop-upgrade check`.
- **`system76-power`** – Power management  
  ➤ Switch graphics mode: `system76-power graphics nvidia`.
- **`kernelstub`** – Kernel parameter management  
  ➤ View current kernel parameters: `kernelstub -p`.
- **`apt-add-repository`** – Manage PPAs  
  ➤ Add a PPA: `sudo apt-add-repository ppa:name/ppa`.