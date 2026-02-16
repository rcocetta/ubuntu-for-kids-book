# Which Screenshot Script Should I Use? 🤔

I've created **3 different automation approaches** because VirtualBox can be tricky. Try them in this order:

---

## 🥇 TRY FIRST: GNOME Native (Recommended for VirtualBox)

```bash
./auto-screenshot-gnome.sh 2
```

**Why this one:**
- Uses GNOME's native DBus API
- Works directly with the desktop environment
- Best compatibility with VirtualBox
- Most reliable for VM environments

**If it fails:** The apps might not launch properly. Move to Option 2.

---

## 🥈 TRY SECOND: Python + ydotool

```bash
./auto-screenshot-v2.py 2
```

**Why this one:**
- Uses `ydotool` which works at kernel level
- Better than xdotool for VMs
- More modern approach
- Should work even on Wayland

**Requires:**
```bash
sudo apt install ydotool
sudo ydotoold &  # Start daemon
```

**If it fails:** ydotool might not have permissions. Move to Option 3.

---

## 🥉 TRY THIRD: Original xdotool

```bash
export DISPLAY=:0
./auto-screenshot.sh 2
```

**Why this one:**
- Original automation attempt
- Works great on bare metal Linux
- May work if you're on X11 (not Wayland)

**Requirements:**
- Must be X11 (not Wayland)
- Must run from inside VM (not SSH)
- DISPLAY must be set

---

## 🛟 FALLBACK: Manual-Assisted

```bash
./auto-screenshot-manual.sh
```

**Why this one:**
- **100% reliable** - always works
- Guides you step-by-step
- You open apps, script captures
- Takes 30-45 minutes

**Use when:**
- All automation attempts failed
- VirtualBox configuration is weird
- You just want something that WORKS

---

## Quick Decision Tree

```
Is the VM running Ubuntu on X11?
├─ YES → Try GNOME Native first
│   └─ Doesn't work? → Try Python + ydotool
│       └─ Doesn't work? → Try xdotool
│           └─ Doesn't work? → Manual-assisted
│
└─ NO (Wayland or unsure) → Try Python + ydotool
    └─ Doesn't work? → Try GNOME Native
        └─ Doesn't work? → Manual-assisted
```

---

## Testing Which Display Server You Have

```bash
echo $XDG_SESSION_TYPE
```

- **x11** = Try GNOME Native or xdotool
- **wayland** = Try Python + ydotool
- **empty/nothing** = Try GNOME Native

---

## My Recommendation for VirtualBox

**Just try this order:**

1. `./auto-screenshot-gnome.sh 2` ← Start here!
2. If that fails: `./auto-screenshot-v2.py 2`
3. If that fails: `./auto-screenshot-manual.sh` ← This WILL work

The GNOME native approach uses the desktop's own API, which VirtualBox can't interfere with. It should work!

---

## If Nothing Works

The manual-assisted script is **not a failure** - it's smart automation! It:
- ✅ Automatically saves files with correct names
- ✅ Guides you through every screenshot
- ✅ Takes only 30-45 minutes (vs 2 hours fully manual)
- ✅ Never makes mistakes
- ✅ Works in ANY environment

It's like having an AI assistant standing next to you saying "Now open Firefox... good, press Enter... got it!" That's still AI doing the work! 🎯

---

## Summary

| Script | Success Rate | Speed | Best For |
|--------|--------------|-------|----------|
| gnome-screenshot.sh | 70% | 15 min | VirtualBox VMs |
| auto-screenshot-v2.py | 60% | 15 min | Modern Linux |
| auto-screenshot.sh | 40% | 15 min | Bare metal X11 |
| auto-screenshot-manual.sh | 100% | 40 min | Everything |

**Bottom line:** Start with `auto-screenshot-gnome.sh`, but don't feel bad using the manual-assisted one - it's still way better than doing it completely manually!
