#!/bin/bash
#
# Automated Screenshot Tool for "Ubuntu for Kids"
# This script automatically captures UI screenshots from Ubuntu
#
# Requirements: xdotool, wmctrl, gnome-screenshot
# Install: sudo apt install xdotool wmctrl gnome-screenshot
#
# Usage: ./auto-screenshot.sh [chapter_number]
#        ./auto-screenshot.sh all (captures all chapters)

set -e

# Configuration
SCREENSHOT_DIR="../images/screenshots"
DELAY_SHORT=3      # 1 second for quick actions
DELAY_MEDIUM=6     # 2 seconds for app launches
DELAY_LONG=9       # 3 seconds for complex operations

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Create screenshot directory if it doesn't exist
mkdir -p "$SCREENSHOT_DIR"

# Helper function to print status
print_status() {
    echo -e "${BLUE}[*]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

# Helper function to take a screenshot
take_screenshot() {
    local filename="$1"
    local window_name="$2"

    sleep $DELAY_SHORT

    if [ -n "$window_name" ]; then
        # Get window ID and capture specific window
        local window_id=$(xdotool search --name "$window_name" | head -1)
        if [ -n "$window_id" ]; then
            xdotool windowactivate "$window_id"
            sleep 0.5
            gnome-screenshot -w -f "$SCREENSHOT_DIR/$filename"
        else
            print_warning "Window '$window_name' not found, taking full screen"
            gnome-screenshot -f "$SCREENSHOT_DIR/$filename"
        fi
    else
        # Take full screen screenshot
        gnome-screenshot -f "$SCREENSHOT_DIR/$filename"
    fi

    if [ -f "$SCREENSHOT_DIR/$filename" ]; then
        print_success "Captured: $filename"
    else
        print_error "Failed to capture: $filename"
    fi
}

# Close all windows to start fresh
close_all_windows() {
    print_status "Closing all open windows..."
    wmctrl -l | awk '{print $1}' | while read window_id; do
        wmctrl -ic "$window_id" 2>/dev/null || true
    done
    sleep $DELAY_MEDIUM
}

# Open application from launcher
open_app() {
    local app_name="$1"
    print_status "Opening $app_name..."

    # Press Super key to open activities
    xdotool key super
    sleep $DELAY_SHORT

    # Type app name
    xdotool type --delay 100 "$app_name"
    sleep $DELAY_SHORT

    # Press Enter to launch
    xdotool key Return
    sleep $DELAY_MEDIUM
}

# Close current window
close_window() {
    xdotool key alt+F4
    sleep $DELAY_SHORT
}

#############################################
# CHAPTER 2: Meet Ubuntu
#############################################
chapter02_screenshots() {
    print_status "Starting Chapter 2 screenshots..."

    close_all_windows

    # Screenshot 2.1: Clean Ubuntu Desktop
    print_status "Capturing clean desktop..."
    take_screenshot "chapter02-clean-desktop.png"

    # Screenshot 2.2: Applications Menu Open
    print_status "Capturing applications menu..."
    xdotool key super
    sleep $DELAY_MEDIUM
    take_screenshot "chapter02-applications-menu.png"
    xdotool key Escape
    sleep $DELAY_SHORT

    # Screenshot 2.3 & 2.4: Files Application
    open_app "Files"
    sleep $DELAY_MEDIUM
    take_screenshot "chapter02-files-app.png" "Files"

    # Click on Home to show folders
    xdotool key alt+Home
    sleep $DELAY_SHORT
    take_screenshot "chapter02-files-folders.png" "Files"

    # Screenshot 2.5: Creating a New Folder (need to manually right-click)
    print_warning "For 'New Folder' dialog, please manually right-click and select New Folder"
    print_warning "Press Enter when ready to continue..."
    read -r
    take_screenshot "chapter02-new-folder.png" "Files"
    xdotool key Escape
    close_window

    # Screenshot 2.6: Firefox
    open_app "Firefox"
    sleep $DELAY_LONG
    xdotool type --delay 50 "ubuntu.com"
    xdotool key Return
    sleep $DELAY_LONG
    take_screenshot "chapter02-firefox.png" "Firefox"
    close_window

    # Screenshot 2.7: LibreOffice Writer
    open_app "Writer"
    sleep $DELAY_LONG
    take_screenshot "chapter02-libreoffice-writer.png" "LibreOffice Writer"
    close_window

    # Screenshot 2.8: Rhythmbox
    open_app "Rhythmbox"
    sleep $DELAY_LONG
    take_screenshot "chapter02-rhythmbox.png" "Rhythmbox"
    close_window

    # Screenshot 2.9: Videos
    open_app "Videos"
    sleep $DELAY_MEDIUM
    take_screenshot "chapter02-videos.png" "Videos"
    close_window

    # Screenshot 2.10: Photos
    open_app "Photos"
    sleep $DELAY_MEDIUM
    take_screenshot "chapter02-photos.png" "Photos"
    close_window

    # Screenshot 2.11: Text Editor
    open_app "Text Editor"
    sleep $DELAY_MEDIUM
    take_screenshot "chapter02-text-editor.png" "Text Editor"
    close_window

    # Screenshot 2.12: Settings (About)
    open_app "Settings"
    sleep $DELAY_MEDIUM
    # Navigate to About (usually at bottom of list)
    xdotool key End
    sleep $DELAY_SHORT
    take_screenshot "chapter02-settings.png" "Settings"

    # Screenshot 2.14: Power Menu
    xdotool key Escape
    close_window
    sleep $DELAY_SHORT
    # Click system menu in top-right
    xdotool mousemove --sync 1900 10
    xdotool click 1
    sleep $DELAY_SHORT
    take_screenshot "chapter02-power-menu.png"
    xdotool key Escape

    print_success "Chapter 2 screenshots complete!"
}

#############################################
# CHAPTER 3: The Internet
#############################################
chapter03_screenshots() {
    print_status "Starting Chapter 3 screenshots..."

    close_all_windows

    # Screenshot 3.1: Firefox Browser Window
    open_app "Firefox"
    sleep $DELAY_LONG
    take_screenshot "chapter03-firefox-window.png" "Firefox"

    # Screenshot 3.2: Ubuntu.com loaded
    xdotool type --delay 50 "ubuntu.com"
    xdotool key Return
    sleep $DELAY_LONG
    take_screenshot "chapter03-ubuntu-site.png" "Firefox"

    # Screenshot 3.3: DuckDuckGo
    xdotool key ctrl+l
    xdotool type --delay 50 "duckduckgo.com"
    xdotool key Return
    sleep $DELAY_LONG
    take_screenshot "chapter03-duckduckgo.png" "Firefox"

    # Screenshot 3.4: Multiple Tabs
    xdotool key ctrl+t
    sleep $DELAY_SHORT
    xdotool type --delay 50 "mozilla.org"
    xdotool key Return
    sleep $DELAY_LONG

    xdotool key ctrl+t
    sleep $DELAY_SHORT
    xdotool type --delay 50 "wikipedia.org"
    xdotool key Return
    sleep $DELAY_LONG

    take_screenshot "chapter03-multiple-tabs.png" "Firefox"

    # Screenshot 3.5: Bookmarks Menu
    xdotool key ctrl+shift+b  # Toggle bookmarks toolbar
    sleep $DELAY_SHORT
    xdotool key ctrl+shift+o  # Open bookmarks manager
    sleep $DELAY_MEDIUM
    take_screenshot "chapter03-bookmarks.png" "Library"
    close_window

    # Screenshot 3.6: Downloads Folder
    close_window  # Close Firefox
    open_app "Files"
    sleep $DELAY_MEDIUM
    # Click Downloads in sidebar
    xdotool key ctrl+h  # Show hidden files
    sleep $DELAY_SHORT
    # Navigate to Downloads (usually in sidebar)
    xdotool type --delay 50 "Downloads"
    xdotool key Return
    sleep $DELAY_SHORT
    take_screenshot "chapter03-downloads-folder.png" "Files"
    close_window

    print_success "Chapter 3 screenshots complete!"
}

#############################################
# CHAPTER 4: Creating Things
#############################################
chapter04_screenshots() {
    print_status "Starting Chapter 4 screenshots..."

    close_all_windows

    # Screenshot 4.1: LibreOffice Writer (Start)
    open_app "Writer"
    sleep $DELAY_LONG
    take_screenshot "chapter04-writer-start.png" "LibreOffice Writer"

    # Screenshot 4.2: Writer with text
    xdotool type --delay 50 "My Amazing Story"
    xdotool key Return Return
    xdotool type --delay 30 "Once upon a time, there was a curious kid who learned Ubuntu. They discovered they could create anything they imagined on their computer."
    sleep $DELAY_SHORT
    take_screenshot "chapter04-writer-text.png" "LibreOffice Writer"

    # Screenshot 4.3: Save Dialog
    xdotool key ctrl+s
    sleep $DELAY_MEDIUM
    take_screenshot "chapter04-save-dialog.png" "Save"
    xdotool key Escape
    close_window
    sleep $DELAY_SHORT
    xdotool key Tab Return  # Don't save

    # Screenshot 4.4: Drawing App
    if command -v drawing &> /dev/null; then
        open_app "Drawing"
        sleep $DELAY_MEDIUM
        take_screenshot "chapter04-drawing-app.png" "Drawing"
        close_window
    else
        print_warning "Drawing app not installed. Install with: sudo apt install drawing"
    fi

    # Screenshot 4.5: GIMP
    if command -v gimp &> /dev/null; then
        open_app "GIMP"
        sleep $DELAY_LONG
        take_screenshot "chapter04-gimp.png" "GNU Image Manipulation Program"
        close_window
    else
        print_warning "GIMP not installed. Install with: sudo apt install gimp"
    fi

    # Screenshot 4.6 & 4.7: OpenShot
    if command -v openshot-qt &> /dev/null; then
        open_app "OpenShot"
        sleep $DELAY_LONG
        take_screenshot "chapter04-openshot.png" "OpenShot"
        print_warning "For OpenShot timeline screenshot, please add some clips manually"
        print_warning "Press Enter when ready to continue..."
        read -r
        take_screenshot "chapter04-openshot-timeline.png" "OpenShot"
        close_window
    else
        print_warning "OpenShot not installed. Install with: sudo apt install openshot-qt"
    fi

    # Screenshot 4.8: Audacity
    if command -v audacity &> /dev/null; then
        open_app "Audacity"
        sleep $DELAY_LONG
        take_screenshot "chapter04-audacity.png" "Audacity"
        close_window
    else
        print_warning "Audacity not installed. Install with: sudo apt install audacity"
    fi

    # Screenshot 4.9: Sound Recorder
    open_app "Sound Recorder"
    sleep $DELAY_MEDIUM
    take_screenshot "chapter04-sound-recorder.png" "Sound Recorder"
    close_window

    # Screenshot 4.10: LibreOffice Impress
    open_app "Impress"
    sleep $DELAY_LONG
    take_screenshot "chapter04-impress.png" "LibreOffice Impress"
    close_window

    # Screenshot 4.11 & 4.12: LibreOffice Calc
    open_app "Calc"
    sleep $DELAY_LONG
    take_screenshot "chapter04-calc.png" "LibreOffice Calc"

    # Add sample data
    xdotool type "Item"
    xdotool key Tab
    xdotool type "Cost"
    xdotool key Return
    xdotool type "Ice cream"
    xdotool key Tab
    xdotool type "5"
    xdotool key Return
    xdotool type "Game"
    xdotool key Tab
    xdotool type "20"
    xdotool key Return
    xdotool type "Book"
    xdotool key Tab
    xdotool type "15"
    xdotool key Return
    xdotool type "Total"
    xdotool key Tab
    xdotool type "=SUM(B2:B4)"
    xdotool key Return
    sleep $DELAY_SHORT
    take_screenshot "chapter04-calc-example.png" "LibreOffice Calc"
    close_window

    print_success "Chapter 4 screenshots complete!"
}

#############################################
# CHAPTER 5: Installing Software
#############################################
chapter05_screenshots() {
    print_status "Starting Chapter 5 screenshots..."

    close_all_windows

    # Screenshot 5.1 & 5.2: Ubuntu Software Center
    open_app "Software"
    sleep $DELAY_LONG
    take_screenshot "chapter05-software-center.png" "Software"
    take_screenshot "chapter05-software-interface.png" "Software"

    # Screenshot 5.3: SuperTux page
    xdotool key ctrl+f
    sleep $DELAY_SHORT
    xdotool type --delay 50 "supertux"
    sleep $DELAY_MEDIUM
    xdotool key Return
    sleep $DELAY_LONG
    take_screenshot "chapter05-supertux-page.png" "Software"

    print_warning "For installation progress screenshot, you'll need to actually install an app"
    print_warning "For remove button screenshot, find an already-installed app"

    close_window

    print_success "Chapter 5 screenshots complete!"
}

#############################################
# CHAPTER 6: Customizing Ubuntu
#############################################
chapter06_screenshots() {
    print_status "Starting Chapter 6 screenshots..."

    close_all_windows

    open_app "Settings"
    sleep $DELAY_MEDIUM

    # Navigate to Appearance
    xdotool type --delay 50 "Appearance"
    xdotool key Return
    sleep $DELAY_SHORT

    # Screenshot 6.1 & 6.2: Background settings
    take_screenshot "chapter06-background-settings.png" "Settings"
    take_screenshot "chapter06-wallpapers.png" "Settings"

    # Screenshot 6.3: Light/Dark mode - needs manual comparison
    print_warning "For light/dark mode comparison, you'll need to manually create side-by-side"

    # Screenshot 6.4: Accent colors
    take_screenshot "chapter06-accent-colors.png" "Settings"

    # Screenshot 6.5: Display settings
    xdotool key Escape
    sleep $DELAY_SHORT
    xdotool type --delay 50 "Displays"
    xdotool key Return
    sleep $DELAY_SHORT
    take_screenshot "chapter06-display-settings.png" "Settings"

    # Screenshot 6.6: Sound settings
    xdotool key Escape
    sleep $DELAY_SHORT
    xdotool type --delay 50 "Sound"
    xdotool key Return
    sleep $DELAY_SHORT
    take_screenshot "chapter06-sound-settings.png" "Settings"

    # Screenshot 6.8: Bluetooth
    xdotool key Escape
    sleep $DELAY_SHORT
    xdotool type --delay 50 "Bluetooth"
    xdotool key Return
    sleep $DELAY_SHORT
    take_screenshot "chapter06-bluetooth.png" "Settings"

    # Screenshot 6.9: Device name (in About)
    xdotool key Escape
    sleep $DELAY_SHORT
    xdotool key End
    sleep $DELAY_SHORT
    take_screenshot "chapter06-device-name.png" "Settings"

    # Screenshot 6.11: Keyboard shortcuts
    xdotool key Home
    sleep $DELAY_SHORT
    xdotool type --delay 50 "Keyboard"
    xdotool key Return
    sleep $DELAY_SHORT
    # Look for shortcuts section
    xdotool key Tab Tab Tab Return
    sleep $DELAY_SHORT
    take_screenshot "chapter06-keyboard-shortcuts.png" "Settings"

    close_window

    # Screenshot 6.7: GNOME Tweaks
    if command -v gnome-tweaks &> /dev/null; then
        open_app "Tweaks"
        sleep $DELAY_MEDIUM
        take_screenshot "chapter06-gnome-tweaks.png" "Tweaks"
        close_window
    else
        print_warning "GNOME Tweaks not installed. Install with: sudo apt install gnome-tweaks"
    fi

    print_success "Chapter 6 screenshots complete!"
}

#############################################
# CHAPTER 7: The Terminal
#############################################
chapter07_screenshots() {
    print_status "Starting Chapter 7 screenshots..."

    close_all_windows

    # Screenshot 7.1 & 7.2: Terminal window
    xdotool key ctrl+alt+t
    sleep $DELAY_MEDIUM
    take_screenshot "chapter07-terminal-window.png" "Terminal"

    # Clear and take another
    xdotool type "clear"
    xdotool key Return
    sleep $DELAY_SHORT
    take_screenshot "chapter07-empty-terminal.png" "Terminal"

    # Screenshot 7.3: Cowsay
    if command -v cowsay &> /dev/null; then
        xdotool type 'cowsay "Hello Ubuntu!"'
        xdotool key Return
        sleep $DELAY_SHORT
        take_screenshot "chapter07-cowsay.png" "Terminal"
    else
        print_warning "cowsay not installed. Install with: sudo apt install cowsay"
    fi

    xdotool type "clear"
    xdotool key Return
    sleep $DELAY_SHORT

    # Screenshot 7.4: Figlet
    if command -v figlet &> /dev/null; then
        xdotool type 'figlet "UBUNTU"'
        xdotool key Return
        sleep $DELAY_SHORT
        take_screenshot "chapter07-figlet.png" "Terminal"
    else
        print_warning "figlet not installed. Install with: sudo apt install figlet"
    fi

    xdotool type "clear"
    xdotool key Return
    sleep $DELAY_SHORT

    # Screenshot 7.5: Cmatrix
    if command -v cmatrix &> /dev/null; then
        xdotool type "cmatrix"
        xdotool key Return
        sleep 3  # Let it run for 3 seconds
        take_screenshot "chapter07-cmatrix.png" "Terminal"
        xdotool key ctrl+c  # Stop cmatrix
    else
        print_warning "cmatrix not installed. Install with: sudo apt install cmatrix"
    fi

    close_window

    print_success "Chapter 7 screenshots complete!"
}

#############################################
# CHAPTER 8: When Things Go Wrong
#############################################
chapter08_screenshots() {
    print_status "Starting Chapter 8 screenshots..."

    close_all_windows

    # Screenshot 8.3: System Monitor
    open_app "System Monitor"
    sleep $DELAY_MEDIUM
    # Switch to Resources tab
    xdotool key ctrl+Page_Down
    sleep $DELAY_SHORT
    take_screenshot "chapter08-system-monitor.png" "System Monitor"
    close_window

    # Screenshot 8.4: Sound settings (duplicate from ch6 but different context)
    open_app "Settings"
    sleep $DELAY_MEDIUM
    xdotool type --delay 50 "Sound"
    xdotool key Return
    sleep $DELAY_SHORT
    take_screenshot "chapter08-sound-settings.png" "Settings"
    close_window

    print_warning "For 'no wifi' icon screenshot, manually disconnect from network"
    print_warning "For error dialog, trigger a safe error (like opening non-existent file)"
    print_warning "For 'Open With' dialog, right-click a file and select Open With"

    print_success "Chapter 8 screenshots complete!"
}

#############################################
# MAIN
#############################################
main() {
    echo "================================================"
    echo "   Automated Screenshot Tool for Ubuntu Book"
    echo "================================================"
    echo ""

    # Check for required tools
    print_status "Checking for required tools..."

    if ! command -v xdotool &> /dev/null; then
        print_error "xdotool not found. Install with: sudo apt install xdotool"
        exit 1
    fi

    if ! command -v wmctrl &> /dev/null; then
        print_error "wmctrl not found. Install with: sudo apt install wmctrl"
        exit 1
    fi

    if ! command -v gnome-screenshot &> /dev/null; then
        print_error "gnome-screenshot not found. Install with: sudo apt install gnome-screenshot"
        exit 1
    fi

    print_success "All required tools found!"
    echo ""

    # Parse command line argument
    if [ $# -eq 0 ]; then
        echo "Usage: $0 [chapter_number|all]"
        echo ""
        echo "Available chapters:"
        echo "  2  - Meet Ubuntu (14 screenshots)"
        echo "  3  - The Internet (6 screenshots)"
        echo "  4  - Creating Things (12 screenshots)"
        echo "  5  - Installing Software (5 screenshots)"
        echo "  6  - Customizing Ubuntu (11 screenshots)"
        echo "  7  - The Terminal (5 screenshots)"
        echo "  8  - When Things Go Wrong (5 screenshots)"
        echo "  all - Capture all chapters"
        exit 1
    fi

    case "$1" in
        2)
            chapter02_screenshots
            ;;
        3)
            chapter03_screenshots
            ;;
        4)
            chapter04_screenshots
            ;;
        5)
            chapter05_screenshots
            ;;
        6)
            chapter06_screenshots
            ;;
        7)
            chapter07_screenshots
            ;;
        8)
            chapter08_screenshots
            ;;
        all)
            chapter02_screenshots
            chapter03_screenshots
            chapter04_screenshots
            chapter05_screenshots
            chapter06_screenshots
            chapter07_screenshots
            chapter08_screenshots
            ;;
        *)
            print_error "Invalid chapter number. Use 2-8 or 'all'"
            exit 1
            ;;
    esac

    echo ""
    print_success "Screenshot session complete!"
    print_status "Screenshots saved to: $SCREENSHOT_DIR"
}

# Run main function
main "$@"
