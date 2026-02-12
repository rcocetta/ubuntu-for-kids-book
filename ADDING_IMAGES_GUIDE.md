# Guide: Adding Creative Commons Images to the Book

This guide helps you find and add Creative Commons (CC) images to replace the placeholders throughout the book.

## Where to Find CC Images

### Best Free Image Sources

**1. Wikimedia Commons** (https://commons.wikimedia.org)
- Huge collection of free images
- All properly licensed (CC-BY, CC0, Public Domain)
- Great for: Ubuntu screenshots, hardware photos, diagrams
- Search: "Ubuntu desktop", "computer hardware", "CPU diagram"

**2. Pixabay** (https://pixabay.com)
- All CC0 (public domain)
- No attribution required
- Great for: Hardware photos, technology images
- Search: "computer", "RAM", "SSD", "keyboard"

**3. Pexels** (https://www.pexels.com)
- Free to use, CC0-style
- High quality photos
- Great for: Modern hardware, workspace photos
- Search: "computer hardware", "laptop", "technology"

**4. Unsplash** (https://unsplash.com)
- Free high-resolution photos
- Unsplash license (very permissive)
- Great for: Professional-looking hardware shots

**5. SVG Silh** (https://svgsilh.com)
- All CC0 vector graphics
- Perfect for: Simple diagrams and icons
- Search: "CPU", "computer", "network"
- Can be colored/edited as needed

## Image Needs by Chapter

### Chapter 1: What Is a Computer?

**CPU Diagram:**
- Search Wikimedia: "CPU diagram" or "processor diagram"
- Or SVG Silh: "CPU icon"
- CC0 Option: https://svgsilh.com/image/152656.html

**RAM Stick:**
- Pixabay: Search "RAM memory"
- Wikimedia: Search "Computer RAM"

**Hard Drive / SSD:**
- Pixabay: "hard drive" and "SSD"
- Wikimedia: "Hard disk drive" and "Solid state drive"

**Keyboard and Mouse:**
- Any of the above sites: "keyboard" "computer mouse"

**Monitor:**
- Search: "computer monitor" or "display screen"

### Chapter 2: Meet Ubuntu

**Ubuntu Desktop Screenshot:**
- Wikimedia Commons: "Ubuntu desktop screenshot"
- Category: https://commons.wikimedia.org/wiki/Category:Screenshots_of_Ubuntu
- **Best option:** Take your own screenshot! (It's your son's actual setup)

**Files Application:**
- Screenshot from Ubuntu itself (Press PrtScn)

**Applications Menu:**
- Screenshot from Ubuntu

### Chapter 3: The Internet

**Network Diagram:**
- SVG Silh: "network" or "internet"
- Wikimedia: "Computer network diagram"

**Firefox Browser:**
- Screenshot from your Ubuntu system
- Or Wikimedia: "Firefox screenshot"

### Chapter 4: Creating Things

**LibreOffice, GIMP, etc.:**
- **Best option:** Screenshot these apps from Ubuntu
- They're open source, so screenshots are allowed
- Shows the actual interface kids will see

### Chapters 5-8

**Software Center, Terminal, Settings:**
- Take screenshots directly from Ubuntu
- These are part of Ubuntu (open source)
- Shows exact interface for the version you're using

## How to Add Images

### Step 1: Download Images

1. Find image on one of the sites above
2. Check the license (CC0, CC-BY, or Public Domain)
3. Download high resolution version
4. Save to appropriate folder:
   - `images/screenshots/` for Ubuntu screenshots
   - `images/illustrations/` for diagrams and icons

### Step 2: Name Files Clearly

Use descriptive names:
- `cpu-diagram.svg` or `cpu-diagram.png`
- `ram-memory-stick.jpg`
- `ubuntu-desktop-24-04.png`
- `firefox-browser-window.png`
- `files-app-screenshot.png`

### Step 3: Update Markdown Files

Find placeholders like:
```markdown
![Screenshot Placeholder: Ubuntu desktop]
```

Replace with:
```markdown
![Ubuntu Desktop showing the main interface](../images/screenshots/ubuntu-desktop-24-04.png)
```

### Step 4: Add Attribution (if needed)

For CC-BY images (not CC0), add attribution at the end of the chapter:

```markdown
---

**Image Credits:**
- CPU diagram by [Author Name], CC-BY 4.0, via Wikimedia Commons
- RAM photo by [Photographer], CC0, via Pixabay
```

## Quick Reference: License Types

**CC0 (Public Domain):**
- ✅ Use freely
- ✅ No attribution required
- ✅ Modify as needed
- Examples: Pixabay, Pexels, SVG Silh

**CC-BY (Attribution):**
- ✅ Use freely
- ⚠️ Must credit creator
- ✅ Modify as needed
- Examples: Many Wikimedia images

**Ubuntu Screenshots:**
- Ubuntu is GPL/open source
- Screenshots are allowed
- No special attribution needed
- Just note "Ubuntu screenshot"

## Automated Screenshot Option

If you want to automate Ubuntu screenshots:

1. Set up Ubuntu in VirtualBox or similar
2. Use Python + pyautogui to navigate and capture
3. Or use your Claude in Chrome tools with VNC
4. Save all screenshots at once

## Simple Diagrams You Can Create

For simple concept diagrams, you can:

1. **Use draw.io** (free, runs in browser)
   - Create clean diagrams
   - Export as PNG or SVG
   - Your own work = your license

2. **Use Inkscape** (free, on Ubuntu)
   - Professional vector graphics
   - Create custom diagrams
   - Export in any format

3. **Use LibreOffice Draw**
   - Already installed on Ubuntu
   - Simple diagrams and flowcharts
   - Export as PNG

## Priority Order

If you're short on time, prioritize these images:

1. **Ubuntu Desktop** (Ch 2) - Most important for kids to recognize
2. **Applications Menu** (Ch 2) - Core navigation
3. **Files App** (Ch 2) - File management basics
4. **Firefox Browser** (Ch 3) - Internet chapter
5. **Terminal** (Ch 7) - The "superpower" chapter
6. **Hardware photos** (Ch 1) - Help kids understand components

The book is readable and usable with placeholders, but real images make it much better!

## Tools for Batch Processing

If you're adding many images:

```bash
# Optimize PNGs (reduce file size)
sudo apt install optipng
find images/ -name "*.png" -exec optipng {} \;

# Convert all JPGs to PNGs
sudo apt install imagemagick
find images/ -name "*.jpg" -exec convert {} {}.png \;

# Resize all images to max 1200px width
find images/ -name "*.png" -exec convert {} -resize 1200x\> {} \;
```

## Final Notes

- Don't stress about perfect images - clear and functional is better than perfect
- Your son's actual Ubuntu screenshots might be the best option (shows HIS computer)
- You can always update images later based on feedback
- Start with the most important chapters (2, 4, 5, 7)

---

**Sources for finding CC images:**
- [Wikimedia Commons](https://commons.wikimedia.org) - Largest free media repository
- [Pixabay](https://pixabay.com) - CC0 images
- [Pexels](https://www.pexels.com) - Free high-quality photos
- [SVG Silh](https://svgsilh.com) - CC0 vector graphics
- [Unsplash](https://unsplash.com) - Professional photography
