#!/usr/bin/env python3
"""
Automated Screenshot Tool v2 - VirtualBox Compatible
Uses GNOME DBus API instead of xdotool for better VirtualBox compatibility
"""

import subprocess
import time
import sys
import os
from pathlib import Path

# Configuration
SCREENSHOT_DIR = Path("../images/screenshots")
SCREENSHOT_DIR.mkdir(parents=True, exist_ok=True)

# Delays
DELAY_SHORT = 2
DELAY_MEDIUM = 4
DELAY_LONG = 6

class Colors:
    BLUE = '\033[0;34m'
    GREEN = '\033[0;32m'
    YELLOW = '\033[1;33m'
    RED = '\033[0;31m'
    NC = '\033[0m'

def print_status(msg):
    print(f"{Colors.BLUE}[*]{Colors.NC} {msg}")

def print_success(msg):
    print(f"{Colors.GREEN}[✓]{Colors.NC} {msg}")

def print_warning(msg):
    print(f"{Colors.YELLOW}[!]{Colors.NC} {msg}")

def print_error(msg):
    print(f"{Colors.RED}[✗]{Colors.NC} {msg}")

def run_command(cmd, shell=True):
    """Run a command and return output"""
    try:
        result = subprocess.run(cmd, shell=shell, capture_output=True, text=True, timeout=30)
        return result.returncode == 0, result.stdout, result.stderr
    except Exception as e:
        return False, "", str(e)

def launch_app(app_name):
    """Launch application using gnome-shell"""
    print_status(f"Launching {app_name}...")

    # Try multiple methods
    methods = [
        f"gtk-launch {app_name.lower()}",
        f"gnome-terminal -- {app_name.lower()}",
        f"{app_name.lower()} &",
    ]

    for method in methods:
        success, _, _ = run_command(method)
        if success:
            time.sleep(DELAY_MEDIUM)
            return True

    # Fallback: use desktop file
    success, _, _ = run_command(f"dbus-send --session --type=method_call --dest=org.gnome.Shell /org/gnome/Shell org.gnome.Shell.Eval string:'Main.overview.show();'")
    time.sleep(DELAY_SHORT)

    # Type app name
    run_command(f"ydotool type '{app_name}'")
    time.sleep(DELAY_SHORT)

    # Press Enter
    run_command("ydotool key 28:1 28:0")  # Enter key
    time.sleep(DELAY_MEDIUM)

    return True

def take_screenshot(filename, fullscreen=False):
    """Take a screenshot"""
    filepath = SCREENSHOT_DIR / filename

    time.sleep(DELAY_SHORT)

    if fullscreen:
        cmd = f"gnome-screenshot -f {filepath}"
    else:
        cmd = f"gnome-screenshot -w -f {filepath}"

    success, _, err = run_command(cmd)

    if success and filepath.exists():
        print_success(f"Captured: {filename}")
        return True
    else:
        print_error(f"Failed to capture: {filename}")
        if err:
            print_error(f"Error: {err}")
        return False

def close_all_windows():
    """Close all application windows"""
    print_status("Closing all windows...")
    success, output, _ = run_command("wmctrl -l")

    if success and output:
        for line in output.split('\n'):
            if line.strip():
                window_id = line.split()[0]
                run_command(f"wmctrl -ic {window_id}")

    time.sleep(DELAY_MEDIUM)

def close_window():
    """Close active window"""
    run_command("wmctrl -c :ACTIVE:")
    time.sleep(DELAY_SHORT)

def press_key(key):
    """Press a keyboard key using ydotool"""
    # Common key codes for ydotool
    keys = {
        'super': '125:1 125:0',
        'escape': '1:1 1:0',
        'enter': '28:1 28:0',
        'tab': '15:1 15:0',
        'ctrl+l': '29:1 38:1 38:0 29:0',
        'ctrl+s': '29:1 31:1 31:0 29:0',
        'ctrl+shift+b': '29:1 42:1 48:1 48:0 42:0 29:0',
        'ctrl+shift+o': '29:1 42:1 24:1 24:0 42:0 29:0',
        'ctrl+t': '29:1 20:1 20:0 29:0',
        'ctrl+alt+t': '29:1 56:1 20:1 20:0 56:0 29:0',
        'alt+home': '56:1 102:1 102:0 56:0',
        'end': '107:1 107:0',
        'home': '102:1 102:0',
    }

    if key.lower() in keys:
        run_command(f"ydotool key {keys[key.lower()]}")
        return True
    return False

def type_text(text):
    """Type text using ydotool"""
    run_command(f"ydotool type '{text}'")
    time.sleep(DELAY_SHORT)

def install_dependencies():
    """Check and install required dependencies"""
    print_status("Checking dependencies...")

    deps = {
        'ydotool': 'sudo apt install ydotool',
        'wmctrl': 'sudo apt install wmctrl',
        'gnome-screenshot': 'sudo apt install gnome-screenshot',
    }

    missing = []
    for cmd, install in deps.items():
        success, _, _ = run_command(f"which {cmd}")
        if not success:
            missing.append((cmd, install))

    if missing:
        print_warning("Missing dependencies:")
        for cmd, install in missing:
            print(f"  - {cmd}: {install}")

        response = input("\nInstall missing dependencies? (y/n): ")
        if response.lower() == 'y':
            for cmd, install in missing:
                print_status(f"Installing {cmd}...")
                run_command(install)
        else:
            print_error("Cannot continue without dependencies")
            sys.exit(1)

    # Check if ydotoold is running
    success, _, _ = run_command("pgrep ydotoold")
    if not success:
        print_status("Starting ydotool daemon...")
        run_command("sudo ydotoold &")
        time.sleep(2)

    print_success("All dependencies ready!")

def chapter02_screenshots():
    """Chapter 2: Meet Ubuntu"""
    print_status("Starting Chapter 2 screenshots...")

    close_all_windows()

    # 2.1: Clean desktop
    take_screenshot("chapter02-clean-desktop.png", fullscreen=True)

    # 2.2: Applications menu
    press_key('super')
    time.sleep(DELAY_MEDIUM)
    take_screenshot("chapter02-applications-menu.png", fullscreen=True)
    press_key('escape')

    # 2.3-2.4: Files app
    launch_app("Files")
    take_screenshot("chapter02-files-app.png")
    press_key('alt+home')
    time.sleep(DELAY_SHORT)
    take_screenshot("chapter02-files-folders.png")

    # 2.5: New folder dialog (manual)
    print_warning("Right-click in Files and select 'New Folder', then press Enter")
    input("Press Enter when ready...")
    take_screenshot("chapter02-new-folder.png")
    press_key('escape')
    close_window()

    # 2.6: Firefox
    launch_app("Firefox")
    time.sleep(DELAY_LONG)
    press_key('ctrl+l')
    type_text("ubuntu.com")
    press_key('enter')
    time.sleep(DELAY_LONG)
    take_screenshot("chapter02-firefox.png")
    close_window()

    # 2.7: Writer
    launch_app("Writer")
    time.sleep(DELAY_LONG)
    take_screenshot("chapter02-libreoffice-writer.png")
    close_window()

    # 2.8: Rhythmbox
    launch_app("Rhythmbox")
    time.sleep(DELAY_LONG)
    take_screenshot("chapter02-rhythmbox.png")
    close_window()

    # 2.9: Videos
    launch_app("Videos")
    time.sleep(DELAY_MEDIUM)
    take_screenshot("chapter02-videos.png")
    close_window()

    # 2.10: Photos
    launch_app("Photos")
    time.sleep(DELAY_MEDIUM)
    take_screenshot("chapter02-photos.png")
    close_window()

    # 2.11: Text Editor
    launch_app("Text Editor")
    time.sleep(DELAY_MEDIUM)
    take_screenshot("chapter02-text-editor.png")
    close_window()

    # 2.12: Settings
    launch_app("Settings")
    time.sleep(DELAY_MEDIUM)
    press_key('end')
    time.sleep(DELAY_SHORT)
    take_screenshot("chapter02-settings.png")
    close_window()

    # 2.13: Window controls (manual annotation needed)
    launch_app("Files")
    time.sleep(DELAY_MEDIUM)
    take_screenshot("chapter02-window-controls.png")
    close_window()

    # 2.14: Power menu
    # Click system menu (approximate coordinates - may need adjustment)
    run_command("xdotool mousemove 1900 10 click 1")
    time.sleep(DELAY_SHORT)
    take_screenshot("chapter02-power-menu.png", fullscreen=True)
    press_key('escape')

    print_success("Chapter 2 complete!")

def main():
    print("=" * 50)
    print("  Automated Screenshot Tool v2")
    print("  VirtualBox Compatible")
    print("=" * 50)
    print()

    # Check dependencies
    install_dependencies()

    # Get chapter choice
    if len(sys.argv) > 1:
        chapter = sys.argv[1]
    else:
        print("Usage: ./auto-screenshot-v2.py [chapter_number]")
        print("\nAvailable chapters:")
        print("  2  - Meet Ubuntu")
        print("  all - All chapters")
        sys.exit(1)

    if chapter == '2':
        chapter02_screenshots()
    elif chapter == 'all':
        chapter02_screenshots()
        # Add more chapters here
    else:
        print_error(f"Invalid chapter: {chapter}")
        sys.exit(1)

    print()
    print_success("Screenshot session complete!")
    print(f"Screenshots saved to: {SCREENSHOT_DIR}")

if __name__ == "__main__":
    main()
