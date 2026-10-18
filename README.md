# dotfiles

Personal workstation dotfiles for the Arch Linux workstation (`ak10`), managed with GNU Stow.

## Structure

- `zsh/.zshrc` — Zsh environment (Oh My Zsh, plugins, history, keybindings, Starship init)
- `starship/.config/starship.toml` — Starship prompt (punctuation-focused monospace typography)
- `foot/.config/foot/foot.ini` — Foot terminal config
- `kitty/.config/kitty/kitty.conf` — Kitty terminal config
- `ghostty/.config/ghostty/config` — Ghostty terminal config
- `fontconfig/.config/fontconfig/fonts.conf` — System font rules (JetBrains Mono preference)

## Install

Requires GNU Stow.

```bash
# Clone this repo
git clone https://github.com/RadicalCrowd/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Stow all packages to ~
stow -v -t ~ zsh starship foot kitty ghostty fontconfig

# Restow a single package after edits
stow -v -R -t ~ zsh
```

Each package stows its `~`-relative path into `~`. For example, `zsh/.zshrc` becomes `~/.zshrc`.

## Related

- `term-font` switcher: `~/.local/bin/term-font` toggles JetBrains Mono / Terminus across foot, kitty, and ghostty.
- Documentation: `RadicallyInsane/03-Areas/SystemConfig/` (SystemConfig area).
- Symlink targets are verified with `ls -la ~/.zshrc ~/.config/starship.toml`.
