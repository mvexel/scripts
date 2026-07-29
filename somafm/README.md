# soma

A SomaFM player plugin for zsh. Works with plain zsh. Not tested with oh-my-zsh, zinit, antidote, or any other plugin manager, but "should work". 

Play [SomaFM](https://somafm.com/) (and stop) streams in the background with `mpg123`. Has tab completion for every station and a current track command. Survives terminal sessions.

```console
$ soma play groovesalad
▶ Groove Salad  (pid 104180)
$ soma track
♪ Sounds From The Ground - Anniesland
$ soma stop
■ stopped
```

## Requirements

- [`mpg123`](https://www.mpg123.de/) — playback
- `curl` and [`jq`](https://jqlang.github.io/jq/) — fetch/parse the station list

> Playback uses each station's **MP3** stream, not AAC. `mpg123` can't play AAC AFAIK. All channels offer an MP3 stream, so every station is playable anyway :shrug:.

## Install

Clone anywhere, then edit `~/.zshrc`:

```zsh
fpath=(/path/to/omz-soma-plugin $fpath)   # before compinit (tab completion)
source /path/to/omz-soma-plugin/soma.plugin.zsh
```

I am no longer an `oh-my-zsh` user but you should be able to just clone into `$ZSH_CUSTOM/plugins/soma` and add `soma` to `plugins=(...)`.

## Usage

| Command | Description |
|---|---|
| `soma play <station>` | Start a station in the background (`<Tab>` completes station ids) |
| `soma stop` | Stop playback |
| `soma track` | Show the current track |
| `soma love` | Save the currently-playing track to your loved list |
| `soma loved` | Show your loved tracks |
| `soma list` | List all stations (`id`, title, genre) |
| `soma update` | Refresh the cached station list |

Playback is detached, so it keeps going after you close the terminal. `soma stop` then works from any local session.

## Configuration

Set these before the plugin loads to change the (sane) default behavior.

| Variable | Default | Purpose |
|---|---|---|
| `SOMA_CACHE` | `$XDG_CACHE_HOME/soma` (`~/.cache/soma`) | Where cache + state files live |
| `SOMA_CHANNELS_URL` | `https://somafm.com/channels.json` | Station list endpoint |
| `SOMA_REFRESH_DAYS` | `7` | Auto-refresh the station list after N days |
| `SOMA_TIMEOUT` | `30` | Seconds before `mpg123` gives up on a stalled stream and exits (`0` = wait forever) |
| `SOMA_MPG123_OPTS` | _(empty)_ | Extra args passed to `mpg123` (e.g. `-o dummy` for no audio, `-a <device>`) |
| `SOMA_LOVED` | `$XDG_DATA_HOME/soma/loved` (`~/.local/share/soma/loved`) | File holding your loved-tracks list (TSV) |
