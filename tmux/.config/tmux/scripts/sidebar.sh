#!/usr/bin/env bash
# sidebar.sh — Punctuation-focused vertical status/navigation sidebar for Tmux
# Follows the monospace punctuation visual language: [ ] { } \ | ; : < > , . ? / ! * + -

trap 'tput cnorm; exit 0' INT TERM EXIT
tput civis

while true; do
  clear
  printf "\033[1;36m┌── [TMUX] ──────────────────┐\033[0m\n"
  
  # Session
  current_session=$(tmux display-message -p '#S' 2>/dev/null || echo "detached")
  sess_str=$(printf "│ :: session : [%s]" "$current_session")
  printf "%-29s\033[1;36m│\033[0m\n" "$sess_str"

  # Windows Section
  printf "\033[1;36m├──\033[0m \033[1;35m{WINDOWS}\033[0m \033[1;36m───────────────┤\033[0m\n"
  tmux list-windows -F "#{window_index}|#{window_name}|#{window_active}" 2>/dev/null | while IFS="|" read -r idx name active; do
    if [ "$active" = "1" ]; then
      win_str=$(printf "│ [!%s!] %s *" "$idx" "$name")
    else
      win_str=$(printf "│ [#%s]  %s" "$idx" "$name")
    fi
    printf "%-29s\033[1;36m│\033[0m\n" "${win_str:0:29}"
  done

  # SpaceFN Navigation Section
  printf "\033[1;36m├──\033[0m \033[1;33m<SPACEFN>\033[0m \033[1;36m───────────────┤\033[0m\n"
  printf "\033[1;36m│\033[0m e:^   s:<   d:v   f:>      \033[1;36m│\033[0m\n"
  printf "\033[1;36m│\033[0m r:|   x:-   z:[z] q:[x]    \033[1;36m│\033[0m\n"
  printf "\033[1;36m│\033[0m b:[+] (new window)         \033[1;36m│\033[0m\n"

  # Direct Window Jump Section
  printf "\033[1;36m├──\033[0m \033[1;34m;JUMP;\033[0m \033[1;36m──────────────────┤\033[0m\n"
  printf "\033[1;36m│\033[0m 2:W1  3:W2  4:W3  5:W4     \033[1;36m│\033[0m\n"
  printf "\033[1;36m│\033[0m g:W5  a:W6  w:W7  c:W8     \033[1;36m│\033[0m\n"
  printf "\033[1;36m│\033[0m t:W9                       \033[1;36m│\033[0m\n"

  # Utility Footer
  printf "\033[1;36m└──\033[0m \033[90m[\\:toggle | y:theme]\033[0m \033[1;36m────┘\033[0m\n"

  sleep 2 &
  wait $!
done
