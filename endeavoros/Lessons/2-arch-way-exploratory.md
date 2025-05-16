# The Arch Way & Exploratory Learning – Lesson 1: Systemd Timers

## 🔴 Lesson Overview
- **Focus:** Learn to create and use systemd timers for scheduled tasks
- **Time:** 30 minutes
- **Goal:** Implement a custom backup solution using systemd timers

## 🔍 Why This Matters
Systemd timers offer a modern alternative to cron jobs with better logging, dependency handling, and integration with the rest of the systemd ecosystem. Understanding how to create and manage systemd timers will help you automate routine tasks in a more maintainable way.

## 📚 Core Concepts To Learn

| Component | Purpose | Example |
|-----------|---------|---------|
| Unit file | Defines a service | backup.service |
| Timer file | Schedules the service | backup.timer |
| systemctl | Controls systemd units | systemctl enable, start, status |
| journalctl | Views logs | journalctl -u backup.service |

## ✅ Practice Exercise (20 Minutes)

1. **Create a simple backup script**
   ```bash
   mkdir -p ~/bin
   nano ~/bin/documents-backup.sh
   ```
   
   Add this content:
   ```bash
   #!/bin/bash
   
   BACKUP_DIR="$HOME/backups"
   TIMESTAMP=$(date +%Y%m%d-%H%M)
   
   mkdir -p "$BACKUP_DIR"
   
   tar -czf "$BACKUP_DIR/documents-$TIMESTAMP.tar.gz" ~/Documents
   
   echo "Backup completed at $(date)" >> "$BACKUP_DIR/backup.log"
   ```
   
   Make it executable:
   ```bash
   chmod +x ~/bin/documents-backup.sh
   ```

2. **Create a systemd service file**
   ```bash
   mkdir -p ~/.config/systemd/user
   nano ~/.config/systemd/user/documents-backup.service
   ```
   
   Add this content:
   ```ini
   [Unit]
   Description=Backup Documents Directory
   
   [Service]
   Type=oneshot
   ExecStart=%h/bin/documents-backup.sh
   
   [Install]
   WantedBy=default.target
   ```

3. **Create a systemd timer file**
   ```bash
   nano ~/.config/systemd/user/documents-backup.timer
   ```
   
   Add this content:
   ```ini
   [Unit]
   Description=Run documents backup daily
   
   [Timer]
   OnCalendar=daily
   Persistent=true
   
   [Install]
   WantedBy=timers.target
   ```

4. **Enable and start the timer**
   ```bash
   systemctl --user daemon-reload
   systemctl --user enable documents-backup.timer
   systemctl --user start documents-backup.timer
   ```

5. **Verify the timer is active**
   ```bash
   systemctl --user list-timers
   ```
   You should see your documents-backup.timer in the list.

6. **Test the service manually**
   ```bash
   systemctl --user start documents-backup.service
   ```

7. **Check the logs**
   ```bash
   journalctl --user -u documents-backup.service
   ```
   
   And check your backup directory:
   ```bash
   ls -la ~/backups/
   ```

## 🧠 Reflection Questions (5 Minutes)
- How does a systemd timer differ from a traditional cron job?
- What advantages does systemd provide for logging and monitoring scheduled tasks?
- How would you modify the timer to run at a specific time each day?

## 🔍 Exploring Further
- View all active timers on your system:
  ```bash
  systemctl list-timers --all
  ```
- Explore more complex timer options:
  ```bash
  man systemd.timer
  ```
- Check the Arch Wiki page on systemd timers:
  ```bash
  xdg-open https://wiki.archlinux.org/title/Systemd/Timers
  ```

## 📝 Demo Review & Journal Prompt
Today I learned how to create a systemd timer to automate a backup script.
I created a service unit that defines what to run and a timer unit that controls when it runs.
I used systemctl commands to manage these units and journalctl to view the logs.
Next time, I'll explore more complex automation scenarios or learn about systemd socket activation.

## 🌟 Bonus Challenge
Modify your timer to run at a specific time and send a desktop notification:

1. Update the timer file to run at 8 PM daily:
   ```ini
   [Timer]
   OnCalendar=*-*-* 20:00:00
   Persistent=true
   ```

2. Modify the backup script to send a notification:
   ```bash
   #!/bin/bash
   
   BACKUP_DIR="$HOME/backups"
   TIMESTAMP=$(date +%Y%m%d-%H%M)
   
   mkdir -p "$BACKUP_DIR"
   
   tar -czf "$BACKUP_DIR/documents-$TIMESTAMP.tar.gz" ~/Documents
   
   echo "Backup completed at $(date)" >> "$BACKUP_DIR/backup.log"
   
   # Send desktop notification
   notify-send "Backup Complete" "Documents backed up to $BACKUP_DIR"
   ```

## 📚 Resources for Further Learning
- [Arch Wiki: Systemd/Timers](https://wiki.archlinux.org/title/Systemd/Timers)
- [Systemd Timer Documentation](https://www.freedesktop.org/software/systemd/man/systemd.timer.html)
- [Arch Forums: Systemd Timer Examples](https://bbs.archlinux.org/viewtopic.php?id=162366)