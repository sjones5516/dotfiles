# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/). Everything is themed with the **Lamplit Monastery** palette.

## What's included

| Source path                        | Installed to                     | Purpose                                                                                         |
| ---------------------------------- | -------------------------------- | ----------------------------------------------------------------------------------------------- |
| `dot_bashrc`                       | `~/.bashrc`                      | Bash config: color aliases for `ls`/`grep`, simple prompt, `EDITOR=vim`, JetBrains Toolbox on `PATH`                      |
| `dot_vimrc`, `dot_vim/`            | `~/.vimrc`, `~/.vim/`            | Vim config, `lamplit` colorscheme and airline theme                                             |
| `private_dot_config/scroll/`       | `~/.config/scroll/`              | [scroll](https://github.com/dawsers/scroll) (Wayland compositor) config and i3bar status script |
| `private_dot_config/foot/foot.ini` | `~/.config/foot/foot.ini`        | foot terminal (JetBrainsMono Nerd Font, 0.85 alpha)                                             |
| `private_dot_config/mako/config`   | `~/.config/mako/config`          | [mako](https://github.com/emersion/mako) notification daemon (Lamplit colors, top-right, per-urgency borders, do-not-disturb mode) |
| `private_dot_config/gtk-{3,4}.0/`  | `~/.config/gtk-{3,4}.0/`         | GTK settings (dark, `Lamplit` theme, Adwaita icons)                                             |
| `private_dot_config/mimeapps.list` | `~/.config/mimeapps.list`        | Default applications (thunar for directories, JetBrains Toolbox for `jetbrains://` links)       |
| `dot_local/share/themes/Lamplit/`  | `~/.local/share/themes/Lamplit/` | GTK 3/4 theme                                                                                   |
| `Pictures/background.png`          | `~/Pictures/background.png`      | Wallpaper (stored with Git LFS)                                                                 |

`*.md` is listed in `.chezmoiignore`, so `README.md` is never copied to your home directory.

## Requirements

- `chezmoi`, `git`, and `git-lfs` (the wallpaper is an LFS file)
- Desktop: `scroll`, `foot`, `wmenu`, `swayidle`, `swaylock`, `thunar`, `mako`
- Status bar: `wpctl` (PipeWire), `nmcli` (NetworkManager), `awk`
- Font: JetBrainsMono Nerd Font
- Vim with `curl` available (vim-plug bootstraps itself on first launch)

## Install on a new machine

```sh
git lfs install
chezmoi init <your-repo-url>   # clones to ~/.local/share/chezmoi
chezmoi diff                   # preview changes
chezmoi apply                  # write files to $HOME
```

Or in one step: `chezmoi init --apply <your-repo-url>`.

> The scroll config hardcodes the wallpaper path `/home/sjones/Pictures/background.png`. Edit `private_dot_config/scroll/config` if your username differs.

## Daily usage

```sh
chezmoi edit ~/.vimrc          # edit the source file for a target
chezmoi apply                  # apply source changes to $HOME
chezmoi add ~/.config/foo/bar  # start tracking a new file
chezmoi re-add                 # pull edits made directly in $HOME back into the source
chezmoi cd                     # shell into the source directory to commit
chezmoi update                 # git pull + apply (on other machines)
```

Naming follows chezmoi conventions: `dot_` becomes `.`, `private_` sets restrictive permissions, and `executable_` sets the executable bit.

## After applying

- **Vim:** open vim once. vim-plug downloads itself, then run `:PlugInstall` to fetch airline, NERDTree, devicons, ALE, UltiSnips and vim-snippets.
- **scroll:** reload with `$mod+Shift+c` (`$mod` is Super). To refresh the status bar immediately: `pkill -USR1 -f '^bash .*/scroll/status\.sh$'`.
- **GTK:** applications read `Lamplit` from `~/.local/share/themes/`; restart them to pick up changes.

## Key scroll bindings

| Keys                 | Action                          |
| -------------------- | ------------------------------- |
| `Super+Return`       | Open terminal (foot)            |
| `Super+r`            | Launcher (wmenu-run, via a login shell so `~/.bashrc` `PATH` applies) |
| `Super+e`            | File manager (thunar)           |
| `Super+Backspace`    | Close window                    |
| `Super+h/j/k/l`      | Move focus                      |
| `Super+Ctrl+h/j/k/l` | Move window                     |
| `Super+1..0`         | Switch workspace                |
| `Super+Shift+1..0`   | Send window to workspace        |
| `Super+Shift+c`      | Reload config                   |
| `Super+Shift+x`      | Exit scroll (with confirmation) |

See `man 5 scroll` for the full reference.
