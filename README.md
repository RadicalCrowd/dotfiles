# dotfiles

Personal workstation dotfiles for the Arch Linux workstation (`ak10`), managed with GNU Stow.

## Structure

Configs are stored in three subfolders:

- `zsh/` — Zsh environment (Oh My Zsh, plugins, history, keybindings, Starship init) → `~/.zshrc`
- `nvim/` — Neovim / LazyVim config (`init.lua`, `lua/`, `lazy-lock.json`) → `~/.config/nvim/`
- `etc/` — System and terminal configs (starship, foot, kitty, ghostty, fontconfig) → `~/.config/`

## Install

Requires GNU Stow.

```bash
# Clone this repo
git clone https://github.com/RadicalCrowd/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Stow all packages to ~
./install.sh

# Or manually:
stow -v -t ~ zsh nvim etc

# Restow a single package after edits
stow -v -R -t ~ nvim
```

## Related

- `term-font` switcher: `~/.local/bin/term-font` toggles JetBrains Mono / Terminus across foot, kitty, and ghostty.
- Documentation: `RadicallyInsane/03-Areas/SystemConfig/` (SystemConfig area).
- Symlink targets are verified with `ls -la ~/.zshrc ~/.config/nvim/init.lua ~/.config/starship.toml`.
