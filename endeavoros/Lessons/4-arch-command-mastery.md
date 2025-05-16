# Arch Command Mastery – Lesson 2: Building from AUR with makepkg

## 🟢 Lesson Overview
- **Focus:** Learn to build and install packages from the Arch User Repository (AUR)
- **Time:** 30 minutes
- **Goal:** Understand the AUR package building process and use makepkg effectively

## 🔍 Why This Matters
The Arch User Repository (AUR) is one of Arch Linux's greatest strengths, providing thousands of packages not found in the official repositories. Learning to build packages from the AUR manually gives you more control and understanding than using an AUR helper like yay, and is an essential skill for any Arch user.

## 📚 Core Commands To Learn

| Command | Purpose | Example |
|---------|---------|---------|
| `git clone` | Clone AUR repository | `git clone https://aur.archlinux.org/package-name.git` |
| `makepkg` | Build package | `makepkg -si` |
| `pacman -U` | Install local package | `sudo pacman -U package-name.pkg.tar.zst` |
| `less PKGBUILD` | Review build script | `less PKGBUILD` |
| `makepkg --noconfirm` | Build without confirmation | `makepkg -si --noconfirm` |

## ✅ Practice Exercise (20 Minutes)

1. **Choose an AUR package to build**
   Let's use `neofetch-git` as an example (a system info script):
   ```bash
   cd ~/Downloads
   mkdir aur-build
   cd aur-build
   ```

2. **Clone the AUR repository**
   ```bash
   git clone https://aur.archlinux.org/neofetch-git.git
   cd neofetch-git
   ```

3. **Review the PKGBUILD file**
   ```bash
   less PKGBUILD
   ```
   Look for:
   - Dependencies (depends, makedepends)
   - Source URLs
   - Build and package functions
   - Any potential security concerns

4. **Install build dependencies**
   ```bash
   sudo pacman -S --needed base-devel
   ```
   This installs the base development packages if not already installed.

5. **Build and install the package**
   ```bash
   makepkg -si
   ```
   The `-s` flag installs needed dependencies, and `-i` installs the package after building.

6. **Test the installed package**
   ```bash
   neofetch
   ```
   You should see system information displayed.

7. **Check package information**
   ```bash
   pacman -Qi neofetch-git
   ```
   Note that it's now tracked by pacman like any other package.

8. **Clean up build files (optional)**
   ```bash
   cd ..
   rm -rf neofetch-git
   ```

## 🧠 Reflection Questions (5 Minutes)
- Why might you want to build a package from the AUR instead of using the official repositories?
- What security considerations should you keep in mind when using the AUR?
- How does makepkg differ from directly using pacman?

## 🔍 Exploring Further
- Check the Arch Wiki page on AUR:
  ```bash
  xdg-open https://wiki.archlinux.org/title/Arch_User_Repository
  ```
- Explore makepkg configuration:
  ```bash
  less /etc/makepkg.conf
  ```

## 📝 Demo Review & Journal Prompt
Today I learned how to build and install packages from the AUR using makepkg.
I practiced cloning an AUR repository, reviewing the PKGBUILD file, and building the package.
I also learned about the importance of reviewing PKGBUILDs for security reasons.
Next time, I'll explore how to create my own PKGBUILD files or learn about maintaining AUR packages.

## 🌟 Bonus Challenge
Try building a more complex package or create a simple script to automate AUR updates:

```bash
#!/bin/bash
# aur-update.sh - Update AUR packages

AUR_DIR="$HOME/aur"
mkdir -p "$AUR_DIR"

# List of AUR packages to maintain
AUR_PACKAGES=("neofetch-git" "another-package" "third-package")

for pkg in "${AUR_PACKAGES[@]}"; do
    echo "Updating $pkg..."
    
    # Check if directory exists
    if [ -d "$AUR_DIR/$pkg" ]; then
        cd "$AUR_DIR/$pkg"
        git pull
    else
        cd "$AUR_DIR"
        git clone "https://aur.archlinux.org/$pkg.git"
        cd "$pkg"
    fi
    
    # Build and install
    makepkg -si --noconfirm
    
    echo "$pkg updated successfully!"
    echo
done

echo "All AUR packages updated!"
```

## 📚 Resources for Further Learning
- [Arch Wiki: AUR](https://wiki.archlinux.org/title/Arch_User_Repository)
- [Arch Wiki: PKGBUILD](https://wiki.archlinux.org/title/PKGBUILD)
- [Arch Wiki: makepkg](https://wiki.archlinux.org/title/Makepkg)
- [AUR Web Interface](https://aur.archlinux.org/)