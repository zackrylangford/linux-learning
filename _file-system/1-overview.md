# Linux File System: The Big Picture

The Linux file system follows the Filesystem Hierarchy Standard (FHS), organizing files and directories in a structured way. This overview explains the purpose of each major directory and how they work together.

## Root Directory Structure

```
/
├── bin/    - Essential command binaries (ls, cp, mkdir)
├── boot/   - Boot loader files, kernels, initramfs
├── dev/    - Device files (disks, terminals, etc.)
├── etc/    - System-wide configuration files
├── home/   - User home directories
├── lib/    - Essential shared libraries
├── lib64/  - 64-bit essential shared libraries
├── media/  - Mount points for removable media
├── mnt/    - Temporary mount points
├── opt/    - Optional/add-on application software
├── proc/   - Virtual filesystem for process/kernel info
├── root/   - Home directory for the root user
├── run/    - Run-time variable data (since boot)
├── sbin/   - System binaries (for system administration)
├── srv/    - Data for services provided by the system
├── sys/    - Virtual filesystem exposing kernel features
├── tmp/    - Temporary files (cleared on reboot)
├── usr/    - Secondary hierarchy (user programs, data)
└── var/    - Variable data (logs, databases, websites)
```

## Key Concepts

### 1. Everything Is a File
In Linux, everything is represented as a file, including:
- Regular files: Documents, scripts, binaries
- Directories: Special files that contain other files
- Devices: Hardware represented as files in `/dev`
- Sockets: Inter-process communication endpoints
- Pipes: Channels between processes

### 2. Hierarchical Structure
The file system starts at the root (`/`) and branches out in a tree-like structure. Paths can be:
- Absolute: Start with `/` (e.g., `/home/user/documents`)
- Relative: Relative to current directory (e.g., `../documents`)

### 3. Mount Points
Linux can attach (mount) different storage devices or filesystems to specific directories:
- `/mnt` and `/media` are common mount points
- Any directory can serve as a mount point

### 4. Virtual Filesystems
Some directories don't represent physical storage but provide interfaces to system information:
- `/proc` - Process information and system statistics
- `/sys` - Kernel and hardware information
- `/dev` - Device access

## Major Directory Categories

### System Directories
- `/bin`, `/sbin`, `/lib`, `/lib64` - Essential system files
- `/etc` - Configuration files
- `/boot` - Boot files

### User Directories
- `/home` - User personal files
- `/root` - Administrator's home
- `/usr` - User programs and data

### Variable Data
- `/var` - Logs, caches, databases
- `/tmp` - Temporary files
- `/run` - Runtime data

### Special Directories
- `/dev` - Device files
- `/proc` - Process information
- `/sys` - System information

## Modern Trends

### The `/usr` Merge
Many distributions now merge `/bin`, `/sbin`, `/lib` with their counterparts in `/usr`:
- `/bin` → `/usr/bin`
- `/sbin` → `/usr/sbin`
- `/lib` → `/usr/lib`

### Container File Systems
Container technologies like Docker often use simplified file systems:
- Minimal root directories
- Read-only system files
- Layered file system approach

## Next Steps

Explore each directory in depth to understand:
- What files are stored there
- How the directory is used
- Common configuration patterns
- Security considerations

Each directory will have its own dedicated file in this learning series.