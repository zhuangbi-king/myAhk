# myAhk

A collection of AutoHotkey v2 scripts for Windows productivity, including keyboard shortcuts, window management, and handy hotstrings.

## Files

- [`main.ahk`](main.ahk) – Entry point that loads all other scripts and defines git-related hotstrings
- [`shortcuts.ahk`](shortcuts.ahk) – Keyboard shortcuts for launching applications and window operations
- [`windows_ops.ahk`](windows_ops.ahk) – Utility functions for window transparency, resizing, and movement

## Getting Started

1. Install [AutoHotkey v2](https://www.autohotkey.com/)
2. Run `main.ahk` to start all scripts

## Hotstring Examples

```ahk
::/gs::git status
::/grh::git reset --hard HEAD
::/gr::git reset HEAD
::/gc::git clean -i -d
```

## Modifier Key Reference

| Symbol | Key     |
|--------|---------|
| `#`    | Win     |
| `^`    | Ctrl    |
| `+`    | Shift   |
| `!`    | Alt     |
