# Images Folder

This folder contains all images for the Ubuntu for Kids book.

## Structure

- `screenshots/` - Ubuntu interface screenshots
- `illustrations/` - Diagrams, icons, and concept illustrations

## Image Guidelines

### Screenshots
- Format: PNG (best for UI screenshots)
- Resolution: 1920x1080 or actual screen resolution
- Keep UI elements readable
- Show default Ubuntu theme (for consistency)

### Illustrations
- Format: SVG preferred (scalable), PNG acceptable
- Simple and clear for 9-12 year olds
- Use Ubuntu color scheme when possible:
  - Orange: #E95420
  - Dark gray: #333333
  - White: #FFFFFF

## Finding Images

See `ADDING_IMAGES_GUIDE.md` in the root folder for detailed instructions on finding and adding Creative Commons images.

## Current Status

🔄 **Placeholders** - The book currently uses text placeholders like:
```markdown
![Screenshot Placeholder: Description]
```

Replace these with actual images when available.

## Attribution

If using CC-BY images (not CC0), add attribution:

```markdown
*Image: [Title] by [Creator], [License], via [Source]*
```

For CC0 images and Ubuntu screenshots, no attribution is required but is nice to include.

## Quick Start

1. Take screenshots on Ubuntu system:
   ```bash
   # Whole screen
   Press PrtScn

   # Selected area
   Press Shift + PrtScn

   # Current window
   Press Alt + PrtScn
   ```

2. Save to appropriate folder:
   - Desktop/Apps → `screenshots/`
   - Diagrams → `illustrations/`

3. Name clearly:
   - `ubuntu-desktop-gnome.png`
   - `files-app-documents.png`
   - `terminal-window.png`

4. Update markdown files to reference your images

## Image Sources

All images should be:
- CC0 (public domain) - preferred
- CC-BY (attribution required) - acceptable
- Your own screenshots - ideal
- GPL/open source software screenshots - allowed

See ADDING_IMAGES_GUIDE.md for recommended sources.
