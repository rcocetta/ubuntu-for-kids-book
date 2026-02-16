#!/bin/bash
#
# GNOME Shell Native Screenshot Automation
# Uses GNOME's built-in DBus API - works reliably in VirtualBox
#

set -e

SCREENSHOT_DIR="../images/screenshots"
mkdir -p "$SCREENSHOT_DIR"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

print_status() { echo -e "${BLUE}[*]${NC} $1"; }
print_success() { echo -e "${GREEN}[✓]${NC} $1"; }
print_warning() { echo -e "${YELLOW}[!]${NC} $1"; }
print_error() { echo -e "${RED}[✗]${NC} $1"; }

# Use GNOME Shell's evaluation to launch apps
gnome_launch() {
    local app_name="$1"
    print_status "Launching $app_name..."

    # Method 1: Use desktop file
    local desktop_file=$(find /usr/share/applications ~/.local/share/applications -name "*${app_name,,}*.desktop" 2>/dev/null | head -1)

    if [ -n "$desktop_file" ]; then
        gtk-launch "$(basename "$desktop_file" .desktop)" 2>/dev/null &
        sleep 4
        return 0
    fi

    # Method 2: Direct command
    case "$app_name" in
        "Files") nautilus & ;;
        "Firefox") firefox & ;;
        "Writer") libreoffice --writer & ;;
        "Calc") libreoffice --calc & ;;
        "Impress") libreoffice --impress & ;;
        "Settings") gnome-control-center & ;;
        "Terminal") gnome-terminal & ;;
        *) $app_name & ;;
    esac

    sleep 4
}

# Take screenshot of focused window
take_screenshot() {
    local filename="$1"
    local fullscreen="${2:-false}"

    sleep 1

    if [ "$fullscreen" = "true" ]; then
        gnome-screenshot -f "$SCREENSHOT_DIR/$filename"
    else
        # Get active window and screenshot it
        gnome-screenshot -w -f "$SCREENSHOT_DIR/$filename" 2>/dev/null || \
        gnome-screenshot -f "$SCREENSHOT_DIR/$filename"
    fi

    if [ -f "$SCREENSHOT_DIR/$filename" ]; then
        print_success "Captured: $filename"
        return 0
    else
        print_error "Failed: $filename"
        return 1
    fi
}

# Close active window
close_window() {
    local active_win=$(xdotool getactivewindow 2>/dev/null)
    if [ -n "$active_win" ]; then
        wmctrl -ic "$active_win" 2>/dev/null || xdotool windowkill "$active_win" 2>/dev/null
    fi
    sleep 1
}

# Chapter 2
chapter02() {
    print_status "Starting Chapter 2 screenshots..."

    # Close all windows
    wmctrl -l | awk '{print $1}' | while read id; do
        wmctrl -ic "$id" 2>/dev/null || true
    done
    sleep 2

    # 1. Clean desktop
    take_screenshot "chapter02-clean-desktop.png" true

    # 2. Applications menu
    print_status "Opening Activities..."
    dbus-send --session --type=method_call --dest=org.gnome.Shell \
        /org/gnome/Shell org.gnome.Shell.Eval string:'Main.overview.show();' >/dev/null 2>&1
    sleep 2
    take_screenshot "chapter02-applications-menu.png" true
    # Close overview
    dbus-send --session --type=method_call --dest=org.gnome.Shell \
        /org/gnome/Shell org.gnome.Shell.Eval string:'Main.overview.hide();' >/dev/null 2>&1
    sleep 1

    # 3-4. Files app
    gnome_launch "Files"
    take_screenshot "chapter02-files-app.png"
    take_screenshot "chapter02-files-folders.png"

    # 5. New folder dialog
    print_warning "Manual: Right-click in Files > New Folder, then press Enter"
    read -p "Press Enter when ready..." -r
    take_screenshot "chapter02-new-folder.png"
    close_window

    # 6. Firefox
    gnome_launch "Firefox"
    sleep 6  # Firefox takes time
    # Try to navigate
    xdotool key --clearmodifiers ctrl+l 2>/dev/null || true
    sleep 1
    xdotool type --clearmodifiers "ubuntu.com" 2>/dev/null || true
    sleep 1
    xdotool key --clearmodifiers Return 2>/dev/null || true
    sleep 6
    take_screenshot "chapter02-firefox.png"
    close_window

    # 7. Writer
    gnome_launch "Writer"
    sleep 6
    take_screenshot "chapter02-libreoffice-writer.png"
    close_window

    # 8. Rhythmbox
    gnome_launch "Rhythmbox"
    take_screenshot "chapter02-rhythmbox.png"
    close_window

    # 9. Videos
    gnome_launch "Videos"
    take_screenshot "chapter02-videos.png"
    close_window

    # 10. Photos
    gnome_launch "Photos"
    take_screenshot "chapter02-photos.png"
    close_window

    # 11. Text Editor
    gnome_launch "Text Editor"
    take_screenshot "chapter02-text-editor.png"
    close_window

    # 12. Settings
    gnome_launch "Settings"
    take_screenshot "chapter02-settings.png"
    close_window

    # 13. Window controls
    gnome_launch "Files"
    take_screenshot "chapter02-window-controls.png"
    print_warning "Remember to annotate this with arrows and labels!"
    close_window

    # 14. Power menu
    print_warning "Manual: Click system menu (top-right), then press Enter"
    read -p "Press Enter when ready..." -r
    take_screenshot "chapter02-power-menu.png" true

    print_success "Chapter 2 complete! (14/14 screenshots)"
}

# Main
echo "=================================================="
echo "  GNOME Native Screenshot Automation"
echo "  For VirtualBox"
echo "=================================================="
echo ""

# Check dependencies
for cmd in gnome-screenshot wmctrl gtk-launch; do
    if ! command -v $cmd &>/dev/null; then
        print_error "$cmd not found. Install with: sudo apt install ${cmd/-screenshot/}-screenshot wmctrl"
        exit 1
    fi
done

case "${1:-}" in
    2) chapter02 ;;
    *)
        echo "Usage: $0 [chapter]"
        echo "  2 - Chapter 2: Meet Ubuntu"
        exit 1
        ;;
esac

echo ""
print_success "Screenshots complete!"
print_status "Saved to: $SCREENSHOT_DIR"
