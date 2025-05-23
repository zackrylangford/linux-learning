# How to Build Your Own Ubuntu-Based Linux Distribution (Turing OS Example)

This guide documents the step-by-step process for creating a minimal, custom Ubuntu-based Linux distribution, similar to how Turing OS was built. This is a great starting point for anyone wanting to create their own OS flavor (like Pop!_OS, Linux Mint, etc.).

---

## Prerequisites
- A Linux system (tested on Pop!_OS, Ubuntu, etc.)
- At least 10GB free disk space
- sudo privileges

---

## Phase 1: Bootstrap a Minimal Ubuntu Filesystem

1. **Install build tools:**
   ```bash
   sudo apt update
   sudo apt install debootstrap squashfs-tools xorriso isolinux syslinux-utils grub-pc-bin grub-efi-amd64-bin mtools syslinux
   ```
2. **Create directory structure:**
   ```bash
   mkdir -p ~/turing-os/iso-live
   mkdir -p ~/turing-os/iso-root
   ```
3. **Bootstrap the minimal Ubuntu filesystem:**
   ```bash
   sudo debootstrap --arch=amd64 noble ~/turing-os/iso-live http://archive.ubuntu.com/ubuntu/
   ```
4. **Verify the filesystem:**
   ```bash
   ls ~/turing-os/iso-live
   ```

---

## Phase 2: Customize the Base OS

1. **Chroot into the new filesystem:**
   ```bash
   sudo chroot ~/turing-os/iso-live
   ```
2. **Set up package sources (if needed):**
   - Edit `/etc/apt/sources.list` to include all repositories:
     ```bash
     echo "deb http://archive.ubuntu.com/ubuntu noble main universe multiverse restricted" > /etc/apt/sources.list
     echo "deb http://archive.ubuntu.com/ubuntu noble-updates main universe multiverse restricted" >> /etc/apt/sources.list
     echo "deb http://archive.ubuntu.com/ubuntu noble-security main universe multiverse restricted" >> /etc/apt/sources.list
     ```
3. **Update and install basic tools:**
   ```bash
   apt update
   apt install sudo nano ssh net-tools curl wget systemd-sysv
   ```
4. **Create a user and add to sudo group:**
   ```bash
   adduser turing
   usermod -aG sudo turing
   ```
5. **Install the kernel (required for ISO boot):**
   ```bash
   apt install linux-image-generic
   ```
6. **Exit chroot:**
   ```bash
   exit
   ```

---

## Phase 3: Add a Graphical Environment

1. **Chroot back into the environment:**
   ```bash
   sudo chroot ~/turing-os/iso-live
   ```
2. **Install a minimal desktop environment (Xfce):**
   ```bash
   apt install xfce4 xfce4-goodies xorg lightdm network-manager
   ```
3. **Enable graphical login and networking:**
   ```bash
   systemctl enable lightdm
   systemctl enable NetworkManager
   ```
4. **(Optional) Fix locale warnings:**
   ```bash
   apt install locales
   locale-gen en_US.UTF-8
   export LANG=en_US.UTF-8
   ```
5. **Exit chroot:**
   ```bash
   exit
   ```

---

## Phase 4: Prepare Bootloader and ISO Structure

1. **Create required directories:**
   ```bash
   mkdir -p ~/turing-os/iso-root/isolinux
   mkdir -p ~/turing-os/iso-root/casper
   ```
2. **Copy ISOLINUX bootloader files:**
   ```bash
   sudo cp /usr/lib/ISOLINUX/isolinux.bin ~/turing-os/iso-root/isolinux/
   sudo cp /usr/lib/syslinux/modules/bios/ldlinux.c32 ~/turing-os/iso-root/isolinux/
   ```
3. **Create a minimal isolinux.cfg:**
   ```bash
   cat <<EOF | sudo tee ~/turing-os/iso-root/isolinux/isolinux.cfg
UI isolinux.bin
DEFAULT live
LABEL live
  KERNEL /casper/vmlinuz
  APPEND initrd=/casper/initrd root=/dev/ram0 ramdisk_size=1500000 boot=casper quiet splash ---
EOF
   ```
4. **Copy the kernel and initrd:**
   ```bash
   sudo cp ~/turing-os/iso-live/boot/vmlinuz-* ~/turing-os/iso-root/casper/vmlinuz
   sudo cp ~/turing-os/iso-live/boot/initrd.img-* ~/turing-os/iso-root/casper/initrd
   ```
   *(Use the latest versioned files. If you get permission errors, use sudo.)*
5. **Create the SquashFS filesystem:**
   ```bash
   sudo mksquashfs ~/turing-os/iso-live ~/turing-os/iso-root/filesystem.squashfs -e boot
   ```

---

## Phase 5: Build the ISO

1. **Build the ISO image:**
   ```bash
   sudo xorriso -as mkisofs -o ~/turing-os/turing-os.iso \
     -isohybrid-mbr /usr/lib/ISOLINUX/isohdpfx.bin \
     -c isolinux/boot.cat -b isolinux/isolinux.bin \
     -no-emul-boot -boot-load-size 4 -boot-info-table ~/turing-os/iso-root
   ```
2. **Test your ISO in VirtualBox, GNOME Boxes, or QEMU!**

---

## Tips
- Keep your build directories (`iso-live/`, `iso-root/`) out of git using `.gitignore`.
- Document every manual step for reproducibility.
- Automate with scripts as you go for easier rebuilding.

---

This process gives you a working, minimal Ubuntu-based OS you can customize further. For more advanced workflows (like building the ISO, adding custom branding, or integrating AI), see the main project [`TODO`](TODO) and [`TODOv1.md`](TODOv1.md) for inspiration and next steps.
