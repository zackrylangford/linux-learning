# 🔄 Apache & NGINX: `systemctl reload` vs `restart`

## 📄 Overview

When managing web servers like **Apache (httpd)** and **NGINX** on AlmaLinux (or any systemd-based distro), it's important to understand the difference between `reload` and `restart` to avoid unnecessary downtime.

---

## 🚦 Definitions

### `systemctl restart [service]`
- **What it does**: Fully stops and then starts the service.
- **Impact**: 
  - Brief **downtime**
  - Existing connections **may be dropped**
  - All worker processes **killed and recreated**

### `systemctl reload [service]`
- **What it does**: Tells the service to reload its configuration without stopping.
- **Impact**: 
  - **No downtime**
  - Running processes **stay alive**
  - Config changes are applied **gracefully**

---

## 📊 Use Cases

| Scenario                                      | Use `reload` | Use `restart` |
|----------------------------------------------|--------------|---------------|
| Editing `httpd.conf` or `nginx.conf`         | ✅ Yes        | ✅ Optional    |
| Updating virtual host settings               | ✅ Yes        | ❌ Unnecessary |
| Changing SSL/TLS certificates (new files)    | ✅ Often      | ✅ Sometimes   |
| Enabling/disabling Apache modules            | ❌ No         | ✅ Required    |
| Service hangs or misbehaves                  | ❌ No         | ✅ Required    |
| Upgrading Apache/NGINX binary via `dnf`      | ❌ No         | ✅ Required    |

---

## ⚙ Apache (httpd) Behavior

- `reload` sends **SIGHUP** to the parent httpd process.
- The server:
  - Re-reads the config file
  - Spawns new worker processes
  - Gracefully shuts down old ones
- **Recommended** for most config edits

---

## ⚙ NGINX Behavior

- `reload` also sends **SIGHUP**, and NGINX:
  - Parses new config
  - Spawns new workers with updated settings
  - Gracefully shuts down old workers
- If the config is invalid, NGINX won't apply it, which avoids downtime

---

## 🧪 Testing Recommendations

### Apache
```bash
sudo systemctl reload httpd
curl -I http://localhost  # Check for HTTP 200 OK
