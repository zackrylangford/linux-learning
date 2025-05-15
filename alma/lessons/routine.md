# ✅ AlmaLinux EC2 (CLI-Only) 7-Day Themed Rotation

Each day includes a core theme + essential weekly maintenance (updates/logs)

---

## 🔵 Monday: System & Package Management

**Focus:** Stay current and deepen your knowledge of `dnf`, `yum`, and system health

- `sudo dnf update -y && sudo dnf autoremove -y`
- `sudo dnf clean all`
- Check disk usage: `df -h`, `lsblk`
- Explore dnf history: `dnf history`, `dnf list available`
- Learn 1 dnf command deeply from `man dnf`
- Practice: install, remove, reinstall, and downgrade a package
- Log key changes or errors to [linux.zackrylangford.com](https://linux.zackrylangford.com)

---

## 🟢 Tuesday: Users, Permissions & Bash Scripting

**Focus:** User/group management + scripting proficiency

- Review or create user: `adduser`, `passwd`, `usermod`, `id`
- Test permissions: `chmod`, `chown`, `umask`, `groups`
- Write or expand a personal script (e.g., backup tool, user audit)
- Learn and apply bash basics: `if`, `for`, `$RANDOM`, `read`
- Review and annotate part of a script in your notes

---

## 🟡 Wednesday: SELinux, Security & Auditing

**Focus:** Understand RHEL security posture

- `getenforce`, `sestatus` — review current mode
- Explore SELinux logs: `/var/log/audit/`
- Test `restorecon`, `chcon`, or `semanage fcontext`
- Practice firewall tasks: `firewall-cmd` to list/add rules
- Review `ss`, `netstat`, and open ports
- Note anything that breaks, why, and how to fix it

---

## 🔴 Thursday: Services, Systemd & Scheduling

**Focus:** Master service management and automation

- List services: `systemctl list-units --type=service`
- Practice enabling/disabling: `systemctl enable|disable`
- Use `journalctl -u servicename` to trace problems
- Explore timers and scheduled jobs: `systemctl list-timers`
- Create a cron job or simple systemd timer

---

## 🟣 Friday: Networking & Remote Access

**Focus:** Network awareness, tools, and hardening

- View interfaces: `ip a`, `nmcli`, `hostnamectl`
- Test SSH settings and log: `/etc/ssh/sshd_config`, `ss -tuln`
- Explore `scp`, `rsync`, and SSH key-based access
- Learn and use `curl`, `wget`, `dig`, `host`
- Log output from a failed or blocked network request

---

## 🟤 Saturday: Filesystem Mastery & Tool Chaining

**Focus:** Get fast at navigation, disk work, and pipelines

- Use: `find`, `locate`, `xargs`, `du`, `df`, `tree`
- Chain commands together (`|`, `>`, `>>`, `tee`)
- Practice archiving: `tar`, `gzip`, `zip`, `xz`
- Navigate and understand layout: `/etc`, `/var`, `/usr`, `/boot`
- Backup or archive a directory using a custom script

---

## ⚪ Sunday: Reflect, Document, and Plan

**Focus:** Reinforce, write, and set up next week

- `journalctl -p 3 -xb` — catch unresolved issues
- Review what you learned this week (1–2 takeaways/day)
- Push updates to [linux.zackrylangford.com](https://linux.zackrylangford.com)
- Choose 1 new focus or mini-project for next week
- Refactor 1 script or config you’ve touched before

---

## 🧭 Weekly Rhythm Reminder

- ❗ Run updates/log checks at least **Monday + Sunday**
- 📚 Always include at least one man page or Arch Wiki/RHEL doc deep dive
- 📓 Keep `~/notes/` or markdown logs to track growth


