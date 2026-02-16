# Project Guidelines

## Git Operations
- Always use the `-m` flag for git commits (never open an editor)
- Use longer timeouts (300000ms) for git commands, as this repo is on a Windows-mounted filesystem (`/mnt/c/`) which is slower
- Avoid running multiple git commands in parallel to prevent index.lock conflicts
