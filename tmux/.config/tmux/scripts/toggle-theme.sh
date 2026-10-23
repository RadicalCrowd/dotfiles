#!/usr/bin/env bash
# toggle-theme.sh — Toggle between Catppuccin Mocha and Gruvbox Retro Dark

THEME_TRACKER="${HOME}/.config/tmux/.current-theme"
THEMES_DIR="${HOME}/.config/tmux/themes"

current="catppuccin"
if [ -f "$THEME_TRACKER" ]; then
  current=$(cat "$THEME_TRACKER")
fi

if [ "$current" = "catppuccin" ]; then
  next="gruvbox"
else
  next="catppuccin"
fi

echo "$next" > "$THEME_TRACKER"
tmux source-file "${THEMES_DIR}/${next}.conf"
tmux display-message "Theme switched to: ${next}"
