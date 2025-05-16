# Command Line Mastery – Lesson 1: APT Package Management

## 🟢 Lesson Overview
- **Focus:** Master Ubuntu's APT package management system
- **Time:** 30 minutes
- **Goal:** Learn to effectively install, remove, and manage packages from the command line

## 🔍 Why This Matters
Package management is at the heart of any Linux distribution. Mastering APT commands gives you complete control over software on your Ubuntu system without relying on graphical tools. This skill is essential for server administration and efficient desktop management.

## 📚 Core Commands To Learn

| Command | Purpose | Example |
|---------|---------|---------|
| `apt search` | Find packages | `apt search text-editor` |
| `apt show` | Display package details | `apt show firefox` |
| `apt install` | Install packages | `sudo apt install htop` |
| `apt remove` | Remove packages | `sudo apt remove htop` |
| `apt purge` | Remove packages with config | `sudo apt purge htop` |
| `dpkg -l` | List installed packages | `dpkg -l | grep python` |
| `dpkg -S` | Find which package owns a file | `dpkg -S /usr/bin/python3` |

## ✅ Practice Exercise (20 Minutes)

1. **Search for a terminal-based text editor**
   ```bash
   apt search "text editor" | grep terminal
   ```
   Look for options like nano, vim, or micro.

2. **Get details about a specific package**
   ```bash
   apt show vim
   ```
   Note the dependencies, size, and description.

3. **Install a package**
   ```bash
   sudo apt install htop
   ```
   htop is an enhanced system monitor.

4. **Run the installed program**
   ```bash
   htop
   ```
   Press Q to quit when done exploring.

5. **List all installed packages with a specific pattern**
   ```bash
   dpkg -l | grep python
   ```
   See how many Python packages are installed.

6. **Find which package provides a specific file**
   ```bash
   which python3
   dpkg -S $(which python3)
   ```
   This shows which package owns the python3 command.

7. **Remove the package you installed**
   ```bash
   sudo apt remove htop
   ```
   Note that this keeps configuration files.

8. **Check for residual config files**
   ```bash
   dpkg -l | grep ^rc
   ```
   These are removed packages with configs still present.

## 🧠 Reflection Questions (5 Minutes)
- What's the difference between `apt remove` and `apt purge`?
- Why might you use `dpkg -S` in a troubleshooting scenario?
- How could you find all packages related to a specific task (e.g., video editing)?

## 🔍 Exploring Further
- Examine APT's configuration:
  ```bash
  cat /etc/apt/sources.list
  ls /etc/apt/sources.list.d/
  ```
- Learn about package priorities:
  ```bash
  apt-cache policy firefox
  ```

## 📝 Demo Review & Journal Prompt
Today I practiced essential APT commands for package management.
I learned how to search for, install, and remove packages entirely from the command line.
I also discovered how to find which package provides a specific file and how to check for leftover configurations.
Next time, I'll explore how to manage PPAs and third-party repositories.

## 🌟 Bonus Challenge
Create a simple script that lists your most recently installed packages:

```bash
#!/bin/bash
# recent-packages.sh - Show recently installed packages

echo "Packages installed in the last 7 days:"
grep " install " /var/log/apt/history.log | grep -v "automatic" | tail -n 10

echo -e "\nMost recently installed packages first:"
grep " install " /var/log/apt/history.log | grep -v "automatic" | \
  awk '{print $4}' | sort | uniq | tail -n 5
```

## 📚 Resources for Further Learning
- [Ubuntu Package Management documentation](https://help.ubuntu.com/community/AptGet/Howto)
- [Debian APT User Manual](https://www.debian.org/doc/manuals/apt-guide/)
- [Ask Ubuntu: APT vs APT-GET](https://askubuntu.com/questions/445384/what-is-the-difference-between-apt-and-apt-get)