# Command Line Mastery – Lesson 1: Pop!_OS CLI Tools

## 🟢 Lesson Overview
- **Focus:** Master Pop!_OS specific command-line tools
- **Time:** 30 minutes
- **Goal:** Learn to use Pop!_OS CLI tools for system management and troubleshooting

## 🔍 Why This Matters
Pop!_OS extends Ubuntu with several custom tools that make system management easier. Learning these command-line tools gives you more control over your system and helps you troubleshoot issues more effectively than using only graphical interfaces.

## 📚 Core Commands To Learn

| Command | Purpose | Example |
|---------|---------|---------|
| `pop-upgrade` | System upgrade tool | `pop-upgrade release upgrade` |
| `system76-power` | Power management | `system76-power profile performance` |
| `kernelstub` | Kernel parameter management | `kernelstub -p` |
| `apt` | Package management | `sudo apt install neofetch` |
| `dpkg` | Low-level package tool | `dpkg -l | grep nvidia` |

## ✅ Practice Exercise (20 Minutes)

1. **Explore Pop!_OS upgrade tool**
   ```bash
   pop-upgrade --help
   pop-upgrade daemon-status
   pop-upgrade recovery check
   ```
   Learn about the available commands and check recovery partition status.

2. **Check system power management**
   ```bash
   system76-power --help
   system76-power profile
   ```
   See what power profiles are available on your system.

3. **Examine kernel parameters**
   ```bash
   sudo kernelstub -p
   ```
   This shows the current kernel parameters.

4. **Install a useful system information tool**
   ```bash
   sudo apt install neofetch
   neofetch
   ```
   Neofetch displays system information in a visually appealing way.

5. **Check installed Pop!_OS packages**
   ```bash
   dpkg -l | grep pop-
   ```
   This lists all installed packages with "pop-" in the name.

6. **Explore graphics switching (if on a system with hybrid graphics)**
   ```bash
   system76-power graphics
   ```
   This shows the current graphics mode if you have hybrid graphics.

7. **Check system logs for Pop!_OS services**
   ```bash
   journalctl -u pop-upgrade
   ```
   This shows logs for the Pop!_OS upgrade service.

## 🧠 Reflection Questions (5 Minutes)
- How do Pop!_OS CLI tools extend the functionality of standard Ubuntu?
- In what scenarios would you use `system76-power` over the GUI power settings?
- Why might you need to use `kernelstub` to modify kernel parameters?

## 🔍 Exploring Further
- Examine Pop!_OS configuration files:
  ```bash
  ls -la /etc/pop-os/
  ```
- Check installed NVIDIA drivers (if applicable):
  ```bash
  dpkg -l | grep nvidia
  ```

## 📝 Demo Review & Journal Prompt
Today I learned about Pop!_OS specific command-line tools.
I practiced using pop-upgrade, system76-power, and kernelstub to manage system settings.
I also explored how to check for Pop!_OS specific packages and services.
Next time, I'll dive deeper into system troubleshooting and advanced package management.

## 🌟 Bonus Challenge
Create a simple script that displays Pop!_OS system information:

```bash
#!/bin/bash
# pop-info.sh - Display Pop!_OS system information

echo "=== Pop!_OS System Information ==="
echo

echo "System Version:"
echo "--------------"
grep PRETTY /etc/os-release
echo

echo "Kernel Information:"
echo "------------------"
uname -r
echo

echo "Power Profile:"
echo "-------------"
system76-power profile
echo

if command -v system76-power &> /dev/null; then
  echo "Graphics Mode:"
  echo "-------------"
  system76-power graphics
  echo
fi

echo "Pop!_OS Packages:"
echo "----------------"
dpkg -l | grep pop- | wc -l
echo "Pop!_OS packages installed"
echo

echo "=== System Information Complete ==="
```

## 📚 Resources for Further Learning
- [Pop!_OS GitHub Repositories](https://github.com/pop-os)
- [System76 Support Documentation](https://support.system76.com)
- [Pop!_OS Keyboard Shortcuts](https://support.system76.com/articles/pop-keyboard-shortcuts/)