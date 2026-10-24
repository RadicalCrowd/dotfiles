# keyd

SpaceFN keyboard layer for Arch Linux, mapping held Spacebar to navigation and window management without physically pressing Ctrl or Alt. Includes automatic application exemption for Minecraft and games with zero manual toggles.

- `/etc/keyd/default.conf` ← `keyd/etc/keyd/default.conf`
- `~/.local/bin/keyd-auto-exempt` ← `keyd/bin/keyd-auto-exempt`
- `~/.config/systemd/user/keyd-auto-exempt.service` ← `keyd/.config/systemd/user/keyd-auto-exempt.service`

## Architecture Note: Alt vs Super Chording

In `keyd`:
- `M` represents **Meta / Super** (the Windows key).
- `A` represents **Alt**.

This configuration explicitly maps to `A-` (Alt) instead of `M-` (Super). This prevents conflicts with GNOME Wayland desktop shortcuts (`<Super>1..9` app switching, `<Super>a` app grid, `<Super>s` quick settings) while seamlessly triggering tmux's root bindings (`bind -n M-<key>`, where tmux defines `M-` as the terminal's Alt escape sequence).

## Automatic Game Exemption (Minecraft & Gaming Compatibility)

Games require holding the spacebar down continuously (e.g. jumping, sprint-jumping, swimming in water).

Rather than requiring manual "game mode" toggles, a lightweight background service (`keyd-auto-exempt.service`) automatically monitors active window events via event-driven kernel calls:
- **When Minecraft / Games are focused**: Spacebar is automatically restored to a 100% native physical key (`main.space = space`) with zero latency, full repeat, and sustained holding.
- **When Terminal / Desktop apps are focused**: SpaceFN is automatically re-engaged (`main.space = overload(space_fn, space)`).
- **Manual toggles**: None required. It switches on the fly completely hands-free.

## Setup

Requires `keyd`:

```bash
# Arch Linux
sudo pacman -S keyd

# Link configuration and set persistent socket permissions
sudo ln -sf ~/dotfiles/keyd/etc/keyd/default.conf /etc/keyd/default.conf
sudo mkdir -p /etc/systemd/system/keyd.service.d
sudo bash -c 'cat << "EOF" > /etc/systemd/system/keyd.service.d/socket-perms.conf
[Service]
ExecStartPost=/usr/bin/chmod 666 /var/run/keyd.socket
EOF'

# Enable keyd system service
sudo systemctl daemon-reload
sudo systemctl enable --now keyd
sudo chmod 666 /var/run/keyd.socket

# Enable automatic game exemption user service
mkdir -p ~/.local/bin ~/.config/systemd/user
ln -sf ~/dotfiles/keyd/bin/keyd-auto-exempt ~/.local/bin/keyd-auto-exempt
ln -sf ~/dotfiles/keyd/.config/systemd/user/keyd-auto-exempt.service ~/.config/systemd/user/keyd-auto-exempt.service
systemctl --user daemon-reload
systemctl --user enable --now keyd-auto-exempt.service
```
