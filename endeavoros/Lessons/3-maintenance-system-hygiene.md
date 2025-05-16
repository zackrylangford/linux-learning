# Maintenance & System Hygiene – Lesson 1: Pacman Cache Management

## 🔵 Lesson Overview
- **Focus:** Learn to maintain a clean and efficient Arch-based system
- **Time:** 30 minutes
- **Goal:** Master package cache management and system cleanup techniques

## 🔍 Why This Matters
Arch-based systems like EndeavourOS are rolling releases that receive frequent updates. Without regular maintenance, package caches can consume significant disk space, and orphaned packages can accumulate. Learning proper system hygiene keeps your system lean, fast, and trouble-free.

## 📚 Core Commands To Learn

| Command | Purpose | Example |
|---------|---------|---------|
| `paccache` | Clean package cache | `sudo paccache -rk1` |
| `pacman -Sc` | Remove unused packages | `sudo pacman -Sc` |
| `pacman -Qdt` | Find orphaned packages | `pacman -Qdt` |
| `pacman -Rns` | Remove packages with dependencies | `sudo pacman -Rns $(pacman -Qdtq)` |
| `find` | Find .pacnew files | `sudo find /etc -name "*.pacnew"` |

## ✅ Practice Exercise (20 Minutes)

1. **Check current disk usage**
   ```bash
   df -h /
   du -sh /var/cache/pacman/pkg/
   ```
   Note how much space the package cache is using.

2. **View installed packages**
   ```bash
   pacman -Q | wc -l
   ```
   This shows how many packages are installed.

3. **Clean the package cache with paccache**
   ```bash
   sudo paccache -r
   ```
   This removes all cached versions of packages except the most recent three.

4. **Keep only one version of each package**
   ```bash
   sudo paccache -rk1
   ```
   This more aggressive cleaning keeps only the most recent version.

5. **Check for orphaned packages**
   ```bash
   pacman -Qdt
   ```
   These are packages that were installed as dependencies but are no longer needed.

6. **Remove orphaned packages**
   ```bash
   sudo pacman -Rns $(pacman -Qdtq)
   ```
   This removes all orphaned packages and their configuration files.

7. **Check for .pacnew configuration files**
   ```bash
   sudo find /etc -name "*.pacnew"
   ```
   These are new configuration files from package updates.

8. **Compare a .pacnew file with the original (if any found)**
   ```bash
   # If you found a .pacnew file, for example /etc/pacman.conf.pacnew
   sudo diff /etc/pacman.conf /etc/pacman.conf.pacnew
   ```

9. **Check disk usage after cleanup**
   ```bash
   df -h /
   du -sh /var/cache/pacman/pkg/
   ```
   Note how much space you've freed up.

## 🧠 Reflection Questions (5 Minutes)
- Why does Arch keep old package versions in the cache?
- What's the difference between `pacman -Sc` and `paccache -r`?
- Why is it important to review .pacnew files after updates?

## 🔍 Exploring Further
- Check the journal for any package-related errors:
  ```bash
  journalctl -p 3 -xb
  ```
- Explore pacman hooks in `/etc/pacman.d/hooks/`
  ```bash
  ls -la /etc/pacman.d/hooks/
  ```

## 📝 Demo Review & Journal Prompt
Today I learned how to maintain a clean and efficient Arch-based system.
I practiced cleaning the package cache with paccache and removing orphaned packages.
I also learned how to find and handle .pacnew configuration files.
Next time, I'll explore how to automate these maintenance tasks with pacman hooks.

## 🌟 Bonus Challenge
Create a simple maintenance script that performs all these cleanup tasks:

```bash
#!/bin/bash
# arch-maintenance.sh - Comprehensive system maintenance

echo "=== EndeavourOS System Maintenance ==="
echo

echo "System update status:"
checkupdates | wc -l
echo "packages can be updated."

echo -e "\nCleaning package cache..."
sudo paccache -rk1
echo "Done."

echo -e "\nRemoving orphaned packages..."
ORPHANS=$(pacman -Qdtq)
if [[ -n "$ORPHANS" ]]; then
    echo "Found orphaned packages:"
    echo "$ORPHANS"
    sudo pacman -Rns $(pacman -Qdtq)
else
    echo "No orphaned packages found."
fi

echo -e "\nChecking for .pacnew files..."
PACNEW=$(sudo find /etc -name "*.pacnew")
if [[ -n "$PACNEW" ]]; then
    echo "Found .pacnew files:"
    echo "$PACNEW"
    echo "Review these files manually."
else
    echo "No .pacnew files found."
fi

echo -e "\nDisk usage before and after:"
echo "Package cache: $(du -sh /var/cache/pacman/pkg/)"
echo "Root partition: $(df -h / | grep -v Filesystem)"

echo -e "\n=== Maintenance Complete ==="
```

## 📚 Resources for Further Learning
- [Arch Wiki: System Maintenance](https://wiki.archlinux.org/title/System_maintenance)
- [Arch Wiki: Pacman/Tips and Tricks](https://wiki.archlinux.org/title/Pacman/Tips_and_tricks)
- [EndeavourOS Forum: System Maintenance Tips](https://forum.endeavouros.com/)