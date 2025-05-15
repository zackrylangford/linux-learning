# 🛠 EndeavourOS Machine Update Guide (Arch-Based)

Follow these steps to keep your EndeavourOS system up-to-date and running smoothly:

---

## 1. Sync and Refresh Official Repositories

```bash
sudo pacman -Syu
```

- **S** = Sync packages
- **y** = Refresh package databases
- **u** = Upgrade all packages

This updates all system packages from Arch and EndeavourOS.

---

## 2. Update AUR Packages (if using yay)

```bash
yay -Syu
```

This runs the same `pacman -Syu` under the hood plus updates packages installed from the AUR (Arch User Repository).

---

## 3. Check for Orphaned Packages

List orphaned packages (installed but no longer required):

```bash
pacman -Qdt
```

If it lists anything, remove them with:

```bash
sudo pacman -Rns $(pacman -Qdtq)
```

---

## 4. Clean Out Old Package Caches (Optional)

Free up space by cleaning old package caches:

```bash
sudo paccache -r
```

- Keeps the three most recent versions by default.
- To be more aggressive:

```bash
sudo paccache -rk1
```

---

## 5. Reboot if Kernel or Core System Packages Were Updated

```bash
sudo reboot
```

---

## ⚠️ Important Notes for EndeavourOS

- Arch (and EndeavourOS) is a rolling release, so every update is a system upgrade.
- It's generally safe to run `sudo pacman -Syu` daily or a few times a week.
- Always read `pacman` output carefully — it may include important merge prompts or breaking changes.
- If you see `.pacnew` or `.pacsave` files, consider reviewing them:

```bash
sudo pacdiff
```

---

## 🧾 Summary of Essential Commands

```bash
sudo pacman -Syu       # Update system packages
yay -Syu               # Update system + AUR packages
pacman -Qdt            # List orphaned packages
sudo pacman -Rns ...   # Remove orphaned packages
sudo paccache -r       # Clean old cached packages
sudo reboot            # Reboot if core packages were updated
```

---

Let me know if you want this in `.md` format for your GitHub repo or if you’d like a version with additional notes for your `scripts/` folder on EndeavourOS.