# Lesson 1: Customizing the Xfce Panel & Whisker Menu

## 🧠 Objective
Learn how to customize the Xfce panel and the Whisker Menu to improve your workflow using a dual-panel setup.

---

## 🔍 Key Concepts (5 min)
- The Xfce Panel is the bar that holds your app launcher, system tray, clock, and task manager.
- It is fully customizable: position, size, opacity, items, and more.
- The Whisker Menu is a modern, searchable application launcher.
- You can use multiple panels in Xfce to organize your workflow.

---

## 🧪 Demo: Build a Dual-Panel Workspace Layout (20–25 min)
**Goal:** Create a top and bottom panel layout where the bottom acts as your primary app/task center.

1. **Backup your current panel config**
   ```bash
   cp -r ~/.config/xfce4/panel ~/.config/xfce4/panel.bak
   ```

2. **Create a new panel**
   - Right-click the existing panel → Panel → Panel Preferences
   - Click the ➕ icon to add Panel 1
   - Change Panel 1’s position to **Bottom**
   - Set length to 100% and row size to ~30–35px

3. **Add items to the bottom panel (Panel 1)**
   In the Items tab, add and reorder:
   - Whisker Menu
   - Window Buttons
   - Workspace Switcher
   - Separator (expandable)
   - System Tray
   - Clock or DateTime

4. **Clean up the top panel (Panel 0)**
   - Options:
     - Strip it down to just launchers and notification icons
     - Or remove it entirely if you prefer a bottom-only layout

5. **Restart the panel (if needed)**
   ```bash
   xfce4-panel --restart
   ```

---

## ✅ Completion Criteria
- Dual panels are configured and visually distinct
- Whisker Menu works and is positioned as desired
- You know how to add, remove, and reorder panel items
- You’ve backed up your layout config for later reuse

---

## 🧭 Optional Follow-Ups (save for future lessons)
- Assign Super key to open Whisker Menu
- Enable panel auto-hide or opacity effects
- Add `.desktop` launchers for favorite apps

---

Let me know when you're ready for **Lesson 2** — we’ll move on to Cleanup & Knowledge Review – Lesson 1 (Thursday) next!