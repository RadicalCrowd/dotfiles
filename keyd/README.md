# keyd

SpaceFN keyboard layer for Arch Linux, mapping held Spacebar to navigation and window management without pressing Ctrl or Alt.

- `/etc/keyd/default.conf` ← `keyd/etc/keyd/default.conf`

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
