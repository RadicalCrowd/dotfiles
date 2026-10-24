# keyd

SpaceFN keyboard layer for Arch Linux, mapping held Spacebar to navigation and window management without physically pressing Ctrl or Alt. Includes an instant Game Mode toggle for gaming (e.g. Minecraft).

- `/etc/keyd/default.conf` ← `keyd/etc/keyd/default.conf`

## Architecture Note: Alt vs Super Chording

In `keyd`:
- `M` represents **Meta / Super** (the Windows key).
- `A` represents **Alt**.

This configuration explicitly maps to `A-` (Alt) instead of `M-` (Super). This prevents conflicts with GNOME Wayland desktop shortcuts (`<Super>1..9` app switching, `<Super>a` app grid, `<Super>s` quick settings) while seamlessly triggering tmux's root bindings (`bind -n M-<key>`, where tmux defines `M-` as the terminal's Alt escape sequence).

## Game Mode (Minecraft & Gaming Compatibility)

Games require holding the spacebar down continuously (e.g. jumping, sprint-jumping, swimming in water). Because SpaceFN captures held space as a modifier layer, `keyd` includes an instant **Game Mode layer**:

- **Toggle On/Off**: Tap **`Right Alt`** (directly next to spacebar on Keychron Q1), **`Insert`**, **`Pause`**, or **`Ctrl+Alt+Space`**.
- **Alternative Trigger**: Hold **`Space + Esc`**.
- **When Active**: Spacebar functions as a 100% raw, unhindered physical key with full repeat and hold capabilities.

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
