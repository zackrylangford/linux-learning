# Lesson 2: Cleanup & Knowledge Review – Lesson 1

## 🧠 Objective
Reflect on what you’ve learned so far and clean up your Xubuntu system to ensure it remains efficient and organized.

---

## 🔍 Key Concepts (5 min)
- Regular system cleanup improves performance and reduces clutter.
- Reviewing your learning helps solidify knowledge and identify gaps.
- Backups ensure you can safely experiment without losing progress.

---

## 🧪 Activity: System Cleanup & Reflection (20–25 min)

### 1. **Clean Logs and Caches**
   - Remove unnecessary logs and cache files to free up space:
     ```bash
     sudo journalctl --vacuum-time=2weeks
     sudo apt autoremove --purge
     sudo apt clean
     ```

### 2. **Check for Orphaned Packages**
   - Identify and remove orphaned packages:
     ```bash
     deborphan | xargs sudo apt-get -y remove --purge
     ```
   - Install `deborphan` if not already installed:
     ```bash
     sudo apt install deborphan
     ```

### 3. **Backup Your Current Configuration**
   - Create a snapshot of your dotfiles and panel settings:
     ```bash
     cp -r ~/.config/xfce4/ ~/xfce4-config-backup-$(date +%Y%m%d)
     ```

### 4. **Reflect on Lesson 1**
   - Review your dual-panel setup:
     - Does it meet your workflow needs?
     - Are there any tweaks you’d like to make?
   - Write down 1–2 things you learned about Xfce customization.

### 5. **Plan for Next Week**
   - Draft a mini-goal or project idea for next week:
     - Example: "Explore Xfce add-ons like Conky or Docklike Panel."

---

## ✅ Completion Criteria
- Logs, caches, and orphaned packages are cleaned up.
- Your Xfce configuration is backed up.
- You’ve reflected on Lesson 1 and identified areas for improvement.
- A mini-goal or project idea is drafted for next week.

---

## 🧭 Optional Follow-Ups
- Explore additional cleanup tools like `bleachbit` (use with caution).
- Automate backups using a cron job or script.
- Research and install a new Xfce add-on to enhance your workflow.

---

Let me know when you’re ready for **Lesson 3** — we’ll dive into advanced Xfce customization or another topic of your choice!
