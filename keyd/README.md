# keyd

SpaceFN keyboard layer for Arch Linux, mapping held Spacebar to navigation and window management without physically pressing Ctrl or Alt.

- `/etc/keyd/default.conf` ← `keyd/etc/keyd/default.conf`

## Architecture Note: Alt vs Super Chording

In `keyd`:
- `M` represents **Meta / Super** (the Windows key).
- `A` represents **Alt**.

This configuration explicitly maps to `A-` (Alt) instead of `M-` (Super). This prevents conflicts with GNOME Wayland desktop shortcuts (`<Super>1..9` app switching, `<Super>a` app grid, `<Super>s` quick settings) while seamlessly triggering tmux's root bindings (`bind -n M-<key>`, where tmux defines `M-` as the terminal's Alt escape sequence).

## Setup

Requires `keyd`:

```bash
# Arch Linux
sudo pacman -S keyd

# Link configuration
sudo ln -sf ~/dotfiles/keyd/etc/keyd/default.conf /etc/keyd/default.conf

# Enable and start service
sudo systemctl enable --now keyd
sudo keyd reload
```
