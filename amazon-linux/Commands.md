# 🧠 Amazon Linux 2023 Command Practice Plan

This guide is tailored for Amazon Linux 2023 with realistic daily-use tasks focused on EC2 instances, AWS integration, and system maintenance.

---

## 📂 File and Directory Management (Tier 1)

- **`ls`** – List directory contents  
  ➤ Run `ls -lh /etc/dnf/` to explore DNF configuration files.
- **`cd`** – Change current directory  
  ➤ Navigate to your local project: `cd ~/Projects`.
- **`pwd`** – Show current path  
  ➤ Confirm you're inside a Git repo folder with `pwd`.
- **`mkdir`** – Make a new directory  
  ➤ Create a folder to store backups: `mkdir ~/backups`.
- **`rmdir`** – Remove an empty directory  
  ➤ Clean up an abandoned test folder.
- **`rm`** – Remove files or directories  
  ➤ Remove leftover RPM package files after install.
- **`cp`** – Copy files or directories  
  ➤ Copy your `.bashrc` to a backup before trying a new prompt.
- **`mv`** – Move or rename files  
  ➤ Rename your latest dotfile backup to include today's date.
- **`touch`** – Create a file or update timestamp  
  ➤ Create a blank `.Xresources` file in your home directory.

---

## 🧭 Navigation & Info (Tier 1)

- **`whoami`** – Show current user  
  ➤ Confirm user identity before running any `sudo` commands.
- **`hostname`** – Show system hostname  
  ➤ Check your hostname matches what's in EC2 console.
- **`date`** – Display current date/time  
  ➤ Run `date` to confirm your instance's timezone.
- **`echo`** – Print text or variable  
  ➤ Echo your `$SHELL` or current `$PATH` for debugging.
- **`history`** – Show command history  
  ➤ Check what update commands you've run in the last week.

---

## 📖 Help & Learning (Tier 1)

- **`man`** – View manual page  
  ➤ Read the `man` page for `dnf` to better understand flags.
- **`--help`** – Show command help  
  ➤ Run `aws --help` and explore options.
- **`info`** – View info documentation  
  ➤ Try `info coreutils` to learn about GNU core utilities.

---

## ⚙️ Processes & Monitoring (Tier 2)

- **`ps`** – Show active processes  
  ➤ Run `ps aux | grep httpd` to troubleshoot web server issues.
- **`top`** – Real-time process monitor  
  ➤ Use `top` and sort by CPU usage to catch any runaways.
- **`htop`** – Enhanced process monitor  
  ➤ Install with `sudo dnf install htop` for a better monitoring experience.
- **`kill`** – Terminate process by PID  
  ➤ Kill a frozen process that's consuming resources.
- **`free`** – Show memory usage  
  ➤ Check memory usage after starting a new service.
- **`df`** – Show disk space  
  ➤ Run `df -h` to check how full your EBS volumes are.
- **`du`** – Show directory sizes  
  ➤ Use `du -sh /var/log/*` to identify large log files.

---

## 🌐 Networking & Remote Access (Tier 2)

- **`ping`** – Test connectivity  
  ➤ Ping `amazon.com` to test internet connectivity.
- **`ssh`** – Secure remote login  
  ➤ SSH into another EC2 instance in your environment.
- **`scp`** – Securely copy files  
  ➤ Copy a configuration file to another instance.
- **`curl`** – Transfer data  
  ➤ Access EC2 metadata: `curl http://169.254.169.254/latest/meta-data/`.
- **`netstat`** – Network statistics  
  ➤ Use `netstat -tuln` to see listening ports.
- **`dig`** – DNS lookup  
  ➤ Resolve DNS: `dig amazon.com`.

---

## 📦 Package Management (Tier 1)

- **`dnf`** – Package manager  
  ➤ Run `sudo dnf update` to update all packages.
- **`rpm`** – Low-level package manager  
  ➤ Query package info: `rpm -qi httpd`.
- **`dnf search`** – Find packages  
  ➤ Search for a package: `dnf search python`.
- **`dnf install`** – Install packages  
  ➤ Install a package: `sudo dnf install git`.
- **`dnf remove`** – Remove packages  
  ➤ Remove a package: `sudo dnf remove httpd`.

---

## 🔐 Users & Permissions (Tier 2)

- **`chmod`** – Change file permissions  
  ➤ Make a script executable: `chmod +x script.sh`.
- **`chown`** – Change ownership  
  ➤ Fix download folder ownership if something was copied with root.
- **`passwd`** – Change password  
  ➤ Change your local password via `passwd`.
- **`sudo`** – Run as superuser  
  ➤ Run `sudo dnf install git` to install packages.
- **`sudo -i`** – Enter root shell  
  ➤ Enter root to troubleshoot system boot logs.
- **`useradd`** – Add a new user  
  ➤ Create a new user account: `sudo useradd username`.

---

## 🧰 System Admin & Services (Tier 3)

- **`systemctl`** – Manage systemd services  
  ➤ Restart a service: `sudo systemctl restart httpd`.
- **`journalctl`** – View logs  
  ➤ Run `journalctl -b` to read current boot logs.
- **`mount`** – Mount filesystems  
  ➤ Mount an EBS volume: `sudo mount /dev/xvdf /mnt`.
- **`umount`** – Unmount filesystems  
  ➤ Unmount a volume: `sudo umount /mnt`.
- **`firewall-cmd`** – Manage firewall  
  ➤ Allow HTTP traffic: `sudo firewall-cmd --permanent --add-service=http`.

---

## 🗂️ Compression & Archiving (Tier 2)

- **`tar`** – Archive directories  
  ➤ Backup your config folder: `tar -czvf config-backup.tar.gz ~/.config`.
- **`zip`** – Create zip archives  
  ➤ Zip log files: `zip -r logs.zip /var/log/*.log`.
- **`unzip`** – Extract archives  
  ➤ Unzip a downloaded file: `unzip download.zip -d ~/extracted`.

---

## 🌍 AWS Specific Commands (Tier 1)

- **`aws`** – AWS Command Line Interface  
  ➤ List S3 buckets: `aws s3 ls`.
- **`ec2-metadata`** – EC2 instance metadata  
  ➤ Get instance type: `ec2-metadata -t`.
- **`amazon-cloudwatch-agent-ctl`** – CloudWatch agent control  
  ➤ Check agent status: `sudo amazon-cloudwatch-agent-ctl -m ec2 -a status`.
- **`amazon-linux-extras`** – Manage extras repository  
  ➤ List available extras: `amazon-linux-extras list`.