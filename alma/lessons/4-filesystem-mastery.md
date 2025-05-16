# 🟤 AlmaLinux Lesson 4: Filesystem Mastery & Tool Chaining

### 🕒 30-Minute Command-Line-Only Lesson (EC2 CLI)

---

## 🎯 Objective

Master filesystem navigation, learn powerful file search techniques, practice command chaining, and create a simple backup script.

---

## ✅ Part 1: Advanced File Search & Navigation (10 mins)

**Commands:**

```bash
find /etc -name "*.conf" -type f | head -5
locate passwd
which python3
du -sh /var/log
df -h
```

**Tasks:**
- Find configuration files in /etc
- Locate all files related to passwords
- Check disk usage of the /var/log directory
- View filesystem space usage

**🧠 Learn:**
- The difference between `find` and `locate`
- How to interpret disk usage output
- Use `man find` to explore more search options

**Bonus:**
- Install and use `tree` if not available:

  ```bash
  sudo dnf install -y tree
  tree -L 2 /etc/systemd
  ```

---

## ✅ Part 2: Command Chaining & Pipelines (8 mins)

**Commands:**

```bash
# Pipe examples
find /var/log -type f -name "*.log" | grep -v "boot" | sort | head -3

# Redirection examples
echo "Command output test" > ~/test-output.txt
cat /etc/hostname >> ~/test-output.txt

# Using tee for both output and saving
date | tee -a ~/test-output.txt
```

**Tasks:**
- Chain find, grep, sort, and head to filter log files
- Create and append to a text file using redirection
- Use tee to display output and save to a file simultaneously

**🧠 Learn:**
- The difference between `>` (overwrite) and `>>` (append)
- How to use `tee` to split command output
- Efficient command chaining techniques

---

## ✅ Part 3: Filesystem Structure & Archiving (7 mins)

**Commands:**

```bash
ls -la /etc /var /usr /boot | head -3

# Create a simple archive
tar -czvf ~/etc-backup.tar.gz /etc/hosts /etc/hostname

# Extract specific files
mkdir ~/extracted
tar -xzvf ~/etc-backup.tar.gz -C ~/extracted etc/hosts
```

**Tasks:**
- Explore key filesystem directories
- Create a compressed archive of system files
- Extract specific files from the archive

**🧠 Learn:**
- The purpose of major Linux directories
- Common tar flags (-c create, -z gzip, -v verbose, -f file)
- How to extract files to a specific location

---

## ✅ Part 4: Create a Backup Script (5 mins)

**Commands:**

```bash
nano ~/bin/backup-config.sh
```

**Script Content:**

```bash
#!/bin/bash
# Simple config backup script

# Set variables
BACKUP_DIR=~/backups
TIMESTAMP=$(date +%Y%m%d-%H%M)
BACKUP_FILE="$BACKUP_DIR/config-$TIMESTAMP.tar.gz"

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

# Create the backup
echo "Creating backup of configuration files..."
tar -czvf $BACKUP_FILE /etc/hostname /etc/hosts /etc/fstab 2>/dev/null

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "Backup created successfully: $BACKUP_FILE"
    ls -lh $BACKUP_FILE
else
    echo "Backup failed!"
fi
```

**Make it executable:**

```bash
chmod +x ~/bin/backup-config.sh
```

**Run the script:**

```bash
~/bin/backup-config.sh
```

---

## 🧾 Wrap-Up: Journal What You Learned (3–5 mins)

```markdown
# AlmaLinux Lesson 4: Filesystem Mastery & Tool Chaining

## Date: [Insert Today's Date]

- File search tools:
  - find: Real-time search with powerful filters
  - locate: Fast search using database
  - which: Find executable location
  
- Command chaining techniques:
  - Pipes (|): Connect command output to input
  - Redirection (>, >>): Save output to files
  - tee: Display and save output simultaneously
  
- Archiving with tar:
  - Created compressed archives with -czvf
  - Extracted specific files with -xzvf -C
  
- Created a backup script that:
  - Uses variables and timestamps
  - Creates directories if needed
  - Checks for success with exit codes
  
- Key takeaways:
  - [Your personal insights]
  
- Questions for future exploration:
  - [ ] How to exclude specific files/directories in tar?
  - [ ] What's the best way to schedule regular backups?
```

---

## 📚 Resources for Further Learning

- [Linux Filesystem Hierarchy Standard](https://refspecs.linuxfoundation.org/FHS_3.0/fhs-3.0.html)
- [Bash Scripting Guide](https://tldp.org/LDP/abs/html/)
- [Red Hat Documentation: Working with Files](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_basic_system_settings/assembly_working-with-files-and-directories_configuring-basic-system-settings)