#!/usr/bin/env bash
# toggle-theme.sh — Toggle across Tokyo Night, Kanagawa, Gruvbox, and Catppuccin

THEME_TRACKER="${HOME}/.config/tmux/.current-theme"
THEMES_DIR="${HOME}/.config/tmux/themes"

current="tokyonight"
if [ -f "$THEME_TRACKER" ]; then
  current=$(cat "$THEME_TRACKER")
fi

case "$current" in
  "tokyonight")
    next="kanagawa"
    ;;
  "kanagawa")
    next="gruvbox"
    ;;
  "gruvbox")
    next="catppuccin"
    ;;
  *)
    next="tokyonight"
    ;;
esac

echo "$next" > "$THEME_TRACKER"
tmux source-file "${THEMES_DIR}/${next}.conf"
tmux display-message "Tmux Theme: ${next}"
