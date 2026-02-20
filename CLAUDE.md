# Project Guidelines

## Repository
- This is a **public repository** — all content is visible to everyone
- Minimize file creation: avoid adding unnecessary files, temporary files, debug artifacts, or boilerplate that does not serve a clear purpose
- When reviewing PRs, flag any files that should not be in a public repo (secrets, credentials, personal data, large binaries, generated files that belong in `.gitignore`)
- Prefer editing existing files over creating new ones; only create new files when strictly required by the task

## Git Operations
- Always use the `-m` flag for git commits (never open an editor)
- Use longer timeouts (300000ms) for git commands, as this repo is on a Windows-mounted filesystem (`/mnt/c/`) which is slower
- Avoid running multiple git commands in parallel to prevent index.lock conflicts
