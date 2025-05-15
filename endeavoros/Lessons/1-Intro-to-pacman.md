# Arch Command Mastery – Lesson 1: Intro to pacman

## 🟢 Lesson Overview
- **Focus:** Learn and practice key pacman commands
- **Time:** 30 minutes
- **Goal:** Understand how to query, search, and manage packages effectively using pacman

## 🔍 Why This Matters
pacman is the lifeline of your Arch-based system. Mastering it gives you complete control over software installation, package info, and system health. Even graphical package managers rely on it under the hood.

## 📚 Core Commands To Learn

| Task | Command Example | Description |
|------|----------------|-------------|
| List explicitly installed pkgs | `pacman -Qe` | Shows packages you installed manually |
| Search for a package | `pacman -Ss <term>` | Search in synced repositories |
| Get package details | `pacman -Qi <package>` | See version, install date, and dependencies |
| List files in a package | `pacman -Ql <package>` | See what files were installed and where |
| Find out which pkg owns a file | `pacman -Qo <path>` | Useful for debugging files like `/usr/bin/python` |
| Remove a package and its deps | `sudo pacman -Rns <package>` | Cleanly uninstall with unused deps |

## ✅ Practice Exercise (20 Minutes)

1. **Search for a package of interest**
   - Example: try htop, neofetch, or something fun like cowsay
   ```
   pacman -Ss htop
   ```

2. **Install it and inspect the details**
   ```
   sudo pacman -S htop
   pacman -Qi htop
   ```

3. **Find where its files were placed**
   ```
   pacman -Ql htop
   ```

4. **Use the program, then remove it**
   ```
   htop  # run it
   sudo pacman -Rns htop
   ```

5. **Bonus:**
   Try `pacman -Qdtq` — see if any orphaned dependencies remain after the uninstall.

## 🧠 Reflection Questions (5 Minutes)
- What's the difference between `pacman -Qe` and `pacman -Qi`?
- When might you use `pacman -Qo` in a real scenario?
- Did you notice how clean the uninstall was with `-Rns`?

## 📝 Demo Review & Journal Prompt
Today I practiced essential pacman queries and commands.
I installed and removed a package cleanly, checked its files and metadata, and reflected on how pacman helps manage system state.
Tomorrow, I will explore deeper config files and tweak a personal shell setting.