# Automation & Scripting – Lesson 1: EC2 User Data and Systemd Timers

## 🔴 Lesson Overview
- **Focus:** Learn to automate tasks on Amazon Linux 2023 using EC2 user data and systemd timers
- **Time:** 30 minutes
- **Goal:** Create automation scripts for EC2 instance bootstrapping and scheduled tasks

## 🔍 Why This Matters
Automation is key to efficient cloud operations. EC2 user data lets you bootstrap instances during launch, while systemd timers provide a modern way to schedule recurring tasks. Mastering these tools will help you manage Amazon Linux instances more efficiently and consistently.

## 📚 Core Concepts To Learn

| Tool/Concept | Purpose | Example |
|--------------|---------|---------|
| EC2 User Data | Bootstrap instances | Configure software at launch |
| Systemd Timers | Schedule tasks | Alternative to cron jobs |
| Shell Scripting | Automate tasks | Bash scripts for maintenance |
| CloudFormation | Infrastructure as code | Template-based provisioning |
| AWS Systems Manager | Manage instances | Automation without SSH |

## ✅ Practice Exercise (20 Minutes)

1. **Create a simple EC2 user data script**
   ```bash
   nano ~/ec2-user-data.sh
   ```
   
   Add this content:
   ```bash
   #!/bin/bash
   # EC2 User Data example for Amazon Linux 2023
   
   # Update system
   dnf update -y
   
   # Install common tools
   dnf install -y httpd git jq
   
   # Start and enable web server
   systemctl enable --now httpd
   
   # Create a simple web page
   echo "<html><body><h1>Hello from $(hostname)</h1><p>Instance bootstrapped with user data</p></body></html>" > /var/www/html/index.html
   
   # Log completion
   echo "Bootstrap completed at $(date)" >> /var/log/user-data.log
   ```
   
   Note: This script would be used when launching a new EC2 instance.

2. **Create a directory for systemd user timers**
   ```bash
   mkdir -p ~/.config/systemd/user
   ```

3. **Create a systemd service file**
   ```bash
   nano ~/.config/systemd/user/system-report.service
   ```
   
   Add this content:
   ```ini
   [Unit]
   Description=Generate system report
   
   [Service]
   Type=oneshot
   ExecStart=/bin/bash -c 'echo "System Report - $(date)" > ~/system-report.txt; df -h >> ~/system-report.txt; free -h >> ~/system-report.txt; uptime >> ~/system-report.txt'
   
   [Install]
   WantedBy=default.target
   ```

4. **Create a systemd timer file**
   ```bash
   nano ~/.config/systemd/user/system-report.timer
   ```
   
   Add this content:
   ```ini
   [Unit]
   Description=Run system report daily
   
   [Timer]
   OnCalendar=*-*-* 08:00:00
   Persistent=true
   
   [Install]
   WantedBy=timers.target
   ```

5. **Enable and start the timer**
   ```bash
   systemctl --user daemon-reload
   systemctl --user enable system-report.timer
   systemctl --user start system-report.timer
   ```

6. **Verify the timer is active**
   ```bash
   systemctl --user list-timers
   ```

7. **Test the service manually**
   ```bash
   systemctl --user start system-report.service
   cat ~/system-report.txt
   ```

## 🧠 Reflection Questions (5 Minutes)
- How does EC2 user data help with instance provisioning?
- What advantages do systemd timers have over traditional cron jobs?
- How could you use these automation techniques in a production environment?

## 🔍 Exploring Further
- Check if your instance was launched with user data:
  ```bash
  curl http://169.254.169.254/latest/user-data
  ```
- Explore systemd timer options:
  ```bash
  man systemd.timer
  ```

## 📝 Demo Review & Journal Prompt
Today I learned how to automate tasks on Amazon Linux 2023 using EC2 user data and systemd timers.
I created a sample EC2 user data script for bootstrapping new instances.
I also set up a systemd timer to generate daily system reports.
Next time, I'll explore more advanced automation using AWS Systems Manager.

## 🌟 Bonus Challenge
Create a more comprehensive system maintenance script:

```bash
#!/bin/bash
# system-maintenance.sh - Comprehensive system maintenance

LOG_FILE="$HOME/maintenance-$(date +%Y%m%d).log"

echo "=== System Maintenance: $(date) ===" | tee -a $LOG_FILE

# Update packages
echo "Updating packages..." | tee -a $LOG_FILE
sudo dnf update -y &>> $LOG_FILE

# Clean package cache
echo "Cleaning package cache..." | tee -a $LOG_FILE
sudo dnf clean all &>> $LOG_FILE

# Check disk usage
echo "Disk usage:" | tee -a $LOG_FILE
df -h | tee -a $LOG_FILE

# Find large files
echo "Largest files in /var/log:" | tee -a $LOG_FILE
sudo find /var/log -type f -size +10M -exec ls -lh {} \; | tee -a $LOG_FILE

# Check for failed services
echo "Failed services:" | tee -a $LOG_FILE
systemctl --failed | tee -a $LOG_FILE

# Check for high CPU processes
echo "Top CPU processes:" | tee -a $LOG_FILE
ps aux --sort=-%cpu | head -10 | tee -a $LOG_FILE

echo "Maintenance completed at $(date)" | tee -a $LOG_FILE
```

## 📚 Resources for Further Learning
- [EC2 User Data and Shell Scripts](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html)
- [Systemd Timer Documentation](https://www.freedesktop.org/software/systemd/man/systemd.timer.html)
- [AWS CloudFormation User Guide](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html)
- [AWS Systems Manager Documentation](https://docs.aws.amazon.com/systems-manager/latest/userguide/what-is-systems-manager.html)