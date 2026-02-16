#!/bin/bash
#
# Manual-Assisted Screenshot Tool
# This script prompts you to open apps manually, then captures screenshots
# Use this if xdotool automation doesn't work
#

set -e

# Configuration
SCREENSHOT_DIR="../images/screenshots"
DELAY=2

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

mkdir -p "$SCREENSHOT_DIR"

print_instruction() {
    echo -e "${BLUE}╔════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║${NC} $1"
    echo -e "${BLUE}╚════════════════════════════════════════════════╝${NC}"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

wait_for_user() {
    echo -e "${YELLOW}Press ENTER when ready...${NC}"
    read -r
}

take_screenshot() {
    local filename="$1"
    sleep $DELAY
    gnome-screenshot -w -f "$SCREENSHOT_DIR/$filename" 2>/dev/null || gnome-screenshot -f "$SCREENSHOT_DIR/$filename"
    if [ -f "$SCREENSHOT_DIR/$filename" ]; then
        print_success "Captured: $filename"
    else
        echo "⚠️  Failed to capture: $filename"
    fi
    sleep 1
}

# Chapter 2
chapter02_manual() {
    echo ""
    echo "=========================================="
    echo "  CHAPTER 2: Meet Ubuntu (14 screenshots)"
    echo "=========================================="
    echo ""

    # Close everything first
    print_instruction "Close ALL open windows first"
    wait_for_user

    print_instruction "1/14: Make sure desktop is clean with default wallpaper"
    wait_for_user
    gnome-screenshot -f "$SCREENSHOT_DIR/chapter02-clean-desktop.png"
    print_success "Captured: chapter02-clean-desktop.png"

    print_instruction "2/14: Click the 9 dots (Show Applications) at bottom"
    wait_for_user
    gnome-screenshot -f "$SCREENSHOT_DIR/chapter02-applications-menu.png"
    print_success "Captured: chapter02-applications-menu.png"
    echo "Press ESC to close the menu"
    sleep 2

    print_instruction "3/14: Open Files app (folder icon in dock)"
    wait_for_user
    take_screenshot "chapter02-files-app.png"

    print_instruction "4/14: In Files, make sure you're viewing Home with folders visible"
    wait_for_user
    take_screenshot "chapter02-files-folders.png"

    print_instruction "5/14: Right-click in Files and select 'New Folder'"
    print_instruction "     (Keep the dialog open)"
    wait_for_user
    take_screenshot "chapter02-new-folder.png"
    echo "You can close Files now"
    sleep 2

    print_instruction "6/14: Open Firefox and navigate to ubuntu.com"
    wait_for_user
    take_screenshot "chapter02-firefox.png"
    echo "You can close Firefox now"
    sleep 2

    print_instruction "7/14: Open LibreOffice Writer (blank document)"
    wait_for_user
    take_screenshot "chapter02-libreoffice-writer.png"
    echo "Close Writer"
    sleep 2

    print_instruction "8/14: Open Rhythmbox (music player)"
    wait_for_user
    take_screenshot "chapter02-rhythmbox.png"
    echo "Close Rhythmbox"
    sleep 2

    print_instruction "9/14: Open Videos app"
    wait_for_user
    take_screenshot "chapter02-videos.png"
    echo "Close Videos"
    sleep 2

    print_instruction "10/14: Open Photos app"
    wait_for_user
    take_screenshot "chapter02-photos.png"
    echo "Close Photos"
    sleep 2

    print_instruction "11/14: Open Text Editor (not Writer, the simpler one)"
    wait_for_user
    take_screenshot "chapter02-text-editor.png"
    echo "Close Text Editor"
    sleep 2

    print_instruction "12/14: Open Settings and go to About (at bottom of sidebar)"
    wait_for_user
    take_screenshot "chapter02-settings.png"
    echo "Close Settings"
    sleep 2

    print_instruction "13/14: For window controls - open any app, we'll annotate later"
    echo "             (Just take a screenshot of Files or any window)"
    wait_for_user
    take_screenshot "chapter02-window-controls.png"
    echo "⚠️  Remember to add arrows and labels to this one later!"
    sleep 2

    print_instruction "14/14: Click the system menu in top-right corner"
    wait_for_user
    gnome-screenshot -f "$SCREENSHOT_DIR/chapter02-power-menu.png"
    print_success "Captured: chapter02-power-menu.png"

    echo ""
    print_success "Chapter 2 complete! (14/14 screenshots)"
    echo ""
}

# Chapter 3
chapter03_manual() {
    echo ""
    echo "=========================================="
    echo "  CHAPTER 3: The Internet (6 screenshots)"
    echo "=========================================="
    echo ""

    print_instruction "1/6: Open Firefox (clean, blank or start page)"
    wait_for_user
    take_screenshot "chapter03-firefox-window.png"

    print_instruction "2/6: Navigate to ubuntu.com and wait for it to load"
    wait_for_user
    take_screenshot "chapter03-ubuntu-site.png"

    print_instruction "3/6: Navigate to duckduckgo.com"
    wait_for_user
    take_screenshot "chapter03-duckduckgo.png"

    print_instruction "4/6: Open 3-4 tabs (ubuntu.com, mozilla.org, wikipedia.org, etc.)"
    print_instruction "     Make sure all tabs are visible in the tab bar"
    wait_for_user
    take_screenshot "chapter03-multiple-tabs.png"

    print_instruction "5/6: Press Ctrl+Shift+O to open bookmarks manager"
    print_instruction "     OR show bookmarks toolbar (Ctrl+Shift+B)"
    wait_for_user
    take_screenshot "chapter03-bookmarks.png"
    echo "Close Firefox"
    sleep 2

    print_instruction "6/6: Open Files app and click 'Downloads' in sidebar"
    wait_for_user
    take_screenshot "chapter03-downloads-folder.png"
    echo "Close Files"
    sleep 2

    echo ""
    print_success "Chapter 3 complete! (6/6 screenshots)"
    echo ""
}

# Chapter 4
chapter04_manual() {
    echo ""
    echo "=========================================="
    echo "  CHAPTER 4: Creating Things (12 screenshots)"
    echo "=========================================="
    echo ""

    print_instruction "1/12: Open LibreOffice Writer (blank document)"
    wait_for_user
    take_screenshot "chapter04-writer-start.png"

    print_instruction "2/12: Type a few paragraphs of sample text in Writer"
    wait_for_user
    take_screenshot "chapter04-writer-text.png"

    print_instruction "3/12: Press Ctrl+S to open Save dialog (keep it open)"
    wait_for_user
    take_screenshot "chapter04-save-dialog.png"
    echo "You can close Writer without saving"
    sleep 2

    print_instruction "4/12: Open Drawing app (if installed)"
    wait_for_user
    take_screenshot "chapter04-drawing-app.png"
    echo "Close Drawing"
    sleep 2

    print_instruction "5/12: Open GIMP (if installed)"
    print_instruction "     (This takes a moment to load)"
    wait_for_user
    take_screenshot "chapter04-gimp.png"
    echo "Close GIMP"
    sleep 2

    print_instruction "6/12: Open OpenShot video editor (if installed)"
    wait_for_user
    take_screenshot "chapter04-openshot.png"

    print_instruction "7/12: In OpenShot, import some clips and add to timeline"
    print_instruction "     (Or skip if this takes too long)"
    wait_for_user
    take_screenshot "chapter04-openshot-timeline.png"
    echo "Close OpenShot"
    sleep 2

    print_instruction "8/12: Open Audacity (if installed)"
    wait_for_user
    take_screenshot "chapter04-audacity.png"
    echo "Close Audacity"
    sleep 2

    print_instruction "9/12: Open Sound Recorder"
    wait_for_user
    take_screenshot "chapter04-sound-recorder.png"
    echo "Close Sound Recorder"
    sleep 2

    print_instruction "10/12: Open LibreOffice Impress (presentations)"
    wait_for_user
    take_screenshot "chapter04-impress.png"
    echo "Close Impress"
    sleep 2

    print_instruction "11/12: Open LibreOffice Calc (blank spreadsheet)"
    wait_for_user
    take_screenshot "chapter04-calc.png"

    print_instruction "12/12: In Calc, type: 'Item' (Tab) 'Cost' (Enter)"
    print_instruction "     Then add: 'Ice cream' (Tab) '5' (Enter)"
    print_instruction "     'Game' (Tab) '20' (Enter)"
    print_instruction "     'Book' (Tab) '15' (Enter)"
    print_instruction "     'Total' (Tab) '=SUM(B2:B4)' (Enter)"
    wait_for_user
    take_screenshot "chapter04-calc-example.png"
    echo "Close Calc"
    sleep 2

    echo ""
    print_success "Chapter 4 complete! (12/12 screenshots)"
    echo ""
}

# Chapter 5
chapter05_manual() {
    echo ""
    echo "=========================================="
    echo "  CHAPTER 5: Installing Software (5 screenshots)"
    echo "=========================================="
    echo ""

    print_instruction "1/5: Open Ubuntu Software (shopping bag icon)"
    wait_for_user
    take_screenshot "chapter05-software-center.png"
    take_screenshot "chapter05-software-interface.png"

    print_instruction "2/5: Search for 'supertux' and open its page"
    wait_for_user
    take_screenshot "chapter05-supertux-page.png"

    print_instruction "3/5: Click Install on an app and capture progress bar"
    print_instruction "     (Be ready to screenshot quickly!)"
    wait_for_user
    take_screenshot "chapter05-installing.png"

    print_instruction "4/5: Find an already-installed app and show its page"
    print_instruction "     (Should show 'Remove' button)"
    wait_for_user
    take_screenshot "chapter05-remove-button.png"
    echo "Close Software"
    sleep 2

    echo ""
    print_success "Chapter 5 complete! (5/5 screenshots)"
    echo ""
}

# Chapter 6
chapter06_manual() {
    echo ""
    echo "=========================================="
    echo "  CHAPTER 6: Customizing Ubuntu (11 screenshots)"
    echo "=========================================="
    echo ""

    print_instruction "1/11: Open Settings > Appearance (Background tab)"
    wait_for_user
    take_screenshot "chapter06-background-settings.png"
    take_screenshot "chapter06-wallpapers.png"
    take_screenshot "chapter06-accent-colors.png"

    print_instruction "2/11: We need light/dark mode comparison"
    echo "             Take screenshot of desktop in Light mode, then Dark mode"
    echo "             We'll combine them later"
    echo "             ⚠️  Skip for now, do manually later"
    sleep 2

    print_instruction "3/11: Settings > Displays"
    wait_for_user
    take_screenshot "chapter06-display-settings.png"

    print_instruction "4/11: Settings > Sound"
    wait_for_user
    take_screenshot "chapter06-sound-settings.png"

    print_instruction "5/11: Settings > Bluetooth"
    wait_for_user
    take_screenshot "chapter06-bluetooth.png"

    print_instruction "6/11: Settings > About (scroll to bottom of sidebar)"
    wait_for_user
    take_screenshot "chapter06-device-name.png"

    print_instruction "7/11: Settings > Keyboard > View and Customize Shortcuts"
    wait_for_user
    take_screenshot "chapter06-keyboard-shortcuts.png"
    echo "Close Settings"
    sleep 2

    print_instruction "8/11: Open GNOME Tweaks (if installed)"
    wait_for_user
    take_screenshot "chapter06-gnome-tweaks.png"
    echo "Close Tweaks"
    sleep 2

    echo ""
    print_success "Chapter 6 complete! (11/11 screenshots)"
    echo ""
}

# Chapter 7
chapter07_manual() {
    echo ""
    echo "=========================================="
    echo "  CHAPTER 7: The Terminal (5 screenshots)"
    echo "=========================================="
    echo ""

    print_instruction "1/5: Open Terminal (Ctrl+Alt+T) and type 'clear'"
    wait_for_user
    take_screenshot "chapter07-terminal-window.png"
    take_screenshot "chapter07-empty-terminal.png"

    print_instruction "2/5: Type: cowsay \"Hello Ubuntu!\""
    print_instruction "     (Install first: sudo apt install cowsay)"
    wait_for_user
    take_screenshot "chapter07-cowsay.png"

    print_instruction "3/5: Type 'clear' then: figlet \"UBUNTU\""
    print_instruction "     (Install: sudo apt install figlet)"
    wait_for_user
    take_screenshot "chapter07-figlet.png"

    print_instruction "4/5: Type 'clear' then: cmatrix"
    print_instruction "     Let it run for 2-3 seconds, then screenshot"
    print_instruction "     Press Ctrl+C to stop"
    print_instruction "     (Install: sudo apt install cmatrix)"
    wait_for_user
    take_screenshot "chapter07-cmatrix.png"
    echo "Close Terminal"
    sleep 2

    echo ""
    print_success "Chapter 7 complete! (5/5 screenshots)"
    echo ""
}

# Chapter 8
chapter08_manual() {
    echo ""
    echo "=========================================="
    echo "  CHAPTER 8: When Things Go Wrong (5 screenshots)"
    echo "=========================================="
    echo ""

    print_instruction "1/5: Disconnect from WiFi, then screenshot top bar"
    print_instruction "     (Should show disconnected icon)"
    wait_for_user
    gnome-screenshot -f "$SCREENSHOT_DIR/chapter08-no-wifi.png"
    print_success "Captured: chapter08-no-wifi.png"
    echo "Reconnect to WiFi"
    sleep 2

    print_instruction "2/5: Trigger an error (try opening a non-existent file)"
    print_instruction "     Then screenshot the error dialog"
    wait_for_user
    take_screenshot "chapter08-error-dialog.png"

    print_instruction "3/5: Open System Monitor and go to Resources tab"
    wait_for_user
    take_screenshot "chapter08-system-monitor.png"
    echo "Close System Monitor"
    sleep 2

    print_instruction "4/5: Settings > Sound (for troubleshooting context)"
    wait_for_user
    take_screenshot "chapter08-sound-settings.png"
    echo "Close Settings"
    sleep 2

    print_instruction "5/5: Right-click any file > Open With"
    print_instruction "     Screenshot the dialog showing app choices"
    wait_for_user
    take_screenshot "chapter08-open-with.png"

    echo ""
    print_success "Chapter 8 complete! (5/5 screenshots)"
    echo ""
}

# Main menu
main() {
    echo "=================================================="
    echo "   Manual-Assisted Screenshot Tool"
    echo "   For Ubuntu for Kids Book"
    echo "=================================================="
    echo ""
    echo "This script will guide you through taking screenshots"
    echo "You manually open apps, script captures them"
    echo ""
    echo "Choose a chapter:"
    echo "  2  - Meet Ubuntu (14 screenshots)"
    echo "  3  - The Internet (6 screenshots)"
    echo "  4  - Creating Things (12 screenshots)"
    echo "  5  - Installing Software (5 screenshots)"
    echo "  6  - Customizing Ubuntu (11 screenshots)"
    echo "  7  - The Terminal (5 screenshots)"
    echo "  8  - When Things Go Wrong (5 screenshots)"
    echo "  all - Do all chapters"
    echo ""
    read -p "Enter chapter number (or 'all'): " choice

    case "$choice" in
        2) chapter02_manual ;;
        3) chapter03_manual ;;
        4) chapter04_manual ;;
        5) chapter05_manual ;;
        6) chapter06_manual ;;
        7) chapter07_manual ;;
        8) chapter08_manual ;;
        all)
            chapter02_manual
            chapter03_manual
            chapter04_manual
            chapter05_manual
            chapter06_manual
            chapter07_manual
            chapter08_manual
            ;;
        *)
            echo "Invalid choice"
            exit 1
            ;;
    esac

    echo ""
    echo "=================================================="
    print_success "All done!"
    echo "Screenshots saved to: $SCREENSHOT_DIR"
    echo ""
    echo "Don't forget:"
    echo "  - Chapter 1: Find hardware photos online"
    echo "  - Annotate chapter02-window-controls.png"
    echo "  - Create light/dark mode comparison"
    echo "=================================================="
}

main
