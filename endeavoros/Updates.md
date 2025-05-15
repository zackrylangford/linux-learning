🛠 EndeavourOS Machine Update Guide (Arch-Based)
1. Sync and refresh official repositories:
sudo pacman -Syu

S = sync packages
y = refresh package databases
u = upgrade all packages
This updates all system packages from Arch and EndeavourOS.
2. Update AUR packages (if using yay):
yay -Syu

This runs the same pacman -Syu under the hood plus updates packages installed from the AUR (Arch User Repository).
3. Check for orphaned packages (installed but no longer required):
pacman -Qdt

If it lists anything, remove with:
sudo pacman -Rns $(pacman -Qdtq)

4. Clean out old package caches (optional, to free up space):
sudo paccache -r

Keeps the three most recent versions by default. To be more aggressive:
sudo paccache -rk1

5. Reboot if kernel or core system packages were updated:
sudo reboot


⚠️ Important Notes for EndeavourOS
Arch (and EndeavourOS) is rolling release, so every update is a system upgrade.
It's generally safe to run sudo pacman -Syu daily or a few times a week.
Always read pacman output carefully — it may include important merge prompts or breaking changes.
If you see .pacnew or .pacsave files, consider reviewing them:
sudo pacdiff


🧾 Summary of Essential Commands
sudo pacman -Syu       # Update system packages
yay -Syu               # Update system + AUR packages
pacman -Qdt            # List orphaned packages
sudo pacman -Rns ...   # Remove orphaned packages
sudo paccache -r       # Clean old cached packages
sudo reboot            # Reboot if core packages were updated


Let me know if you want this in .md format for your GitHub repo or if you’d like a version with additional notes for your scripts/ folder on EndeavourOS.