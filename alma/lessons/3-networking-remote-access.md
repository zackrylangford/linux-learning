# 🟣 AlmaLinux Lesson 3: Networking & Remote Access

### 🕒 30-Minute Command-Line-Only Lesson (EC2 CLI)

---

## 🎯 Objective

Learn essential networking tools, understand SSH configuration, and practice secure file transfers between systems.

---

## ✅ Part 1: Network Interface Inspection (8 mins)

**Commands:**

```bash
ip a
nmcli device show
hostnamectl
```

**Tasks:**
- Identify your primary network interface (likely eth0 or ens5 on EC2)
- Note your IP address, MAC address, and network status
- Check your hostname and operating system details

**🧠 Learn:**
- The difference between public and private IP addresses on cloud instances
- How to interpret network interface states (UP/DOWN)
- Use `man ip` to explore more network commands

---

## ✅ Part 2: SSH Configuration & Security (10 mins)

**Commands:**

```bash
sudo less /etc/ssh/sshd_config
ss -tuln | grep ssh
grep "Failed password" /var/log/secure
```

**Tasks:**
- Review key SSH daemon settings (PermitRootLogin, PasswordAuthentication)
- Verify SSH is listening on the expected port (usually 22)
- Check for failed login attempts in the secure log

**Bonus:**
- Create an SSH key pair if you don't have one:

  ```bash
  ssh-keygen -t ed25519 -C "almalinux-practice"
  ```

- View your public key:

  ```bash
  cat ~/.ssh/id_ed25519.pub
  ```

---

## ✅ Part 3: Network Tools & Diagnostics (10 mins)

**Commands:**

```bash
curl -I https://www.redhat.com
wget -q --spider https://almalinux.org
dig almalinux.org
host google.com
```

**Tasks:**
- Use curl to check HTTP headers from a website
- Test connectivity with wget
- Perform DNS lookups with dig and host
- Try a blocked request to simulate failure:

  ```bash
  curl -m 5 https://nonexistent-domain-123456.com
  ```

**🧠 Learn:**
- The difference between curl and wget
- How to interpret DNS query results
- Common network troubleshooting techniques

---

## ✅ Part 4: File Transfer Tools (if time permits)

**Commands:**

```bash
# Create a test file
echo "Test file for transfer" > ~/test-transfer.txt

# SCP example (if you have another system to transfer to)
# scp ~/test-transfer.txt username@remote-host:~/

# Rsync example (local)
mkdir ~/backup
rsync -av ~/test-transfer.txt ~/backup/
```

**Tasks:**
- Create a simple test file
- Practice rsync for local backup
- Understand the rsync options (-a for archive, -v for verbose)

---

## 🧾 Wrap-Up: Journal What You Learned (3–5 mins)

```markdown
# AlmaLinux Lesson 3: Networking & Remote Access

## Date: [Insert Today's Date]

- Network interface details:
  - Primary interface: [eth0/ens5/etc]
  - IP address: [your IP]
  - Hostname: [your hostname]
  
- SSH configuration:
  - Root login permitted: [yes/no]
  - Password authentication: [yes/no]
  - Listening port: [22/other]
  
- Network tools practiced:
  - curl: HTTP header inspection
  - dig/host: DNS lookups
  - rsync: File synchronization
  
- Key takeaways:
  - [Your personal insights]
  
- Questions for future exploration:
  - [ ] How to set up SSH key-based authentication between servers?
  - [ ] What are best practices for hardening SSH?
```

---

## 📚 Resources for Further Learning

- [Red Hat SSH Hardening Guide](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/security_guide/sec-securing_openssh)
- [Linux Network Commands Cheat Sheet](https://access.redhat.com/sites/default/files/attachments/rh_ip_command_cheatsheet_1214_jcs_print.pdf)
- [Rsync Tutorial](https://www.digitalocean.com/community/tutorials/how-to-use-rsync-to-sync-local-and-remote-directories)