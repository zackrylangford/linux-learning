# /etc - System Configuration Files

## Purpose
The `/etc` directory contains system-wide configuration files and shell scripts that are used to control the operation of system programs and services. It is one of the most important directories for system administration.

## Key Characteristics

- Contains text-based configuration files (typically in plain text or XML)
- Only root user can modify most files (but anyone can read many of them)
- Changes here affect the entire system and all users
- No executable binaries should be located here
- Name originates from "et cetera" but is now considered to stand for "Editable Text Configuration"

## Important Files and Subdirectories

| File/Directory | Purpose |
|----------------|---------|
| `/etc/passwd`  | User account information |
| `/etc/shadow`  | Secure user account information (encrypted passwords) |
| `/etc/group`   | Group definitions |
| `/etc/fstab`   | Filesystem table - controls which filesystems are mounted at boot |
| `/etc/hosts`   | Static hostname to IP mapping |
| `/etc/resolv.conf` | DNS resolver configuration |
| `/etc/ssh/`    | SSH server and client configuration |
| `/etc/sudoers` | Controls sudo access permissions |
| `/etc/network/` or `/etc/NetworkManager/` | Network configuration |
| `/etc/cron.d/`, `/etc/crontab` | Scheduled task configuration |
| `/etc/systemd/` | Systemd service manager configuration |
| `/etc/apt/` or `/etc/yum/` | Package manager configuration |

## Configuration File Formats

Most files in `/etc` follow common formats:

1. **Simple key-value pairs**:
   ```
   HOSTNAME=myserver
   TIMEZONE=UTC
   ```

2. **INI-style sections**:
   ```
   [section]
   key=value
   another_key=another_value
   ```

3. **XML configuration**:
   ```xml
   <config>
     <setting name="timeout" value="30" />
   </config>
   ```

4. **YAML configuration** (newer applications):
   ```yaml
   server:
     port: 8080
     timeout: 30
   ```

## Backup and Version Control

It's considered best practice to:

1. Back up `/etc` before making system changes
2. Use version control (like git) to track changes to configuration files
3. Use configuration management tools (Ansible, Puppet, etc.) for consistent changes

```bash
# Quick backup of a config file before editing
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# Or use version control
cd /etc
sudo git init
sudo git add .
sudo git commit -m "Initial commit of system configuration"
```

## Package Management and /etc

When packages are installed, they often place default configurations in `/etc`:

- Original configs are sometimes preserved as `.dpkg-old` or `.rpmsave`
- New versions might be installed as `.dpkg-new` or `.rpmnew`
- Configuration files are typically not overwritten during upgrades

## Security Considerations

- Many files contain sensitive information (passwords, keys)
- Permissions should be carefully managed
- Some files should only be readable by root (like `/etc/shadow`)
- Changes should be logged and monitored

## Exploring /etc

To see what configuration files have been modified from their package defaults (Debian/Ubuntu):

```bash
sudo debsums -c
```

To find recently modified configuration files:

```bash
find /etc -type f -mtime -7 | sort
```