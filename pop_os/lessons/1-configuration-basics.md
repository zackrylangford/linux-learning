# Configuration & Customization – Lesson 1: Bash Profile Basics

## 🟡 Lesson Overview
- **Focus:** Learn to customize your shell environment with dotfiles
- **Time:** 30 minutes
- **Goal:** Create and modify your bash profile to personalize your terminal experience

## 🔍 Why This Matters
Your shell environment is where you'll spend much of your time as a Linux user. Customizing it not only makes it more pleasant to use but also increases your productivity. Understanding dotfiles is fundamental to personalizing any Linux system, including Pop!_OS.

## 📚 Core Concepts To Learn

| File | Purpose | Common Customizations |
|------|---------|----------------------|
| `~/.bashrc` | Runs for interactive non-login shells | Aliases, functions, prompt customization |
| `~/.bash_profile` | Runs for login shells | Environment variables, PATH additions |
| `~/.profile` | Used by many shells, not just bash | Environment variables for all shells |
| `~/.config/` | Modern configuration directory | Application-specific settings |

## ✅ Practice Exercise (20 Minutes)

1. **Examine your current bash configuration**
   ```bash
   cat ~/.bashrc
   ```
   Take note of any existing aliases or customizations.

2. **Create a backup before making changes**
   ```bash
   cp ~/.bashrc ~/.bashrc.bak
   ```

3. **Add some useful aliases to your ~/.bashrc**
   ```bash
   echo '# Custom aliases added during Linux learning' >> ~/.bashrc
   echo 'alias ll="ls -la"' >> ~/.bashrc
   echo 'alias update="sudo apt update && sudo apt upgrade"' >> ~/.bashrc
   echo 'alias clean="sudo apt autoremove && sudo apt clean"' >> ~/.bashrc
   ```

4. **Create a simple function in ~/.bashrc**
   ```bash
   echo '# Custom functions' >> ~/.bashrc
   echo 'mkcd() {' >> ~/.bashrc
   echo '  mkdir -p "$1" && cd "$1"' >> ~/.bashrc
   echo '}' >> ~/.bashrc
   ```

5. **Customize your bash prompt**
   ```bash
   echo '# Custom prompt' >> ~/.bashrc
   echo 'export PS1="\[\033[38;5;39m\]\u\[\033[0m\]@\[\033[38;5;208m\]\h\[\033[0m\]:\[\033[38;5;76m\]\w\[\033[0m\]$ "' >> ~/.bashrc
   ```

6. **Apply your changes**
   ```bash
   source ~/.bashrc
   ```

7. **Test your new aliases and functions**
   ```bash
   ll
   mkcd test_directory
   pwd
   ```

## 🧠 Reflection Questions (5 Minutes)
- What's the difference between `.bashrc` and `.bash_profile`?
- Why might you want to keep your dotfiles in version control?
- How could you share these customizations across multiple computers?

## 🔍 Exploring Further
- Look at the `~/.config` directory to see application-specific configurations:
  ```bash
  ls -la ~/.config/
  ```
- Check if you have any COSMIC desktop-specific configurations:
  ```bash
  ls -la ~/.config/pop-*
  ```

## 📝 Demo Review & Journal Prompt
Today I learned how to customize my bash environment on Pop!_OS.
I created aliases for common commands, added a useful function, and customized my prompt.
Next time, I'll explore more advanced customizations and learn how to manage dotfiles with Git.

## 🌟 Bonus Challenge
Create a simple script that backs up all your dotfiles to a directory of your choice:

```bash
mkdir -p ~/dotfiles_backup
cp ~/.bashrc ~/dotfiles_backup/
cp ~/.profile ~/dotfiles_backup/
# Add more files as needed
echo "Backup created on $(date)" > ~/dotfiles_backup/README.txt
```

## 📚 Resources for Further Learning
- [Bash Guide on Ubuntu Wiki](https://help.ubuntu.com/community/Beginners/BashScripting)
- [Arch Wiki Bash Page](https://wiki.archlinux.org/title/bash) (excellent resource despite being for Arch)
- [dotfiles.github.io](https://dotfiles.github.io/) - Inspiration for dotfile management