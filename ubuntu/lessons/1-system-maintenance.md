# System Maintenance & Updates – Lesson 1: Ubuntu Update Fundamentals

## 🔵 Lesson Overview
- **Focus:** Learn and practice Ubuntu's update system
- **Time:** 30 minutes
- **Goal:** Understand how to properly update Ubuntu and maintain system health

## 🔍 Why This Matters
Regular system maintenance is crucial for security, stability, and performance. Ubuntu's update system is robust but requires understanding to use effectively. Mastering these skills will keep your system running smoothly and securely.

## 📚 Core Concepts To Learn

| Command | Purpose | Common Usage |
|---------|---------|-------------|
| `apt update` | Refresh package lists | Run before installing or upgrading |
| `apt upgrade` | Install available updates | Regular system maintenance |
| `apt full-upgrade` | More aggressive upgrade | Can remove packages if needed |
| `apt autoremove` | Remove unused packages | System cleanup |
| `apt clean` | Clear package cache | Free up disk space |

## ✅ Practice Exercise (20 Minutes)

1. **Check system update status**
   ```bash
   sudo apt update
   ```
   Take note of how many packages can be upgraded.

2. **View what packages will be updated**
   ```bash
   apt list --upgradable
   ```
   This shows what will be updated without making changes.

3. **Perform a safe upgrade**
   ```bash
   sudo apt upgrade -y
   ```
   The `-y` flag automatically answers yes to prompts.

4. **Clean up the system**
   ```bash
   sudo apt autoremove -y
   sudo apt clean
   ```
   This removes unused packages and clears the package cache.

5. **Check disk usage before and after cleanup**
   ```bash
   df -h /
   ```
   Note how much space was freed up.

6. **Check for leftover configuration files**
   ```bash
   dpkg -l | grep "^rc"
   ```
   These are removed packages with config files still present.

7. **Remove leftover configurations (optional)**
   ```bash
   sudo apt purge $(dpkg -l | grep "^rc" | awk '{print $2}')
   ```
   This removes configuration files from previously removed packages.

## 🧠 Reflection Questions (5 Minutes)
- What's the difference between `apt upgrade` and `apt full-upgrade`?
Answer: `apt upgrade` installs available upgrades without removing existing packages, while `apt full-upgrade` can remove packages if necessary to complete the upgrade.
(source: [Ubuntu Wiki](https://wiki.ubuntu.com/AptGet/Howto))

- Why is it important to run `apt update` before `apt upgrade`?

Answer: Running `apt update` refreshes the package lists, ensuring you have the latest information about available updates before attempting to upgrade.
(source: [Ubuntu Wiki](https://wiki.ubuntu.com/AptGet/Howto))

- How often should you perform system updates on Ubuntu?
Answer: It's recommended to perform system updates at least once a week, or more frequently if you're using the system for critical tasks. (source: [Ubuntu Wiki](https://wiki.ubuntu.com/UbuntuSecurity/Updates))



## 🔍 Exploring Further
- Look at the APT configuration files:
  ```bash
  ls -la /etc/apt/
  cat /etc/apt/sources.list
  ```
- Check the update history:
  ```bash
  less /var/log/apt/history.log
  ```

## 📝 Demo Review & Journal Prompt
Today I learned how to properly update and maintain my Ubuntu system.
I practiced the complete update workflow from refreshing package lists to cleaning up afterward.
Next time, I'll explore how to manage PPAs and third-party repositories.

## 🌟 Bonus Challenge
Create a simple bash script that performs a complete system update and cleanup:

```bash
#!/bin/bash
# update-system.sh - Complete Ubuntu update script

echo "Starting system update process..."
sudo apt update
echo "Upgrading packages..."
sudo apt upgrade -y
echo "Performing full upgrade for critical updates..."
sudo apt full-upgrade -y
echo "Removing unused packages..."
sudo apt autoremove -y
echo "Cleaning package cache..."
sudo apt clean
echo "System update complete!"
```

Make it executable and save it to your personal bin directory:
```bash
chmod +x update-system.sh
mkdir -p ~/bin
mv update-system.sh ~/bin/
```

## 📚 Resources for Further Learning
- [Ubuntu Package Management documentation](https://help.ubuntu.com/community/AptGet/Howto)
- [Difference between update, upgrade, and dist-upgrade](https://askubuntu.com/questions/194651/why-use-apt-get-upgrade-instead-of-apt-get-dist-upgrade)
- [Ubuntu Security Notices](https://ubuntu.com/security/notices)