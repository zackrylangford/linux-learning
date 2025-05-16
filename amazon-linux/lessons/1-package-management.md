# Package Management & System Updates – Lesson 1: DNF Basics

## 🔵 Lesson Overview
- **Focus:** Learn and practice Amazon Linux 2023's DNF package manager
- **Time:** 30 minutes
- **Goal:** Understand how to effectively manage packages on Amazon Linux 2023

## 🔍 Why This Matters
Amazon Linux 2023 uses DNF (Dandified YUM) as its package manager, which is different from the YUM used in Amazon Linux 2. Mastering DNF is essential for keeping your system updated, installing software, and maintaining system health on your EC2 instances.

## 📚 Core Commands To Learn

| Command | Purpose | Example |
|---------|---------|---------|
| `dnf check-update` | Check for updates | `sudo dnf check-update` |
| `dnf update` | Update all packages | `sudo dnf update` |
| `dnf install` | Install packages | `sudo dnf install httpd` |
| `dnf remove` | Remove packages | `sudo dnf remove httpd` |
| `dnf search` | Find packages | `dnf search python` |
| `dnf info` | Show package details | `dnf info httpd` |
| `dnf history` | View transaction history | `dnf history` |

## ✅ Practice Exercise (20 Minutes)

1. **Check for available updates**
   ```bash
   sudo dnf check-update
   ```
   Note how many packages can be updated.

2. **View detailed information about a package**
   ```bash
   dnf info httpd
   ```
   This shows version, size, repository, and description.

3. **Search for a package**
   ```bash
   dnf search web server
   ```
   Look for packages related to web servers.

4. **Install a package**
   ```bash
   sudo dnf install -y httpd
   ```
   The `-y` flag automatically answers yes to prompts.

5. **Check if a package is installed**
   ```bash
   dnf list installed httpd
   rpm -q httpd
   ```
   These commands confirm the installation.

6. **View package transaction history**
   ```bash
   dnf history
   ```
   This shows recent package installations and updates.

7. **View details of a specific transaction**
   ```bash
   dnf history info 1
   ```
   Replace `1` with a transaction ID from the history list.

8. **Clean up the DNF cache**
   ```bash
   sudo dnf clean all
   ```
   This removes cached package data to free up space.

## 🧠 Reflection Questions (5 Minutes)
- How does DNF differ from YUM in Amazon Linux 2?
- What are the advantages of using transaction history in DNF?
- Why is it important to regularly update packages on your EC2 instances?

## 🔍 Exploring Further
- Examine DNF configuration:
  ```bash
  cat /etc/dnf/dnf.conf
  ```
- List enabled repositories:
  ```bash
  dnf repolist
  ```

## 📝 Demo Review & Journal Prompt
Today I learned how to use DNF to manage packages on Amazon Linux 2023.
I practiced checking for updates, installing packages, and viewing transaction history.
I also learned how to search for packages and clean the DNF cache.
Next time, I'll explore how to manage repositories and work with package groups.

## 🌟 Bonus Challenge
Create a simple script that updates your system and logs the results:

```bash
#!/bin/bash
# update-system.sh - Update Amazon Linux 2023 and log results

LOG_FILE=~/system-updates.log
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "=== System Update: $DATE ===" >> $LOG_FILE
echo "Checking for updates..." >> $LOG_FILE
sudo dnf check-update -y >> $LOG_FILE 2>&1

echo "Updating packages..." >> $LOG_FILE
sudo dnf update -y >> $LOG_FILE 2>&1

echo "Cleaning DNF cache..." >> $LOG_FILE
sudo dnf clean all >> $LOG_FILE 2>&1

echo "Update completed at $(date '+%Y-%m-%d %H:%M:%S')" >> $LOG_FILE
echo "===========================" >> $LOG_FILE

echo "System update completed. Results logged to $LOG_FILE"
```

## 📚 Resources for Further Learning
- [Amazon Linux 2023 User Guide: Package Management](https://docs.aws.amazon.com/linux/al2023/ug/package-management.html)
- [DNF Command Reference](https://dnf.readthedocs.io/en/latest/command_ref.html)
- [AWS Blog: Amazon Linux 2023](https://aws.amazon.com/blogs/aws/amazon-linux-2023-a-cloud-optimized-linux-distribution-with-long-term-support/)