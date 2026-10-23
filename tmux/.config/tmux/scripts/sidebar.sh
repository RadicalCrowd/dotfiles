#!/usr/bin/env bash
# sidebar.sh — Dedicated vertical status/navigation sidebar for Tmux

# Hide cursor, handle exit gracefully
trap 'tput cnorm; exit 0' INT TERM EXIT
tput civis

while true; do
  clear
  printf "\033[1;34m=== TMUX SIDEBAR ===\033[0m\n"
  
  # Session Info
  current_session=$(tmux display-message -p '#S' 2>/dev/null || echo "detached")
  printf "\033[1;36mSession:\033[0m %s\n\n" "$current_session"

  # Windows List
  printf "\033[1;35m--- WINDOWS ---\033[0m\n"
  tmux list-windows -F "#{?window_active,\033[1;32m*, } #{window_index}: #{window_name}\033[0m" 2>/dev/null

  printf "\n\033[1;33m--- SPACEFN MAP ---\033[0m\n"
  printf "e: Up     s: Left\n"
  printf "d: Down   f: Right\n"
  printf "r: SplitV x: SplitH\n"
  printf "z: Zoom   q: Close\n"
  printf "b: NewWin\n\n"

  printf "\033[1;33m--- JUMP (SPACE+) ---\033[0m\n"
  printf "2:W1 3:W2 4:W3 5:W4\n"
  printf "g:W5 a:W6 w:W7 c:W8\n"
  printf "t:W9\n\n"

  printf "\033[90m(Space+\\ to toggle)\033[0m\n"

  sleep 2 &
  wait $!
done
