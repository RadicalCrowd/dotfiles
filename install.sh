#!/usr/bin/env bash
# install.sh — Stow all dotfile packages to ~
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v stow >/dev/null 2>&1; then
  echo "GNU Stow is required. Install it (e.g. sudo pacman -S stow) and re-run."
  exit 1
fi

cd "$DOTFILES_DIR"

echo "Stowing dotfiles to $HOME ..."
stow -v -t ~ zsh starship foot kitty ghostty fontconfig

echo "Done. Verify symlinks:"
ls -la ~/.zshrc ~/.config/starship.toml ~/.config/foot/foot.ini \
  ~/.config/kitty/kitty.conf ~/.config/ghostty/config ~/.config/fontconfig/fonts.conf
