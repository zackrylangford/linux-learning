Here's the EndeavourOS-specific version of your Linux command practice guide — tailored for an Arch-based system with realistic daily-use tasks focused on power users, rolling release maintenance, and tools like pacman, yay, and system logs. The format matches your Pop!_OS and Ubuntu practice sheets, optimized for Motion Docs.


🧠 EndeavourOS Command Practice Plan
(For Tuesday, Wednesday, Thursday, and Friday study sessions — Arch power user training)

📂 File and Directory Management (Tier 1)
ls – List directory contents
➤ Run ls -lh /etc/pacman.d/ to explore mirrorlist and keyring files.
cd – Change current directory
➤ Navigate to your local repo project: cd ~/Projects/aur-packages.
pwd – Show current path
➤ Confirm you're inside a Git repo folder with pwd.
mkdir – Make a new directory
➤ Create a folder to store downloaded PKGBUILDs: mkdir ~/aur-builds.
rmdir – Remove an empty directory
➤ Clean up an abandoned test folder.
rm – Remove files or directories
➤ Remove leftover .tar.zst package files after install.
cp – Copy files or directories
➤ Copy your .zshrc to a backup before trying a new prompt.
mv – Move or rename files
➤ Rename your latest dotfile backup to include today’s date.
touch – Create a file or update timestamp
➤ Create a blank .Xresources file in your home directory.

🧭 Navigation & Info (Tier 1)
whoami – Show current user
➤ Confirm user identity before running any sudo pacman commands.
hostname – Show system hostname
➤ Check your hostname matches what’s in /etc/hostname.
date – Display current date/time
➤ Run date after resume from suspend to confirm correct time.
echo – Print text or variable
➤ Echo your $SHELL or current $PATH for debugging.
history – Show command history
➤ Check what update commands you’ve run in the last week.

📖 Help & Learning (Tier 1)
man – View manual page
➤ Read the man page for pacman to better understand flags.
--help – Show command help
➤ Run yay --help and explore advanced options.

⚙️ Processes & Monitoring (Tier 2)
ps – Show active processes
➤ Run ps aux | grep gpg-agent to troubleshoot key issues.
top – Real-time process monitor
➤ Use top and sort by CPU usage to catch any runaways.
kill – Terminate process by PID
➤ Kill a frozen GUI app like kdenlive or gwenview.
free – Show memory usage
➤ Check memory usage after opening multiple Electron apps.
df – Show disk space
➤ Run df -h to check how full /home and /boot are.
du – Show directory sizes
➤ Use du -sh ~/.cache/* to clean up your cache folders.

🌐 Networking & Remote Access (Tier 2)
ping – Test connectivity
➤ Ping archlinux.org before updating the system.
ssh – Secure remote login
➤ SSH into a local server or dev board like a Raspberry Pi.
scp – Securely copy files
➤ Copy a dotfiles archive to your remote dev machine.
ifconfig – View network interfaces
➤ Use ip a instead to get Wi-Fi interface info.

📦 Package Management (Tier 1)
pacman – Arch package manager
➤ Run sudo pacman -Syu to fully update the system.
yay – AUR helper
➤ Use yay -S brave-bin to install Brave browser from the AUR.
dpkg – Debian package manager
➤ (Not used — note the difference vs Debian-based systems.)

🔐 Users & Permissions (Tier 2)
chmod – Change file permissions
➤ Make an AUR install script executable: chmod +x build.sh.
chown – Change ownership
➤ Fix download folder ownership if something was copied with root.
passwd – Change password
➤ Change your local password via passwd after a password manager update.
sudo – Run as superuser
➤ Run sudo pacman -S git base-devel to prepare for AUR building.
sudo -i – Enter root shell
➤ Enter root to troubleshoot system boot logs.

🧰 System Admin & Services (Tier 3)
systemctl – Manage systemd services
➤ Restart NetworkManager if Wi-Fi is acting up.
service – Legacy service control
➤ Not used — stick with systemctl on Arch-based systems.
journalctl – View logs
➤ Run journalctl -b to read current boot logs.
mount – Mount filesystems
➤ Mount a manually partitioned external SSD.
umount – Unmount filesystems
➤ Unmount /mnt/usb before unplugging.

🗂️ Compression & Archiving (Tier 2)
tar – Archive directories
➤ Backup your .config folder: tar -czvf config-backup.tar.gz ~/.config.
zip – Create zip archives
➤ Zip your wallpaper collection: zip -r wallpapers.zip ~/Pictures/Wallpapers.
unzip – Extract archives
➤ Unzip a downloaded theme: unzip nord-gtk-theme.zip -d ~/.themes.

🌍 Web & Transfers (Tier 2)
wget – Download files
➤ Download an Arch ISO for a rescue USB.
curl – Transfer data
➤ Query Arch's package API: curl https://archlinux.org/packages/core/x86_64/bash/.

Let me know if you want a flat text version of all three (Ubuntu, Pop!_OS, EndeavourOS) combined into a single unified file for Motion Docs or GitHub Pages.