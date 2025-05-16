# System Maintenance & Updates – Lesson 1: Pop!_OS Update System

## 🔵 Lesson Overview
- **Focus:** Master Pop!_OS's update and maintenance tools
- **Time:** 30 minutes
- **Goal:** Learn to effectively update and maintain your Pop!_OS system

## 🔍 Why This Matters
Regular system maintenance is crucial for security, stability, and performance. Pop!_OS combines Ubuntu's apt system with its own tools like pop-upgrade. Understanding these systems ensures your computer stays secure and runs smoothly.

## 📚 Core Commands To Learn

| Command | Purpose | Example |
|---------|---------|---------|
| `pop-upgrade` | Pop!_OS upgrade tool | `pop-upgrade check` |
| `apt update` | Refresh package lists | `sudo apt update` |
| `apt upgrade` | Install available updates | `sudo apt upgrade` |
| `apt autoremove` | Remove unused packages | `sudo apt autoremove` |
| `flatpak update` | Update Flatpak apps | `flatpak update` |
| `journalctl` | View system logs | `journalctl -b` |

## ✅ Practice Exercise (20 Minutes)

1. **Check for system updates using Pop!_OS tools**
   ```bash
   pop-upgrade check
   ```
   This checks if a new Pop!_OS release is available.

2. **Update your package lists**
   ```bash
   sudo apt update
   ```
   Note how many packages can be upgraded.

3. **View what packages will be updated**
   ```bash
   apt list --upgradable
   ```
   This shows what will be updated without making changes.

4. **Perform a system upgrade**
   ```bash
   sudo apt upgrade -y
   ```
   The `-y` flag automatically answers yes to prompts.

5. **Update Flatpak applications**
   ```bash
   flatpak update
   ```
   This updates all your Flatpak applications.

6. **Clean up unused packages**
   ```bash
   sudo apt autoremove -y
   sudo apt clean
   ```
   This removes unused packages and clears the package cache.

7. **Check system logs for any errors**
   ```bash
   journalctl -p err -b
   ```
   This shows error messages from the current boot.

8. **Check disk usage**
   ```bash
   df -h
   ```
   Note how much space is used and available.

## 🧠 Reflection Questions (5 Minutes)
- How does Pop!_OS's update system differ from standard Ubuntu?
- Why is it important to regularly check system logs?
- What's the benefit of using both apt and Flatpak for applications?

## 🔍 Exploring Further
- Examine Pop!_OS specific configuration:
  ```bash
  ls -la /etc/pop-os/
  ```
- Check the update history:
  ```bash
  less /var/log/apt/history.log
  ```

## 📝 Demo Review & Journal Prompt
Today I learned how to properly update and maintain my Pop!_OS system.
I practiced using both Pop!_OS specific tools like pop-upgrade and standard Ubuntu tools like apt.
I also learned how to check system logs for errors and clean up unused packages.
Next time, I'll explore how to troubleshoot common update issues and manage kernels.

## 🌟 Bonus Challenge
Create a simple system health check script:

```bash
#!/bin/bash
# pop-health-check.sh - Check system health on Pop!_OS

echo "=== Pop!_OS System Health Check ==="
echo

echo "System Information:"
echo "-------------------"
hostnamectl | grep -E "Operating System|Kernel"
echo

echo "Update Status:"
echo "-------------"
apt-get -s upgrade | grep -E "upgraded|newly installed|to remove"
echo

echo "Disk Usage:"
echo "-----------"
df -h / /boot /home | grep -v tmpfs
echo

echo "Memory Usage:"
echo "-------------"
free -h
echo

echo "System Errors:"
echo "-------------"
journalctl -p err -b --no-pager | tail -n 10
echo

echo "=== Health Check Complete ==="
```

## 📚 Resources for Further Learning
- [Pop!_OS Documentation](https://support.system76.com)
- [Pop!_OS Upgrade Guide](https://support.system76.com/articles/upgrade-pop/)
- [Ubuntu Package Management documentation](https://help.ubuntu.com/community/AptGet/Howto)