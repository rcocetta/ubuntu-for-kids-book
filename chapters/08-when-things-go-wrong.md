# Chapter 8: When Things Go Wrong

Computers are amazing, but sometimes they don't work the way you expect. Don't panic! This chapter teaches you how to solve problems like a pro.

## The Most Important Rule

**DON'T PANIC!**

Seriously. Computer problems are almost never as bad as they seem. Most issues can be fixed in a few minutes, and you rarely break anything permanently.

Remember:
- Your computer won't explode
- You probably won't lose your data
- There's almost always a solution
- Other people have probably had the same problem

## The Troubleshooting Mindset

**Good troubleshooters:**
- Stay calm
- Read error messages carefully
- Try simple solutions first
- Search for help online
- Ask others for help when needed

**Bad troubleshooters:**
- Panic and click randomly
- Ignore error messages
- Give up immediately
- Don't try to understand the problem

**You're going to be a GOOD troubleshooter!**

## Common Problems and Solutions

Let's look at problems you're likely to face and how to solve them.

### Problem 1: The Internet Isn't Working

![Screenshot Placeholder: Network icon showing no connection]

**Symptoms:**
- Websites won't load
- Can't connect to Wi-Fi
- Network icon shows disconnected

**Solutions to try (in order):**

**Step 1: Check the obvious stuff**
- Is Wi-Fi turned on? (Check the network icon in top-right)
- Are you trying to connect to the right network?
- Do you know the Wi-Fi password?

**Step 2: Restart Wi-Fi**
1. Click the network icon
2. Turn Wi-Fi off
3. Wait 5 seconds
4. Turn Wi-Fi back on
5. Reconnect to your network

**Step 3: Restart the router**
- Unplug your Wi-Fi router
- Wait 30 seconds
- Plug it back in
- Wait 2 minutes for it to fully start
- Try connecting again

**Step 4: Restart your computer**
Sometimes this is all it takes!

**Step 5: Check if others can connect**
- Can other devices connect to the same Wi-Fi?
- If not, the problem is the router, not your computer
- If yes, the problem is your computer's settings

**Still not working?** See "How to Search for Solutions" below.

### Problem 2: A Program Won't Open or Keeps Crashing

![Screenshot Placeholder: Error dialog]

**Symptoms:**
- Program won't start
- Program crashes immediately
- Program freezes

**Solutions to try:**

**Step 1: Close and try again**
- Click the X to close (or Alt + F4)
- Wait a moment
- Open the program again

**Step 2: Force quit if it's frozen**
1. Press `Ctrl + Alt + Delete` or open System Monitor
2. Find the frozen program
3. Click "End Process"
4. Try opening it again

**Step 3: Restart your computer**
This fixes more problems than you'd think!

**Step 4: Check for updates**
1. Open Ubuntu Software Center
2. Click "Updates"
3. Install any available updates
4. Try the program again

**Step 5: Reinstall the program**
1. Remove the program (Software Center > Installed > Remove)
2. Restart your computer
3. Install the program again
4. Try it again

**Step 6: Check system resources**
Maybe your computer is running out of memory:

1. Open System Monitor (search for it)
2. Look at CPU and RAM usage
3. If they're at 100%, close some programs
4. Try your program again

![Screenshot Placeholder: System Monitor showing resources]

### Problem 3: The Computer Is Really Slow

**Symptoms:**
- Everything takes forever to open
- Mouse movement is laggy
- Programs freeze a lot

**Solutions to try:**

**Step 1: Close unnecessary programs**
1. Look at the top bar - see what's running
2. Close programs you're not using
3. Some programs keep running in the background

**Step 2: Restart your computer**
Fresh start = faster computer!

**Step 3: Check what's using resources**
1. Open System Monitor
2. Click the "Processes" tab
3. Look for programs using lots of CPU or memory
4. Select them and click "End Process" if you don't need them

**Step 4: Free up disk space**
1. Open Files
2. Look in Downloads folder - delete old downloads
3. Empty the Trash
4. Remove programs you don't use

**Step 5: Check for malware** (rare on Ubuntu, but possible)
```bash
sudo apt install clamav
sudo freshclam
clamscan -r /home/yourusername
```

This scans for viruses and malware.

**Long-term solutions:**
- Don't install programs you don't need
- Update regularly
- Restart at least once a week
- Keep disk space free (at least 20% empty)

### Problem 4: Sound Isn't Working

**Symptoms:**
- No sound from speakers or headphones
- Volume control doesn't work
- Sound is distorted

**Solutions to try:**

**Step 1: Check the obvious**
- Is volume turned up? (Click volume icon)
- Are headphones plugged in properly?
- Are external speakers powered on?

**Step 2: Check output device**
1. Click volume icon > Settings
2. Go to Sound settings
3. Make sure the right output device is selected
4. Try adjusting the volume slider

![Screenshot Placeholder: Sound settings]

**Step 3: Test with different programs**
- Try playing sound in different programs
- If it works in one but not another, it's that program's settings

**Step 4: Restart your computer**
Fixes audio issues surprisingly often!

**Step 5: Check if the device is muted**
```bash
alsamixer
```

Use arrow keys to navigate, M to unmute. Press Esc to exit.

### Problem 5: File Won't Open

**Symptoms:**
- Double-clicking does nothing
- Error says "no application found"
- File opens in the wrong program

**Solutions to try:**

**Step 1: Check the file type**
- Right-click the file
- Choose "Properties"
- Look at the file type

**Step 2: Install the right program**
- .pdf files need a PDF reader
- .mp4 files need a video player
- .odt files need LibreOffice
- .jpg files need an image viewer

**Step 3: Choose which program to use**
- Right-click the file
- Choose "Open With..."
- Select the program you want
- Check "Set as default" to always use that program

![Screenshot Placeholder: Open With dialog]

**Step 4: File might be corrupted**
- Try opening a different file
- If only one file won't open, it might be damaged
- Do you have a backup?

### Problem 6: Can't Install Software

**Symptoms:**
- Install button is grayed out
- Error message during installation
- Package manager won't work

**Solutions to try:**

**Step 1: Update package lists**
```bash
sudo apt update
```

**Step 2: Fix broken packages**
```bash
sudo apt --fix-broken install
```

**Step 3: Try installing from Terminal**
```bash
sudo apt install package-name
```

Read any error messages carefully - they often tell you exactly what's wrong!

**Step 4: Check disk space**
```bash
df -h
```

If your disk is full, you can't install more software. Delete things you don't need.

**Step 5: Check internet connection**
You need to be online to install most software.

### Problem 7: Forgot Password

**This is serious but fixable.**

**If you remember ANY password for the computer:**
1. Boot into recovery mode
2. Open a root shell
3. Reset your user password

*This is advanced - ask an adult for help with this one.*

**If you have NO passwords:**
- You might need to reinstall Ubuntu
- This is why backups are important!

## How to Read Error Messages

Error messages look scary, but they're actually helpful! They tell you what went wrong.

**Example error:**
```
Error: Could not open file '/home/user/document.txt'
Permission denied
```

**How to read it:**
1. **What happened:** "Could not open file"
2. **Which file:** "document.txt"
3. **Why:** "Permission denied" - you don't have permission to access it

**Now you know exactly what's wrong!** You can search for "Ubuntu permission denied error" or ask someone "How do I fix file permissions?"

**Tips for reading errors:**
- Read the WHOLE message, not just the first line
- Look for keywords: "permission," "not found," "failed," "connection"
- Copy the exact error message for searching online
- Don't ignore numbers - they're often error codes you can look up

## How to Search for Solutions

**Google is your friend!** Here's how to search effectively:

### Good Search Strategies

**Include "Ubuntu" in your search:**
- Good: "Ubuntu Firefox won't open"
- Bad: "Firefox won't open" (might get Windows solutions)

**Include version if relevant:**
- "Ubuntu 24.04 sound not working"

**Use the exact error message:**
- Copy and paste the error in quotes
- "Ubuntu 'Could not mount device' error"

**Search multiple sources:**
- Ubuntu Forums
- Ask Ubuntu (Stack Exchange site)
- Reddit r/Ubuntu
- Official Ubuntu documentation

### Evaluating Solutions

**Good signs:**
- Recent posts (within the last year)
- Multiple people confirm it worked
- Clear step-by-step instructions
- Explains WHAT it's doing, not just commands to copy

**Warning signs:**
- Very old posts (technology changes!)
- Says "just run this script" without explanation
- Tells you to download random files
- Requires disabling security features

**Safety tip:** If a solution involves Terminal commands you don't understand, research what they do BEFORE running them!

## When to Ask for Help

Sometimes you need human help. That's okay! Here's when and how to ask:

### When to Ask

- You've tried everything in this chapter
- The problem is getting worse
- You don't understand the solutions you found online
- The fix seems too advanced or risky
- It involves hardware (broken screen, keyboard issues)

### Who to Ask

1. **Parents or guardians** - They probably know more than you think
2. **Tech-savvy friends** - Know someone good with computers?
3. **Teachers** - Especially if it's school-related
4. **Online communities** - Ubuntu Forums, Ask Ubuntu
5. **Local Linux user groups** - Many cities have them!

### How to Ask for Help

**Good help requests include:**

1. **What you were trying to do**
   - "I was trying to install SuperTux"

2. **What happened instead**
   - "It gave me an error message"

3. **The exact error message**
   - Copy and paste or take a screenshot

4. **What you've tried**
   - "I already restarted and updated my system"

5. **Your system info**
   - Ubuntu version, computer model if relevant

**Example good help request:**

"I'm trying to install SuperTux on Ubuntu 24.04 using the Software Center, but I get an error that says 'Package has unmet dependencies.' I already ran 'sudo apt update' and restarted my computer. What should I try next?"

**Example bad help request:**

"help!!! my computer is broken and nothing works!!!"

The first one gives people the information they need to help you. The second one doesn't.

## Preventing Problems

**Prevention is easier than fixing!**

### Good Computer Habits

**1. Update regularly**
- Check for updates once a week
- Install them when prompted

**2. Restart occasionally**
- At least once a week
- More often if you install new software

**3. Save your work frequently**
- Press Ctrl + S often!
- Don't lose hours of work to a crash

**4. Organize your files**
- Know where things are
- Makes problems easier to diagnose

**5. Don't install random stuff**
- Only install software from trusted sources
- Ubuntu Software Center is safe

**6. Keep backups**
- Copy important files to USB drive or cloud
- Can't break what you have backed up!

**7. Learn from mistakes**
- If something went wrong, understand why
- Don't make the same mistake twice

### Warning Signs to Watch For

Pay attention to these early warning signs:

- Computer getting noticeably slower
- Programs crashing more often
- Weird error messages appearing
- Disk space running low
- Strange sounds from the computer (hardware issue!)

**Fix small problems before they become big problems!**

## The Ultimate Troubleshooting Flowchart

```
Problem occurs
      ↓
Have you tried turning it off and on again?
      ↓ No          ↓ Yes
   Do that    →   Did it fix it?
                     ↓ Yes        ↓ No
                   Done!    →  Read the error message
                                      ↓
                              Understand the error?
                                ↓ Yes        ↓ No
                            Try to fix  → Search online
                                ↓              ↓
                            Fixed?         Found solution?
                              ↓ Yes  ↓ No    ↓ Yes  ↓ No
                            Done!  ↘  ↙    Try it  → Ask for help
                                     ↓             ↓
                                Ask for help   Fixed?
                                              ↓ Yes  ↓ No
                                            Done! → Ask for help
```

## Emergency Commands

Keep these Terminal commands handy for emergencies:

**Update everything:**
```bash
sudo apt update && sudo apt upgrade
```

**Fix broken packages:**
```bash
sudo apt --fix-broken install
```

**Free up space (clean cache):**
```bash
sudo apt clean
sudo apt autoremove
```

**Check disk space:**
```bash
df -h
```

**See what's using resources:**
```bash
top
```
(Press Q to quit)

**Restart networking:**
```bash
sudo systemctl restart NetworkManager
```

**Force quit everything (last resort!):**
- Press `Ctrl + Alt + F2`
- Log in
- Type: `reboot`

## What You Learned

- **Stay calm** - most problems have simple solutions
- Try **simple fixes first** (restart, check connections)
- **Read error messages** carefully - they tell you what's wrong
- **Search online** effectively with good keywords
- Know **when and how to ask for help**
- **Prevent problems** with good computer habits
- Use **Terminal commands** for advanced troubleshooting
- Keep emergency commands handy
- Most issues are **fixable** with patience and persistence

## Challenge Activities

**Easy:**
1. Practice force-quitting a program using System Monitor
2. Check your disk space and free up room if needed
3. Update your system and install any pending updates

**Medium:**
1. Intentionally disconnect from Wi-Fi and practice reconnecting
2. Find and bookmark 3 good Ubuntu help resources online
3. Learn one new troubleshooting Terminal command
4. Help someone else with a computer problem

**Hard:**
1. Document a problem you had, how you diagnosed it, and how you fixed it
2. Create a text file with your most-used troubleshooting steps
3. Practice searching for solutions to hypothetical problems
4. Set up a backup system for your important files
5. Teach someone else 5 troubleshooting techniques

**Expert Challenge:**

**Become the Problem Solver:**

1. Help three different people with computer problems
2. For each problem, document:
   - What was wrong
   - How you diagnosed it
   - What you tried
   - What finally worked
3. Create your own "Top 10 Ubuntu Troubleshooting Tips" guide
4. Share it with someone who might find it useful

**Remember:** Every problem you solve makes you better at solving the next one. You're building skills that last a lifetime!

---

**What's Next:** You've learned EVERYTHING in the main chapters! Check out the Appendix for bonus information about installing Ubuntu, understanding open source, and exploring other Linux distributions.

[← Back to Chapter 7](07-the-terminal.md) | [Continue to Appendix →](../appendix/a-installing-ubuntu.md)
