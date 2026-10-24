#!/usr/bin/env bash
# sidebar-toggle.sh — Toggle dedicated left vertical sidebar pane

SIDEBAR_TITLE="tmux-sidebar"

# Check if sidebar pane already exists in current window
sidebar_pane_id=$(tmux list-panes -F "#{pane_id} #{pane_title}" | awk -v title="$SIDEBAR_TITLE" '$2 == title {print $1}')

if [ -n "$sidebar_pane_id" ]; then
  # Sidebar is open -> close it
  tmux kill-pane -t "$sidebar_pane_id"
else
  # Sidebar is closed -> open on the left with width 30
  SCRIPT_PATH="${HOME}/.config/tmux/scripts/sidebar.sh"
  tmux split-window -b -h -l 30 -T "$SIDEBAR_TITLE" "bash '$SCRIPT_PATH'"
fi
