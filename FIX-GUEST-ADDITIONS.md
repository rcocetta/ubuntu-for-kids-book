# Fix VirtualBox Guest Additions 🔧

Guest Additions broken? Can't access shared folder? Here's how to fix it.

---

## Quick Fix - Reinstall Guest Additions Properly

### Step 1: Remove Broken Installation

```bash
# Remove the broken package install
sudo apt remove virtualbox-guest-utils virtualbox-guest-x11
sudo apt autoremove
```

### Step 2: Install from VirtualBox ISO (Proper Way)

**From VirtualBox menu (with VM running):**

1. Click: **Devices > Insert Guest Additions CD Image**
2. Ubuntu will ask to run it - click **Run** or **Open**

**Or manually mount and run:**

```bash
# The ISO should auto-mount to /media/$USER/VBox_GAs_*
# If not, mount it manually
sudo mkdir -p /media/cdrom
sudo mount /dev/cdrom /media/cdrom

# Run the installer
cd /media/cdrom
sudo ./VBoxLinuxAdditions.run

# Wait for it to complete
```

### Step 3: Reboot

```bash
sudo reboot
```

### Step 4: Check if Fixed

After reboot:

```bash
# Check if guest additions are running
lsmod | grep vbox

# You should see several vbox modules loaded

# Check if shared folder is accessible
ls /mnt/ubuntu-for-kids-book
# OR
ls /media/sf_ubuntu-for-kids-book
```

---

## If Shared Folder Still Not Accessible

### Option A: Add User to vboxsf Group

```bash
# Add your user to the vboxsf group
sudo usermod -aG vboxsf $USER

# Log out and log back in (or reboot)
sudo reboot
```

After reboot:
```bash
ls /media/sf_ubuntu-for-kids-book
```

### Option B: Manually Mount Shared Folder

```bash
# Create mount point
sudo mkdir -p /mnt/ubuntu-for-kids-book

# Mount the shared folder (replace 'ubuntu-for-kids-book' with your share name)
sudo mount -t vboxsf ubuntu-for-kids-book /mnt/ubuntu-for-kids-book

# Make it writable
sudo chmod 777 /mnt/ubuntu-for-kids-book
```

### Option C: Auto-mount on Boot

Add to `/etc/fstab`:

```bash
# Edit fstab
sudo nano /etc/fstab

# Add this line (replace 'ubuntu-for-kids-book' with your share name):
ubuntu-for-kids-book /mnt/ubuntu-for-kids-book vboxsf defaults,uid=1000,gid=1000 0 0

# Save (Ctrl+O, Enter, Ctrl+X)

# Test mount
sudo mount -a
```

---

## Alternative: Use SCP/SFTP to Transfer Scripts

If Guest Additions are too broken, transfer scripts another way:

### From Windows Host to Ubuntu VM:

**Option 1: Use Python HTTP Server**

On Ubuntu VM:
```bash
# Start simple web server in scripts directory
cd ~/Desktop
python3 -m http.server 8000
```

On Windows:
- Open browser to `http://[VM_IP]:8000`
- Download the scripts

**Option 2: Use Git**

The scripts are already in git! Just pull from GitHub:

```bash
cd ~
git clone https://github.com/rcocetta/ubuntu-for-kids-book.git
cd ubuntu-for-kids-book/scripts
./auto-screenshot-gnome.sh 2
```

**Option 3: Copy-Paste Script Content**

1. On Windows, open the script file in notepad
2. Copy all content
3. In Ubuntu VM:
```bash
nano ~/auto-screenshot-gnome.sh
# Paste content (Right-click > Paste)
# Save: Ctrl+O, Enter, Ctrl+X
chmod +x ~/auto-screenshot-gnome.sh
./auto-screenshot-gnome.sh 2
```

---

## Nuclear Option: Recreate the Share

### In VirtualBox Manager (VM powered off):

1. Click your VM
2. Click **Settings**
3. Go to **Shared Folders**
4. Remove the broken share
5. Click **+** to add new share:
   - **Folder Path**: Browse to `C:\path\to\ubuntu-for-kids-book`
   - **Folder Name**: `ubuntu-for-kids-book`
   - **Mount Point**: `/mnt/ubuntu-for-kids-book`
   - Check: ✅ **Auto-mount**
   - Check: ✅ **Make Permanent**
6. Click **OK**
7. Start VM

---

## Verify What Broke

```bash
# Check if kernel modules are loaded
lsmod | grep vbox

# Expected output:
# vboxsf
# vboxguest
# vboxvideo

# Check guest additions version
VBoxClient --version

# Check what's mounted
mount | grep vbox

# Check dmesg for errors
dmesg | grep -i vbox | tail -20
```

---

## Common Errors and Fixes

### Error: "kernel module vboxsf not found"

**Fix:**
```bash
# Reinstall kernel headers
sudo apt install linux-headers-$(uname -r)

# Reinstall guest additions from ISO
sudo /media/cdrom/VBoxLinuxAdditions.run
sudo reboot
```

### Error: "mount: unknown filesystem type 'vboxsf'"

**Fix:**
```bash
# Load the module manually
sudo modprobe vboxsf

# If that fails, reinstall guest additions
```

### Error: "Permission denied" on shared folder

**Fix:**
```bash
# Add yourself to vboxsf group
sudo usermod -aG vboxsf $USER

# Log out and back in, or:
sudo reboot
```

---

## Quickest Workaround Right Now

**If you just need to run the scripts immediately:**

### On Windows host:

1. Open Command Prompt in the `ubuntu-for-kids-book` folder
2. Run:
```cmd
python -m http.server 8000
```

### In Ubuntu VM:

```bash
# Download the scripts
cd ~/Desktop
wget http://10.0.2.2:8000/scripts/auto-screenshot-gnome.sh
chmod +x auto-screenshot-gnome.sh

# Run it
./auto-screenshot-gnome.sh 2
```

(10.0.2.2 is usually the host IP in VirtualBox NAT mode)

---

## What Went Wrong?

Installing `virtualbox-guest-utils` from apt conflicts with the proper Guest Additions ISO installer. The apt version is often outdated and doesn't match your VirtualBox version.

**Correct way:**
- Always use **Devices > Insert Guest Additions CD Image**
- Never use `apt install virtualbox-guest-utils` in VirtualBox VMs

---

## Summary

**Quick fix (5 minutes):**
1. `sudo apt remove virtualbox-guest-utils virtualbox-guest-x11`
2. VirtualBox menu: **Devices > Insert Guest Additions CD**
3. Run the installer when prompted
4. `sudo reboot`
5. `sudo usermod -aG vboxsf $USER` then reboot again

**Workaround (1 minute):**
- Clone from GitHub: `git clone https://github.com/rcocetta/ubuntu-for-kids-book.git`
- Scripts are there, no shared folder needed!

---

Let me know which approach you want to try, or if you need help with any of these steps! 🚑
