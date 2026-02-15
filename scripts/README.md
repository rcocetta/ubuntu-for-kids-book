# Screenshot Automation Scripts 📸🤖

This directory contains tools to automate screenshot capture for the "Ubuntu for Kids" book.

## Quick Start 🚀

### 1. Setup (One Time)

In your Ubuntu VM, run:

```bash
# Install required tools
sudo apt install xdotool wmctrl gnome-screenshot

# Optional: Install apps that aren't default (for Chapter 4-7 screenshots)
sudo apt install drawing gimp openshot-qt audacity cowsay figlet cmatrix gnome-tweaks
```

### 2. Run the Automated Screenshot Tool

```bash
cd ubuntu-for-kids-book/scripts
./auto-screenshot.sh [chapter_number]
```

**Examples**:
```bash
# Capture all Chapter 2 screenshots (14 screenshots)
./auto-screenshot.sh 2

# Capture Chapter 7 screenshots (Terminal - 5 screenshots)
./auto-screenshot.sh 7

# Capture ALL chapters at once (41 screenshots)
./auto-screenshot.sh all
```

### 3. Get Hardware Images (Manual)

For Chapter 1's hardware images, follow the guide:
```bash
# Read the guide
cat HARDWARE-IMAGES-GUIDE.md

# Or open it in a browser
firefox HARDWARE-IMAGES-GUIDE.md
```

---

## What Gets Automated? ✅

The script **automatically captures 41 out of 51 screenshots**:

| Chapter | Automated | Manual | Total |
|---------|-----------|--------|-------|
| Chapter 1 | 0 | 5 | 5 (hardware photos) |
| Chapter 2 | 12 | 2 | 14 |
| Chapter 3 | 6 | 0 | 6 |
| Chapter 4 | 10 | 2 | 12 |
| Chapter 5 | 3 | 2 | 5 |
| Chapter 6 | 10 | 1 | 11 |
| Chapter 7 | 5 | 0 | 5 |
| Chapter 8 | 3 | 2 | 5 |
| **Total** | **41** | **10** | **51** |

---

## Manual Screenshots Needed 🖐️

Some screenshots require manual intervention:

### Chapter 1 (5 manual - hardware photos)
- All 5 need to be found online or photographed
- See: `HARDWARE-IMAGES-GUIDE.md`

### Chapter 2 (2 manual)
- **New Folder dialog**: Script will pause for you to right-click and trigger it
- **Window controls annotated**: Need to add arrows and labels in image editor

### Chapter 4 (2 manual)
- **OpenShot timeline**: Need to manually add clips first
- **Save dialog**: Script triggers it, just verify it captured correctly

### Chapter 5 (2 manual)
- **Installation progress**: Need to actually start installing an app
- **Remove button**: Find an installed app and screenshot its page

### Chapter 6 (1 manual)
- **Light/Dark mode comparison**: Need to create side-by-side composite image

### Chapter 8 (2 manual)
- **No WiFi icon**: Disconnect network first, then screenshot
- **Error dialog**: Trigger a safe error manually
- **Open With dialog**: Right-click a file and screenshot

---

## How the Script Works 🛠️

The automation script uses:
- **xdotool**: Simulates keyboard and mouse input
- **wmctrl**: Manages windows
- **gnome-screenshot**: Captures screenshots

**Process for each screenshot**:
1. Opens the application using Activities search
2. Waits for app to load
3. Navigates to the right view
4. Captures the window
5. Saves with descriptive filename
6. Closes the app and moves to next

---

## Troubleshooting 🔧

### Script Fails with "command not found"
```bash
# Install missing dependencies
sudo apt install xdotool wmctrl gnome-screenshot
```

### Screenshots are blank or wrong window
- Script might be too fast for your VM
- Edit delays in script:
  ```bash
  # Increase these values at the top of auto-screenshot.sh
  DELAY_SHORT=2      # 1 → 2 seconds
  DELAY_MEDIUM=3     # 2 → 3 seconds
  DELAY_LONG=4       # 3 → 4 seconds
  ```

### Application doesn't open
- Verify app is installed
- Try opening it manually first to see actual app name
- Check script uses correct search term for Activities

### Screenshots have personal information
- Use a fresh Ubuntu VM or clean user account
- Clear browser history before Firefox screenshots
- Remove personal files from Documents/Downloads

### Window not found errors
```bash
# List all windows to debug
wmctrl -l

# Test xdotool can find app
xdotool search --name "Firefox"
```

---

## Tips for Best Results 💡

### Before Running Script:

1. **Clean VM state**:
   ```bash
   # Close all windows
   wmctrl -c :ACTIVE:
   ```

2. **Default appearance**:
   - Use default Ubuntu wallpaper
   - Use default theme (no custom themes)
   - Set to Light mode (unless capturing Dark mode)

3. **Screen resolution**:
   - 1920x1080 recommended
   - Adjust in Settings > Displays

4. **Disable screensaver**:
   - Settings > Privacy > Screen Lock > Blank Screen Delay: Never

### While Running Script:

1. **Don't touch keyboard/mouse** - Let automation run
2. **Watch for prompts** - Some screenshots need manual trigger
3. **Have patience** - Takes 15-20 minutes for all chapters

### After Running Script:

1. **Review all screenshots**:
   ```bash
   cd ../images/screenshots
   ls -lh
   ```

2. **Check quality**:
   - Are windows fully visible?
   - Is text readable?
   - Any personal info visible?

3. **Retry failed ones**:
   ```bash
   # Rerun just one chapter
   ./auto-screenshot.sh 2
   ```

---

## Customization 🎨

### Change Screenshot Format
Edit script line:
```bash
# Change from PNG to JPG
gnome-screenshot -w -f "$SCREENSHOT_DIR/$filename.jpg"
```

### Add Delays for Slow VM
Edit at top of script:
```bash
DELAY_SHORT=2   # Increase from 1
DELAY_MEDIUM=4  # Increase from 2
DELAY_LONG=6    # Increase from 3
```

### Change Screenshot Directory
Edit at top of script:
```bash
SCREENSHOT_DIR="/path/to/your/directory"
```

### Add New Screenshot
Follow the pattern in script:
```bash
# Open app
open_app "App Name"
sleep $DELAY_MEDIUM

# Take screenshot
take_screenshot "chapter##-name.png" "Window Title"

# Close app
close_window
```

---

## Time Estimates ⏱️

**Automated screenshots** (running script):
- Chapter 2: ~3 minutes
- Chapter 3: ~2 minutes
- Chapter 4: ~5 minutes (if apps installed)
- Chapter 5: ~1 minute
- Chapter 6: ~4 minutes
- Chapter 7: ~2 minutes
- Chapter 8: ~1 minute
- **All chapters: ~15-20 minutes**

**Manual screenshots**:
- Chapter 1 hardware images: 1-1.5 hours (finding online)
- Other manual screenshots: 15-30 minutes
- **Total manual time: ~2 hours**

**Grand total: 2.5 hours** for all 51 screenshots

Compare to manual: **4-6 hours** (from original guide)

**Time saved: 1.5-3.5 hours!** 🎉

---

## File Structure

```
scripts/
├── README.md                    # This file
├── auto-screenshot.sh          # Main automation script
├── HARDWARE-IMAGES-GUIDE.md    # Guide for finding hardware images
└── [future scripts]

../images/screenshots/           # Where screenshots are saved
├── chapter02-clean-desktop.png
├── chapter02-applications-menu.png
├── chapter03-firefox-window.png
└── ...
```

---

## Advanced: Running from Windows Host

Since you're running Ubuntu in VirtualBox on Windows, you can:

### Option 1: Run script inside VM (recommended)
1. SSH into VM or use VM console
2. Run script as normal
3. Screenshots saved in VM shared folder
4. Access from Windows through shared folder

### Option 2: VBoxManage screenshots
```cmd
REM From Windows host (PowerShell)
VBoxManage controlvm "Ubuntu VM Name" screenshotpng "C:\path\to\screenshot.png"
```

### Option 3: Automate with scheduled task
Run script on VM boot automatically:
```bash
# Add to crontab in VM
@reboot sleep 30 && /path/to/auto-screenshot.sh all
```

---

## Contributing 🤝

Found a bug or want to improve the script?

1. Test your changes
2. Update this README if needed
3. Add comments to code
4. Note any new dependencies

---

## License

Same as the main book project.

---

**Happy screenshotting!** 📸✨

If you have questions or issues, review the Troubleshooting section above or check the main project documentation.
