# ==============================================================================
# Arch Linux Zsh Environment
# Managed via GNU Stow (~/dotfiles/zsh)
# Stack: Zsh + Oh My Zsh + Starship + GNU Stow
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. Environment & PATH
# ------------------------------------------------------------------------------
export PATH="$HOME/.local/bin:$HOME/.opencode/bin:$PATH"

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Default editor
export EDITOR="nvim"
export VISUAL="nvim"

# ------------------------------------------------------------------------------
# 2. Persistent History
# ------------------------------------------------------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

setopt EXTENDED_HISTORY          # Write timestamps and execution duration to history
setopt HIST_EXPIRE_DUPS_FIRST    # Expire oldest duplicates first when trimming
setopt HIST_IGNORE_DUPS          # Do not record an entry that was just recorded
setopt HIST_IGNORE_ALL_DUPS      # Delete old duplicate entry when new one is recorded
setopt HIST_FIND_NO_DUPS         # Do not display duplicate lines when searching
setopt HIST_SAVE_NO_DUPS         # Do not write duplicate entries to history file
setopt HIST_IGNORE_SPACE         # Do not record lines beginning with a space
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks from history items
setopt HIST_VERIFY               # Show command with history expansion before running
setopt SHARE_HISTORY             # Share command history across open sessions
setopt INC_APPEND_HISTORY        # Write to history immediately upon command execution

# ------------------------------------------------------------------------------
# 3. Completion Settings
# ------------------------------------------------------------------------------
autoload -Uz compinit
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump-$ZSH_VERSION"

# Case-insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# Interactive menu selection
zstyle ':completion:*' menu select

# Colored completion matches
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Automatic rehash when new binaries are added to PATH
zstyle ':completion:*' rehash true

# Cache completion results
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"

# ------------------------------------------------------------------------------
# 4. Oh My Zsh Initialization
# ------------------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="" # Prompt handled by Starship

# Core productivity plugins
plugins=(
  git
  zsh-autosuggestions
  history-substring-search
  zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"

# ------------------------------------------------------------------------------
# 5. Keybindings & Line Editing
# ------------------------------------------------------------------------------
# History substring search with Up / Down arrows
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Word navigation: Ctrl+Left / Ctrl+Right
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Word deletion: Alt+Backspace / Alt+D
bindkey '^[^?' backward-kill-word
bindkey '^[d' kill-word

# Accept autosuggestion with Ctrl+Space
bindkey '^ ' autosuggest-accept

# ------------------------------------------------------------------------------
# 6. Tool Integrations & Aliases
# ------------------------------------------------------------------------------
# Zoxide (smart directory jumping)
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
  alias cd='z'
fi

# FZF (fuzzy finder)
export FZF_DEFAULT_OPTS="
--height=40%
--layout=reverse
--border
--cycle
"
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

# Colorized core utilities
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# ------------------------------------------------------------------------------
# 7. Starship Prompt
# ------------------------------------------------------------------------------
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
