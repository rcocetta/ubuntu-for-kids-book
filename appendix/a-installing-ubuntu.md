# Appendix A: Installing Ubuntu

**Note:** Installing an operating system is an advanced task. Ask an adult for help with this!

## Before You Install

### What You Need

- A computer (laptop or desktop)
- At least 4 GB of RAM (8 GB or more is better)
- At least 25 GB of free disk space (more is better)
- A USB drive (at least 4 GB)
- Internet connection
- Patience! This takes 30-60 minutes

### Important Questions

**Do you want to keep Windows?**

You have three options:

1. **Dual Boot:** Keep Windows AND Ubuntu (choose at startup)
2. **Replace Windows:** Delete Windows, use only Ubuntu
3. **Try Ubuntu first:** Use it without installing (slower)

**Ask an adult before deleting Windows!** Many people prefer dual boot.

## Getting Ubuntu

### Step 1: Download Ubuntu

1. Go to `ubuntu.com/download/desktop`
2. Click the download button for the latest LTS version
3. Wait for the large file to download (about 3-5 GB)

![Screenshot Placeholder: Ubuntu download page]

**LTS means Long Term Support** - it gets updates for 5 years!

### Step 2: Create Installation USB

You need to put Ubuntu on a USB drive so you can install it.

**On Windows:**
1. Download Rufus from `rufus.ie`
2. Insert your USB drive
3. Open Rufus
4. Select your USB drive
5. Click "Select" and choose the Ubuntu file you downloaded
6. Click "Start"
7. Wait for it to finish

**On another Ubuntu computer:**
1. Insert USB drive
2. Open "Startup Disk Creator" (search in Applications)
3. Select the Ubuntu ISO file
4. Select your USB drive
5. Click "Make Startup Disk"
6. Wait for it to finish

**Warning:** This will erase everything on the USB drive!

## Installing Ubuntu

### Step 1: Boot from USB

1. Insert the Ubuntu USB drive
2. Restart your computer
3. During startup, press the boot menu key:
   - Usually F12, F2, F10, or Esc
   - It depends on your computer brand
   - Watch the screen for instructions during startup
4. Choose "Boot from USB" or your USB drive name
5. Wait for Ubuntu to load

![Screenshot Placeholder: Boot menu]

### Step 2: Try or Install?

You'll see two options:

**Try Ubuntu:** Test it without installing
- Nothing is changed on your computer
- Runs slower than when installed
- Good for making sure everything works
- No changes are saved when you restart

**Install Ubuntu:** Put it on your computer
- Makes permanent changes
- Runs at full speed
- This is what you want eventually

**Recommendation:** Try it first to make sure:
- Wi-Fi works
- Screen resolution is good
- Keyboard and mouse work
- Everything seems to function

### Step 3: Start the Installer

1. Click "Install Ubuntu" on the desktop
2. Choose your language
3. Choose your keyboard layout
4. Click "Continue"

![Screenshot Placeholder: Language selection]

### Step 4: Updates and Software

Choose what to install:

**Normal installation:**
- Includes web browser, office suite, games, media players
- Recommended for most people

**Minimal installation:**
- Just basic stuff
- You add what you want later
- Smaller, faster

**Download updates while installing:** Check this if you have good internet

**Install third-party software:** Check this for better hardware support

### Step 5: Installation Type

**This is the important part!**

**Erase disk and install Ubuntu:**
- Deletes everything and installs only Ubuntu
- **Warning:** All your files will be deleted!
- Only choose this if you've backed up everything or don't care about what's on the computer

**Install Ubuntu alongside Windows:**
- Dual boot option
- Keep Windows AND install Ubuntu
- Choose which OS at startup
- Both operating systems share the hard drive

**Something else:**
- Advanced option for manual partitioning
- Only for experienced users

**Ask an adult which option to choose!**

### Step 6: Choose Your Location

Click your location on the map or type your city.

This sets:
- Time zone
- Regional formats
- Download servers

### Step 7: Create Your Account

Fill in:
- Your name
- Computer name (can be anything)
- Username (no spaces or special characters)
- Password (make it strong!)
- Confirm password

**Important:** Remember your password! Write it down somewhere safe.

Choose:
- **Log in automatically:** Computer starts without asking for password
- **Require password to log in:** More secure (recommended)

### Step 8: Wait for Installation

Now Ubuntu installs! This takes 15-30 minutes.

You'll see:
- Progress bar
- Slideshow explaining Ubuntu features
- Estimated time remaining

**Don't:**
- Unplug the computer
- Remove the USB drive yet
- Turn off the computer

Go grab a snack!

### Step 9: Restart

When installation finishes:
1. Click "Restart Now"
2. Remove the USB drive when prompted
3. Press Enter
4. Wait for Ubuntu to start

**Congratulations! You installed Ubuntu!**

## First Steps After Installing

### 1. Update Everything

```bash
sudo apt update
sudo apt upgrade
```

This gets all the latest updates and security patches.

### 2. Install Drivers

Settings > Additional Drivers

If you have an NVIDIA graphics card or other special hardware, install the recommended drivers.

### 3. Set Up Software Center

Open Ubuntu Software and browse around. Install programs you need!

### 4. Customize

Follow Chapter 6 to make Ubuntu yours!

### 5. Install Useful Software

Consider installing:
- Google Chrome or Chromium
- VLC media player
- GIMP
- Audacity
- Your favorite programs!

## Dual Boot: Choosing Your OS

If you installed Ubuntu alongside Windows, you'll see a menu at startup:

- **Ubuntu** - The default choice (auto-selected after 10 seconds)
- **Windows Boot Manager** - For starting Windows

Use arrow keys to select, press Enter to boot.

### Changing the Default OS

Want Windows or Ubuntu to be the default?

1. Install Grub Customizer:
```bash
sudo apt install grub-customizer
```

2. Open Grub Customizer
3. Move your preferred OS to the top
4. Save
5. Next boot, that OS will be the default

## Troubleshooting Installation

### Problem: Won't boot from USB

**Solution:**
- Disable Secure Boot in BIOS
- Try a different USB port
- Make sure USB was created correctly
- Try a different USB drive

### Problem: Wireless doesn't work

**Solution:**
- Connect with ethernet cable temporarily
- Install updates - they often include wireless drivers
- Settings > Additional Drivers > Install wireless driver

### Problem: Screen resolution is wrong

**Solution:**
- Settings > Displays > Resolution
- Install graphics drivers
- Restart after installing drivers

### Problem: Forgot to back up files

**Solution:**
- If you haven't finished installing yet, you can stop
- If you already installed over everything... they're gone
- **This is why backing up is important!**

## Making Installation Easier

### Virtual Machine (Practice First!)

Want to try Ubuntu without installing it permanently?

**Virtual Machine** lets you run Ubuntu inside Windows:

1. Download VirtualBox (free)
2. Create a new virtual machine
3. Install Ubuntu in the virtual machine
4. Practice safely!

This is perfect for:
- Learning before installing for real
- Testing if your favorite programs work
- Making sure you like Ubuntu

### Live USB (Try It Without Installing)

You can use Ubuntu from the USB drive without installing!

Advantages:
- No changes to your computer
- Test before installing
- Use Ubuntu on any computer

Disadvantages:
- Slower than installed Ubuntu
- Changes aren't saved when you restart
- USB must stay plugged in

## Should You Install Ubuntu?

**Good reasons to install:**
- You want to learn Linux
- Your computer is old and Windows is slow
- You like free, open-source software
- You want more control over your computer
- You're interested in programming or tech

**Maybe wait if:**
- You have specific programs that only work on Windows
- You're not comfortable with computers yet
- You need features only Windows has
- You have important files and no backup

**You can always:**
- Try Ubuntu in a virtual machine first
- Run it from USB drive without installing
- Dual boot so you keep Windows too
- Ask someone experienced for help

## Resources

**Official Ubuntu Help:**
- help.ubuntu.com
- ubuntu.com/tutorials

**Community Help:**
- Ubuntu Forums: ubuntuforums.org
- Ask Ubuntu: askubuntu.com
- Reddit: r/Ubuntu

**Video Tutorials:**
Search YouTube for "how to install Ubuntu [your computer brand]"

## What You Learned

- Ubuntu installation requires a **USB drive** and the **Ubuntu ISO file**
- You can **try Ubuntu** before installing it
- **Dual boot** lets you keep Windows and Ubuntu
- Installation takes **30-60 minutes**
- **Always back up** important files first
- After installing, **update everything** immediately
- **Drivers** for special hardware may be needed
- Help is available from the **Ubuntu community**

---

Installing Ubuntu is a big step, but thousands of people do it every day. Take your time, ask for help when needed, and enjoy your new operating system!

[Continue to Appendix B →](b-open-source.md) | [Back to Chapter 8](../chapters/08-when-things-go-wrong.md)
