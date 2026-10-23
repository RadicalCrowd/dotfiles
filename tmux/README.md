# tmux

Tmux configuration with SpaceFN layer navigation, dedicated vertical left sidebar, and instant theme toggling between Catppuccin Mocha and Gruvbox Retro Dark. Managed via GNU Stow.

- `~/.config/tmux/tmux.conf` ← `tmux/.config/tmux/tmux.conf`
- `~/.config/tmux/themes/` ← `tmux/.config/tmux/themes/`
- `~/.config/tmux/scripts/` ← `tmux/.config/tmux/scripts/`

## Key Architecture

- **SpaceFN**: Space key acts as a modifier layer via `keyd` (or fallback `C-Space`/`C-a` prefix).
- **ESDF Navigation**: `Space + e` (Up), `Space + s` (Left), `Space + d` (Down), `Space + f` (Right).
- **Panes**: `Space + r` (Vertical Split), `Space + x` (Horizontal Split), `Space + z` (Zoom), `Space + q` (Close).
- **Windows**: `Space + b` (New Window), `Space + 2..5, g, a, w, c, t` (Direct jump to Windows 1–9).
- **Sidebar**: `Space + \` toggles dedicated left sidebar pane.
- **Theme Switcher**: `Space + y` toggles Catppuccin Mocha / Gruvbox Retro Dark.

## Install

```bash
stow -v -t ~ tmux
```
