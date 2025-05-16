# Security & Hardening – Lesson 1: SSH and Firewall Configuration

## 🟡 Lesson Overview
- **Focus:** Learn to secure your Amazon Linux 2023 instance with SSH hardening and firewall configuration
- **Time:** 30 minutes
- **Goal:** Implement basic security measures to protect your EC2 instance

## 🔍 Why This Matters
Security is critical for any cloud instance. Amazon Linux 2023 instances are exposed to the internet and need proper security configurations to prevent unauthorized access. SSH hardening and firewall setup are fundamental security measures that every EC2 administrator should implement.

## 📚 Core Concepts To Learn

| Tool/Concept | Purpose | Example |
|--------------|---------|---------|
| SSH Configuration | Secure remote access | `/etc/ssh/sshd_config` |
| Key-based Authentication | Passwordless secure login | `ssh-keygen`, `~/.ssh/authorized_keys` |
| firewalld | Manage firewall rules | `firewall-cmd` |
| Security Groups | AWS network security | EC2 console or AWS CLI |
| Log Monitoring | Detect intrusion attempts | `/var/log/secure` |

## ✅ Practice Exercise (20 Minutes)

1. **Review current SSH configuration**
   ```bash
   sudo cat /etc/ssh/sshd_config
   ```
   Look for security settings like `PermitRootLogin` and `PasswordAuthentication`.

2. **Create a backup of SSH config**
   ```bash
   sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
   ```

3. **Harden SSH configuration**
   ```bash
   sudo nano /etc/ssh/sshd_config
   ```
   Make these changes:
   ```
   # Disable root login
   PermitRootLogin no
   
   # Disable password authentication
   PasswordAuthentication no
   
   # Limit SSH access to specific users (optional)
   # AllowUsers ec2-user
   
   # Use strong ciphers and MACs
   Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com
   MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com
   ```

4. **Check SSH configuration syntax**
   ```bash
   sudo sshd -t
   ```
   If no errors, restart SSH:
   ```bash
   sudo systemctl restart sshd
   ```

5. **Check if firewalld is installed and running**
   ```bash
   sudo systemctl status firewalld
   ```
   If not installed:
   ```bash
   sudo dnf install -y firewalld
   sudo systemctl enable --now firewalld
   ```

6. **Configure basic firewall rules**
   ```bash
   # Check current zone
   sudo firewall-cmd --get-active-zones
   
   # Allow SSH
   sudo firewall-cmd --permanent --add-service=ssh
   
   # If running a web server, allow HTTP/HTTPS
   sudo firewall-cmd --permanent --add-service=http
   sudo firewall-cmd --permanent --add-service=https
   
   # Reload to apply changes
   sudo firewall-cmd --reload
   
   # Verify rules
   sudo firewall-cmd --list-all
   ```

7. **Check for failed login attempts**
   ```bash
   sudo grep "Failed password" /var/log/secure | tail -10
   ```

## 🧠 Reflection Questions (5 Minutes)
- Why is key-based authentication more secure than password authentication?
- How do firewalld and AWS Security Groups work together to protect your instance?
- What other security measures could you implement on your EC2 instance?

## 🔍 Exploring Further
- Check your current AWS Security Group rules:
  ```bash
  aws ec2 describe-security-groups --group-ids $(aws ec2 describe-instances --instance-ids $(curl -s http://169.254.169.254/latest/meta-data/instance-id) --query 'Reservations[0].Instances[0].SecurityGroups[0].GroupId' --output text)
  ```
- Explore SELinux status:
  ```bash
  sestatus
  ```

## 📝 Demo Review & Journal Prompt
Today I learned how to secure my Amazon Linux 2023 instance by hardening SSH and configuring a firewall.
I modified the SSH configuration to disable root login and password authentication.
I also set up firewalld to control network access to my instance.
Next time, I'll explore user management and permission hardening.

## 🌟 Bonus Challenge
Create a simple script to monitor and alert on SSH login attempts:

```bash
#!/bin/bash
# ssh-monitor.sh - Monitor SSH login attempts

LOG_FILE="/var/log/secure"
REPORT_FILE="$HOME/ssh_report.txt"

echo "SSH Login Report - $(date)" > $REPORT_FILE
echo "=================================" >> $REPORT_FILE

echo "Successful logins:" >> $REPORT_FILE
grep "Accepted" $LOG_FILE | tail -10 >> $REPORT_FILE

echo -e "\nFailed login attempts:" >> $REPORT_FILE
grep "Failed password" $LOG_FILE | tail -10 >> $REPORT_FILE

echo -e "\nIP addresses with most failed attempts:" >> $REPORT_FILE
grep "Failed password" $LOG_FILE | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr | head -5 >> $REPORT_FILE

echo -e "\nReport generated at $(date)" >> $REPORT_FILE
echo "Report saved to $REPORT_FILE"
```

## 📚 Resources for Further Learning
- [AWS Security Best Practices](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-security.html)
- [OpenSSH Security](https://www.ssh.com/academy/ssh/security)
- [Firewalld Documentation](https://firewalld.org/documentation/)