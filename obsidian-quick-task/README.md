# Obsidian Quick Task

I use both Linux (Ubuntu, GNOME) and Mac computers. I love Things on Mac and
have wished for a way to emulate Things's `ctrl-space` global keyboard shortcut that
pops up a small modal that lets you add a task to your Things inbox.

This script emulates that convenience for my GNOME desktop using the `zenity` command,
which lets you pop up a GTK+ dialog and return any input to the caller.

## Install

1. Open `obsidian-quick-task.sh` in your fav editor and point it to a file in your Obsidian vault directory. This is where your tasks will be appended.
2. Copy `obsidian-quick-task.sh` to somewhere in your `PATH`. I use `~/.local/bin`
3. `chmod +x` the file to make it executable.
4. Assign it the `ctrl-space` (or any shortcut you prefer) in the custom keyboard shortcut settings.

![screenshot of the GNOME keyboard settings panel](https://images.rtijn.org/obsidian-quick-task.png)
