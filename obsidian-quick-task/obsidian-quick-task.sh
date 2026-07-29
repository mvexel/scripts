#!/usr/bin/env bash
# ~/.local/bin/quick-task
INBOX="$HOME/path/to/obsidian/vault/inbox.md" # or your daily note
task=$(zenity --entry --title="Quick task" --text="Todo:") || exit 0
[ -n "$task" ] && echo "- [ ] $task ➕ $(date +%F)" >>"$INBOX"
