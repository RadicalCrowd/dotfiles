# dotfiles

Personal workstation dotfiles for the Arch Linux workstation (`ak10`), managed with GNU Stow.

Each tool lives in its own subfolder with its own `README.md`:

- `zsh/` → `~/.zshrc`
- `nvim/` → `~/.config/nvim/` (LazyVim config)
- `foot/` → `~/.config/foot/foot.ini`
- `kitty/` → `~/.config/kitty/kitty.conf`
- `ghostty/` → `~/.config/ghostty/config`
- `fontconfig/` → `~/.config/fontconfig/fonts.conf`
- `starship/` → `~/.config/starship.toml`

## Install

Requires GNU Stow.

```bash
# Clone this repo
git clone https://github.com/RadicalCrowd/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Stow all packages to ~
./install.sh

# Or manually:
stow -v -t ~ zsh nvim foot kitty ghostty fontconfig starship

# Restow a single package after edits
stow -v -R -t ~ nvim
```

## Related

- `term-font` switcher: `~/.local/bin/term-font` toggles JetBrains Mono / Terminus across foot, kitty, and ghostty.
- Documentation: `RadicallyInsane/03-Areas/SystemConfig/` (SystemConfig area).
- Symlink targets are verified with `ls -la ~/.zshrc ~/.config/nvim/init.lua ~/.config/starship.toml`.
