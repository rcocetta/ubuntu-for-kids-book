# Screenshot Automation Troubleshooting 🔧

## Problem: xdotool Not Clicking/Opening Anything

If the automation script runs but captures the same screenshot every time (not opening apps), this means **xdotool can't interact with the UI**.

---

## Quick Fix: Use Manual-Assisted Script Instead

**Instead of the fully automated script, use the manual-assisted version:**

```bash
cd ubuntu-for-kids-book/scripts
./auto-screenshot-manual.sh
```

**How it works:**
- Script prompts you: "Open Firefox"
- You manually open Firefox
- Press Enter
- Script captures the screenshot
- Repeat for each screenshot

**Time:** ~30-45 minutes (much faster than fully manual, much more reliable than automation)

---

## Diagnosing the xdotool Problem

Run the test script:

```bash
cd ubuntu-for-kids-book/scripts
./test-xdotool.sh
```

This will tell you exactly what's wrong.

---

## Common Causes & Fixes

### 1. **DISPLAY Variable Not Set**

**Symptom:** Test shows "DISPLAY not set"

**Fix:**
```bash
export DISPLAY=:0
./auto-screenshot.sh all
```

**Permanent fix** (add to ~/.bashrc):
```bash
echo 'export DISPLAY=:0' >> ~/.bashrc
source ~/.bashrc
```

---

### 2. **Running via SSH or Remote Connection**

**Symptom:** Script works when run from terminal inside VM, but not via SSH

**Fix:** You MUST run the script from inside the VM desktop, not remotely:
- Open Terminal inside the Ubuntu VM (Ctrl+Alt+T)
- Run script from there
- DON'T use SSH or VSCode Remote

---

### 3. **VirtualBox-Specific Issues**

**Symptom:** xdotool works but clicks in wrong places or doesn't work in VirtualBox

**Fix 1: Install VirtualBox Guest Additions**
```bash
# In the VM:
sudo apt update
sudo apt install virtualbox-guest-utils virtualbox-guest-x11
sudo reboot
```

**Fix 2: Use Window Mode (not fullscreen/seamless)**
- In VirtualBox, use normal window mode
- Don't use fullscreen or seamless mode
- These modes can confuse xdotool

**Fix 3: Disable Mouse Integration**
- VirtualBox menu: Input > Mouse Integration (uncheck)
- This prevents VirtualBox from interfering with xdotool

---

### 4. **Wayland vs X11**

**Symptom:** xdotool doesn't work at all

**Check which display server you're using:**
```bash
echo $XDG_SESSION_TYPE
```

**If it says "wayland":**

xdotool doesn't work well with Wayland. Switch to X11:

1. Log out
2. At login screen, click your username
3. Click the gear icon (⚙️) bottom right
4. Select "Ubuntu on Xorg" (not "Ubuntu" or "Ubuntu on Wayland")
5. Log in
6. Try script again

**Permanent X11 (if needed):**
```bash
sudo nano /etc/gdm3/custom.conf
```

Uncomment this line:
```
WaylandEnable=false
```

Reboot.

---

### 5. **Permissions Issue**

**Symptom:** Script runs but can't interact with windows

**Fix:**
```bash
# Make sure you're running as your normal user, not root
whoami   # Should show your username, not 'root'

# Run script as your user
./auto-screenshot.sh all
```

DON'T run with sudo!

---

### 6. **Script Running Too Fast**

**Symptom:** Apps don't load in time before screenshot

You already increased delays, but try even more:

Edit `scripts/auto-screenshot.sh`:
```bash
DELAY_SHORT=5      # Increase from 3
DELAY_MEDIUM=10    # Increase from 6
DELAY_LONG=15      # Increase from 9
```

---

## Alternative Solutions

### Option A: Manual-Assisted Script (RECOMMENDED)

```bash
./auto-screenshot-manual.sh
```

- Guides you step by step
- You open apps manually
- Script captures automatically
- Takes ~30-45 minutes
- **Most reliable method!**

### Option B: Windows Screenshot Tool

Since you're running VirtualBox from Windows:

**Use ShareX on Windows host:**

1. Install ShareX (free): https://getsharex.com/
2. Configure:
   - Hotkey: Ctrl+Shift+S
   - Region capture mode
   - Auto-save to folder
3. Run VM in windowed mode (not fullscreen)
4. Capture VM window with ShareX

**Benefits:**
- Very fast
- Reliable
- Easy to organize files
- Can crop just the window

### Option C: Take Screenshots Manually

**Fastest manual method:**

1. Open first app
2. Press PrtSc (Print Screen)
3. Screenshot taken
4. Open next app
5. Press PrtSc
6. Repeat...

Files go to `~/Pictures` - rename and move them.

---

## Summary of Methods

| Method | Time | Reliability | Ease |
|--------|------|-------------|------|
| Full automation (xdotool) | 15 min | ⚠️ Doesn't work | Easy if works |
| Manual-assisted script | 30-45 min | ✅ Very reliable | Very easy |
| ShareX from Windows | 30 min | ✅ Very reliable | Easy |
| Fully manual | 60-90 min | ✅ Always works | Tedious |

**Recommendation:** Use the **manual-assisted script** - it's the perfect balance!

---

## Testing if Fix Worked

After trying a fix, test it:

```bash
# Simple test
xdotool key super     # Should open Activities
sleep 2
xdotool key Escape    # Should close it

# If that works:
./auto-screenshot.sh 2    # Try Chapter 2
```

---

## Still Having Issues?

**Check these:**

1. ✅ Running from Terminal INSIDE VM (not SSH)
2. ✅ DISPLAY=:0 is set
3. ✅ Using X11 (not Wayland)
4. ✅ VirtualBox Guest Additions installed
5. ✅ Window mode (not fullscreen/seamless)
6. ✅ Not running as root/sudo

**If all else fails:** Use `auto-screenshot-manual.sh` - it WILL work!

---

## Quick Reference

```bash
# Test xdotool
./test-xdotool.sh

# Use manual-assisted (recommended)
./auto-screenshot-manual.sh

# Try automated with fixes
export DISPLAY=:0
./auto-screenshot.sh 2

# Check display server
echo $XDG_SESSION_TYPE   # Should be "x11"

# Install Guest Additions
sudo apt install virtualbox-guest-utils virtualbox-guest-x11
```

---

**Bottom line:** If automation isn't working after 10 minutes of troubleshooting, just use the manual-assisted script. It's fast, reliable, and gets the job done! 🎯
