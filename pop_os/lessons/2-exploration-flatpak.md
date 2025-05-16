# Exploration & Projects – Lesson 1: Flatpak Management

## 🔴 Lesson Overview
- **Focus:** Learn to effectively manage Flatpak applications in Pop!_OS
- **Time:** 30 minutes
- **Goal:** Master Flatpak commands and optimize your application management

## 🔍 Why This Matters
Flatpak is a key part of the Pop!_OS software ecosystem, providing sandboxed applications with their dependencies included. Understanding how to manage Flatpaks from the command line gives you more control over your applications and helps you keep your system clean and organized.

## 📚 Core Concepts To Learn

| Command | Purpose | Example |
|---------|---------|---------|
| `flatpak list` | Show installed Flatpaks | `flatpak list` |
| `flatpak install` | Install applications | `flatpak install flathub org.gimp.GIMP` |
| `flatpak update` | Update all Flatpaks | `flatpak update` |
| `flatpak remove` | Remove applications | `flatpak remove org.gimp.GIMP` |
| `flatpak remote-list` | List configured remotes | `flatpak remote-list` |
| `flatpak search` | Find applications | `flatpak search gimp` |

## ✅ Practice Exercise (20 Minutes)

1. **Check your current Flatpak setup**
   ```bash
   flatpak remotes
   flatpak list
   ```
   Note which remotes are configured and which applications are installed.

2. **Search for an application**
   ```bash
   flatpak search drawing
   ```
   Look for a simple drawing application like Drawing or Pinta.

3. **Install a Flatpak application**
   ```bash
   flatpak install flathub com.github.maoschanz.drawing
   ```
   (Or choose another application you found in your search)

4. **Run the installed application**
   ```bash
   flatpak run com.github.maoschanz.drawing
   ```
   Explore the application briefly.

5. **Check application information**
   ```bash
   flatpak info com.github.maoschanz.drawing
   ```
   Note the size, runtime, and permissions.

6. **Find where Flatpak data is stored**
   ```bash
   ls -la ~/.var/app/
   ```
   This is where Flatpak applications store their user data.

7. **Update all your Flatpak applications**
   ```bash
   flatpak update
   ```

8. **Clean up unused Flatpak runtimes**
   ```bash
   flatpak uninstall --unused
   ```
   This removes runtimes that aren't being used by any installed applications.

## 🧠 Reflection Questions (5 Minutes)
- How does Flatpak's approach to application distribution differ from apt?
- What are the advantages and disadvantages of using Flatpak applications?
- How might you manage Flatpak permissions for better security?

## 🔍 Exploring Further
- Check Flatpak application permissions:
  ```bash
  flatpak info --show-permissions com.github.maoschanz.drawing
  ```
- Explore the Flathub website: https://flathub.org

## 📝 Demo Review & Journal Prompt
Today I learned how to manage Flatpak applications in Pop!_OS.
I practiced installing, running, and updating Flatpak applications from the command line.
I explored where Flatpak stores application data and how to clean up unused runtimes.
Next time, I'll explore how to manage Flatpak permissions and integrate Flatpaks with my desktop environment.

## 🌟 Bonus Challenge
Create a simple script that lists all your installed Flatpak applications with their sizes:

```bash
#!/bin/bash
# flatpak-sizes.sh - List installed Flatpaks with their sizes

echo "Installed Flatpak Applications and Sizes:"
echo "----------------------------------------"

flatpak list --app --columns=application | while read app; do
  size=$(du -sh ~/.var/app/$app 2>/dev/null | awk '{print $1}')
  if [ -z "$size" ]; then
    size="N/A"
  fi
  name=$(flatpak info $app | grep "Name:" | awk '{$1=""; print $0}' | xargs)
  echo "$name ($app): $size"
done | sort
```

## 📚 Resources for Further Learning
- [Flatpak Documentation](https://docs.flatpak.org)
- [Flathub Website](https://flathub.org)
- [Pop!_OS Flatpak Guide](https://support.system76.com/articles/flatpak/)