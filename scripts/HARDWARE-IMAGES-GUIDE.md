# Hardware Images Guide 🖼️

These images can't be screenshotted - they need to be found online or photographed. Here are the best sources and search terms for CC-licensed images.

## Chapter 1: Hardware Photos (5 images needed)

### 1. CPU (Processor Chip)
**File**: `chapter01-cpu-diagram.png`

**Best Sources**:
- **Wikimedia Commons** (best for hardware): https://commons.wikimedia.org
- **Unsplash**: https://unsplash.com
- **Pixabay**: https://pixabay.com

**Search Terms**:
- "CPU chip"
- "Intel processor"
- "AMD processor"
- "computer processor"

**Recommended Images**:
- https://commons.wikimedia.org/wiki/File:Intel_CPU_Core_i7_2600K_Sandy_Bridge_top.jpg
- https://commons.wikimedia.org/wiki/File:AMD_Ryzen_7_1800X.jpg

**What to look for**:
- Clear view of the chip top
- Brand logo visible (Intel/AMD)
- Close-up, well-lit
- Square chip shape obvious

---

### 2. RAM Stick
**File**: `chapter01-ram-stick.png`

**Search Terms**:
- "RAM memory stick"
- "DDR4 RAM"
- "computer memory module"

**Recommended Images**:
- https://commons.wikimedia.org/wiki/File:Desktop_DDR4_DIMM.png
- https://commons.wikimedia.org/wiki/File:Two_DDR3_SO-DIMMs.jpg

**What to look for**:
- Full RAM stick visible
- Green PCB (circuit board)
- Memory chips visible
- Clean background

---

### 3. Hard Drive and SSD Comparison
**File**: `chapter01-storage-drives.png`

**Search Terms**:
- "HDD vs SSD"
- "hard drive comparison"
- "SSD and HDD side by side"

**Recommended Images**:
- https://commons.wikimedia.org/wiki/File:Laptop-hard-drive-exposed.jpg (HDD)
- https://commons.wikimedia.org/wiki/File:Samsung_850_PRO.jpg (SSD)

**What to look for**:
- Both drives in one image OR combine two images side-by-side
- Size difference visible (HDD thicker)
- Labels/annotations helpful

**DIY Option**: If you have both, photograph them together!

---

### 4. Keyboard and Mouse
**File**: `chapter01-keyboard-mouse.png`

**Search Terms**:
- "keyboard and mouse"
- "computer keyboard mouse desk"
- "input devices"

**Recommended Images**:
- https://unsplash.com/s/photos/keyboard-mouse
- https://pixabay.com/photos/search/keyboard%20mouse/

**What to look for**:
- Both devices visible together
- Clean, modern appearance
- Good lighting
- Not too "gamer-y" unless that's your audience

**DIY Option**: Easy to photograph yourself - just place them on a clean desk!

---

### 5. Monitor and Speakers
**File**: `chapter01-monitor-speakers.png`

**Search Terms**:
- "computer monitor"
- "desktop computer setup"
- "monitor with speakers"

**Recommended Images**:
- https://unsplash.com/s/photos/computer-monitor
- https://pixabay.com/photos/search/desktop%20computer/

**What to look for**:
- Monitor displaying something (not black screen)
- Speakers visible (either built-in or external)
- Clean desk setup
- Not too "professional studio" - keep it relatable for kids

**DIY Option**: Photograph your own setup with Ubuntu displayed!

---

## How to Download and Attribute

### From Wikimedia Commons:
1. Click on the image
2. Scroll down to "Use this file"
3. Download full resolution
4. Check license (usually CC-BY-SA)
5. Note the attribution required

### From Unsplash:
1. Download high resolution
2. No attribution required (but nice to give)
3. Free for commercial use

### From Pixabay:
1. Download free
2. No attribution required
3. Free for commercial use

---

## Creating Composite Images

For the **HDD vs SSD comparison**, you may need to combine two images:

### Using GIMP (in Ubuntu):
```bash
# Install GIMP if needed
sudo apt install gimp

# Then:
# 1. Open GIMP
# 2. File > Open as Layers (load both HDD and SSD images)
# 3. Use Move tool to arrange side by side
# 4. Add text labels: "HDD (Slower)" and "SSD (Faster)"
# 5. Export as PNG
```

### Using ImageMagick (command line):
```bash
# Install ImageMagick
sudo apt install imagemagick

# Combine two images side by side
convert hdd.jpg ssd.jpg +append comparison.png

# Add labels
convert comparison.png -pointsize 40 -fill white -annotate +100+50 "HDD" -annotate +600+50 "SSD" chapter01-storage-drives.png
```

---

## Quick Attribution Template

If you need to provide attribution in the book:

```markdown
### Image Credits

- CPU image: [Photographer Name], [License], via [Source]
- RAM image: [Photographer Name], [License], via [Source]
- Storage comparison: [Photographer Name], [License], via [Source]
- Keyboard & Mouse: [Photographer Name], [License], via [Source]
- Monitor: [Photographer Name], [License], via [Source]
```

---

## Alternative: AI-Generated Images

If you can't find suitable CC-licensed images, consider AI-generated images:

**Tools**:
- DALL-E (paid): Very high quality
- Midjourney (paid): Excellent for product shots
- Stable Diffusion (free): Good quality, runs locally

**Example Prompts**:
- "Professional product photo of an Intel CPU processor chip on white background, top view, high detail"
- "RAM memory stick DDR4, green PCB, professional product photography, clean white background"
- "Side by side comparison of HDD and SSD drives, product photography"

---

## Time Estimate

**Finding and downloading images**: 30-60 minutes
- 10 min per image average
- Includes searching, evaluating, downloading

**Creating composites** (if needed): 15-30 minutes
- HDD/SSD comparison mainly

**Total**: ~1-1.5 hours for all hardware images

---

## Checklist

- [ ] CPU chip image (close-up, clear, branded)
- [ ] RAM stick image (full stick, green PCB visible)
- [ ] HDD vs SSD comparison (both visible, size difference clear)
- [ ] Keyboard and mouse (both together, clean setup)
- [ ] Monitor with speakers (screen showing content)
- [ ] All images saved as PNG in `/images/screenshots/`
- [ ] All images appropriate resolution (at least 800px wide)
- [ ] Attribution noted if required

---

## Pro Tips 💡

1. **Wikimedia Commons is your best friend** for hardware - photographers specifically upload tech component photos there

2. **Look for "product photography"** style images - clean, well-lit, professional

3. **Avoid overly technical** images - remember your audience is 9-12 year olds

4. **Consider diversity** in your keyboard/mouse/monitor images - various styles help kids relate

5. **Test images in the book** - view them in context to make sure they're clear and helpful

6. **Keep originals** - save high-res originals in case you need to re-crop or resize later

---

**Ready to find your images?** Start with Wikimedia Commons for the CPU, RAM, and drives - they have excellent hardware photos! 📸
