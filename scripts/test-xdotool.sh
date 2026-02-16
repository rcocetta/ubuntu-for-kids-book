#!/bin/bash
#
# Test if xdotool is working properly
#

echo "Testing xdotool functionality..."
echo ""

# Test 1: Check if X display is set
echo "1. Checking DISPLAY variable..."
if [ -z "$DISPLAY" ]; then
    echo "   ❌ DISPLAY not set! This is the problem."
    echo "   Try: export DISPLAY=:0"
else
    echo "   ✓ DISPLAY is set to: $DISPLAY"
fi
echo ""

# Test 2: Try to get active window
echo "2. Testing if we can get active window..."
ACTIVE_WINDOW=$(xdotool getactivewindow 2>&1)
if [ $? -eq 0 ]; then
    echo "   ✓ Can get active window: $ACTIVE_WINDOW"
else
    echo "   ❌ Cannot get active window: $ACTIVE_WINDOW"
fi
echo ""

# Test 3: Try to search for a window
echo "3. Testing if we can search for windows..."
WINDOWS=$(xdotool search --onlyvisible --class "" 2>&1)
if [ $? -eq 0 ]; then
    echo "   ✓ Can search for windows"
    echo "   Found $(echo "$WINDOWS" | wc -l) windows"
else
    echo "   ❌ Cannot search for windows: $WINDOWS"
fi
echo ""

# Test 4: Check wmctrl
echo "4. Testing wmctrl..."
WMCTRL_OUTPUT=$(wmctrl -l 2>&1)
if [ $? -eq 0 ]; then
    echo "   ✓ wmctrl is working"
    echo "   Windows found:"
    echo "$WMCTRL_OUTPUT" | head -5
else
    echo "   ❌ wmctrl failed: $WMCTRL_OUTPUT"
fi
echo ""

# Test 5: Try a simple key press (won't actually execute, just test)
echo "5. Testing if xdotool can simulate input..."
echo "   Opening a test window in 3 seconds..."
gnome-terminal -- bash -c "echo 'Test window - you can close this'; sleep 10" &
sleep 3

TEST_WINDOW=$(xdotool search --name "Test window" 2>&1)
if [ $? -eq 0 ]; then
    echo "   ✓ Can find test window: $TEST_WINDOW"
    # Try to type in it
    xdotool type --window "$TEST_WINDOW" "hello"
    if [ $? -eq 0 ]; then
        echo "   ✓ Can type in windows!"
    else
        echo "   ❌ Cannot type in windows"
    fi
else
    echo "   ❌ Cannot find test window"
fi
echo ""

echo "=========================================="
echo "Summary:"
echo "If any tests failed, xdotool won't work properly"
echo "for the screenshot automation."
echo ""
echo "Common fixes:"
echo "1. Run: export DISPLAY=:0"
echo "2. Install VirtualBox Guest Additions"
echo "3. Run script from actual terminal, not SSH"
echo "4. Give script more permissions"
echo "=========================================="
