# 🔴 AlmaLinux Lesson 2: Services, Systemd, and Scheduling

### 🕒 30-Minute Command-Line-Only Lesson (EC2 CLI)

---

## 🎯 Objective

Learn how to manage services using `systemctl`, inspect logs with `journalctl`, and schedule basic automated jobs with both `cron` and `systemd timers`.

---

## ✅ Part 1: Inspect and Manage Services (10 mins)

**Commands:**

```bash
systemctl list-units --type=service
systemctl status crond
systemctl is-enabled crond
```

**Tasks:**
- Identify a few running services.
- Check the status of `crond` (the cron job scheduler).
- Note whether it is enabled to start at boot.
- If it’s not enabled, run:

  ```bash
  sudo systemctl enable --now crond
  ```

**🧠 Learn:**
- The difference between **active**, **enabled**, **failed**, and **masked** services.
- Use `man systemctl` to understand options like `start`, `stop`, `restart`, `disable`.

---

## ✅ Part 2: Read Service Logs (7–8 mins)

**Commands:**

```bash
journalctl -u crond --since "10 minutes ago"
```

**Tasks:**
- View logs from the `crond` service.
- Try running a command manually and see if it shows up in logs.

**Bonus:**
- Try a failing service:

  ```bash
  sudo systemctl start badservice
  ```

  (Expect failure, then run `journalctl -xe` to troubleshoot)

---

## ✅ Part 3: Create a Cron Job and Timer (10 mins)

### 1. **Cron Job**

```bash
crontab -e
```

**Add:**

```bash
*/5 * * * * echo "Hi from cron on $(date)" >> ~/cronlog.txt
```

This logs a timestamped message every 5 minutes.

> Wait at least 5 minutes and run:

```bash
tail ~/cronlog.txt
```

---

### 2. **Simple systemd timer (Bonus, if time)**

**Create files:**

```bash
mkdir -p ~/.config/systemd/user
```

**hello.timer**

```ini
[Unit]
Description=Run hello script every 2 minutes

[Timer]
OnBootSec=1min
OnUnitActiveSec=2min
Unit=hello.service

[Install]
WantedBy=timers.target
```

**hello.service**

```ini
[Unit]
Description=Say hello

[Service]
ExecStart=/bin/echo "Hello from systemd timer on $(date)" >> /home/ec2-user/hellolog.txt
```

**Start the timer:**

```bash
systemctl --user daemon-reexec
systemctl --user daemon-reload
systemctl --user enable --now hello.timer
```

> Then run:

```bash
tail ~/hellolog.txt
```

---

## 🧾 Wrap-Up: Journal What You Learned (3–5 mins)

```markdown
# AlmaLinux Lesson 2: Services, Systemd & Scheduling

## Date: Thu, May 15, 2025

- Reviewed running services with `systemctl`
- Explored logs using `journalctl -u crond`
- Created a test cron job: ✅
- Created (or reviewed) a `systemd` user timer: ✅
- Learned the difference between service states
- Key commands: systemctl, journalctl, crontab, systemd timer config
- Questions:
  - [ ] What’s the best way to write portable `systemd` timers across systems?
  - [ ] Can cron and systemd timers conflict if they trigger the same script?
```

---

Let me know if you'd like this lesson pushed to a GitHub repo, saved into a textdoc, or uploaded to [linux.zackrylangford.com](https://linux.zackrylangford.com).
