# Amazon Linux 2023 Learning Schedule

**Schedule:** 30-minute sessions | Thursday, Friday, Saturday, Sunday

This routine is designed for Amazon Linux 2023 mastery on EC2. It blends command-line usage, system care, and AWS-specific features into a repeatable structure. Each day has a theme you'll return to weekly with new lessons and hands-on tasks.

## 🔵 Thursday: Package Management & System Updates
*Master DNF and keep your system updated and optimized*

- Perform system updates (dnf)
- Clean package cache, remove orphaned packages
- Check logs (journalctl, systemd, dmesg)
- Disk and memory usage checks (df -h, free -h)
- Review system health and Amazon Linux specific tools

### 🧪 Sample lesson types:
- "Using DNF effectively on Amazon Linux"
- "Managing repositories and packages"
- "Reading journalctl error logs for last boot"

## 🟢 Friday: AWS Integration & Cloud Tools
*Learn how Amazon Linux integrates with AWS services*

- Explore EC2 metadata and user-data
- Use AWS CLI and AWS Systems Manager
- Configure CloudWatch agent
- Practice with instance roles and credentials
- Understand Amazon Linux specific optimizations

### 🧪 Sample lesson types:
- "Accessing EC2 metadata from the command line"
- "Setting up and using the AWS CLI"
- "Monitoring your instance with CloudWatch"

## 🟡 Saturday: Security & Hardening
*Secure your Amazon Linux instance*

- Configure firewall with firewalld
- Manage users, groups, and permissions
- Set up SSH key-based authentication
- Review security logs and audit trails
- Implement AWS security best practices

### 🧪 Sample lesson types:
- "Hardening SSH configuration"
- "Setting up a basic firewall"
- "Implementing least privilege access"

## 🔴 Sunday: Automation & Scripting
*Automate tasks and create useful scripts*

- Write bash scripts for common tasks
- Set up cron jobs and systemd timers
- Create user data scripts for EC2 instances
- Practice with AWS CloudFormation templates
- Document your automation for future reference

### 🧪 Sample lesson types:
- "Creating a system backup script"
- "Automating updates with systemd timers"
- "Writing effective EC2 user data scripts"

## 📌 Evergreen Tips for Amazon Linux 2023

- Use DNF for package management:
  ```
  sudo dnf update
  sudo dnf clean all
  ```
- Check for Amazon Linux specific tools:
  ```
  amazon-linux-extras list
  ```
- Access instance metadata:
  ```
  curl http://169.254.169.254/latest/meta-data/
  ```
- Use the AWS CLI for integration with AWS services
- Leverage IMDSv2 for enhanced security

Let me know when you're ready for Lesson 1 of the new rotation (Thursday: Package Management & System Updates) and I'll generate it!