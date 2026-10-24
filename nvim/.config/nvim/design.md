# Neovim Design Specification

Canonical design rules, ergonomic invariants, requirements, and visual grammar contract for the Neovim environment on Arch Linux (`ak10`).

---

## 1. Design Axioms & Ergonomic Invariants

1. **Zero-Maintenance Upstream Stability**:
   - The editor is anchored on **LazyVim** over raw Neovim. Upstream maintains and tests core plugin APIs, ensuring version-locked stability and zero breakage when Neovim or plugins update.
   - User configuration is strictly isolated in `~/.config/nvim/lua/plugins/` and `~/.config/nvim/lua/config/`.
2. **Neovim-Tmux Muscle Memory Parity**:
   - Navigation and window operations must behave identically whether inside Neovim or at the tmux shell.
   - Using the **SpaceFN** layer (translated to `A-` Alt chords), `Space + e/s/d/f` hops between editor splits and seamlessly crosses into adjacent tmux panes at editor boundaries via `smart-splits.nvim`.
   - Pane actions are 100% mirrored:
     - `Space + r`: Vertical Split (`:vsplit`)
     - `Space + x`: Horizontal Split (`:split`)
     - `Space + z`: Zoom / Maximize Toggle
     - `Space + q`: Close Active Split / Buffer
3. **Monospace Punctuation Visual Language**:
   - Aligned with the punctuation visual grammar established in `~/.config/starship.toml` and tmux: `[ ] { } \ | ; : < > , . ? / ! * + -`.
   - Lualine, Gitsigns, and Diagnostics discard decorative powerline symbols in favor of clean typographic punctuation boundaries.
4. **Pure Code Philosophy**:
   - In-editor AI companions and MCP server daemons are intentionally excluded from Neovim to keep the editor lightweight, distraction-free, and cold-starting in under 35ms.
   - AI engineering agents (Antigravity, Claude Code, Pi) operate exclusively in adjacent tmux panes.
5. **Obsidian Vault Cohesion**:
   - First-class live rendering of markdown tables, callout blocks (`[!NOTE]`, `[!TIP]`), KaTeX math, and checkboxes (`- [ ]`, `- [/]`, `- [x]`) via `render-markdown.nvim`.
   - Wikilink navigation (`[[NoteName]]`) resolves relative vault notes on `<CR>`.

---

## 2. Visual Punctuation Grammar (Neovim Mapping)

| Syntax Element | Punctuation Format | Visual Role |
|---|---|---|
| **Editor Mode** | `[NORMAL]`, `[INSERT]`, `[VISUAL]` | Mode boundary container |
| **Git Branch** | `<main*>` | Angle bracket repository boundary with uncommitted indicator |
| **File Context** | `[src/main.rs]` | Relative path container with state tags (`[!]` modified, `[ro]` read-only) |
| **Diagnostics** | `!2 warnings \| ?1 hint` | Exclamation and question mark severity badges |
| **Git Signs** | `+` (add), `!` (change), `-` (delete) | Signcolumn diff markers |
| **Time Badge** | `[; %H:%M]` | Semicolon duration/clock separator |
| **Todo Tags** | `[ ] TODO`, `! FIX`, `* HACK`, `:: NOTE` | Comment highlight badges |
| **Callout Blocks** | `:: NOTE`, `:: TIP`, `:: WARN` | Markdown rendered admonitions |

---

## 3. Left-Hand Keymap Cluster & Parity Specification

All layout actions operate without touching physical Ctrl or Alt keys:

| Chord (Hold Space) | Inside Neovim | Tmux Equivalent |
|---|---|---|
| **`Space + e`** (`A-e`) | Move to split **Up** (crosses to tmux) | Focus pane Up |
| **`Space + s`** (`A-s`) | Move to split **Left** (crosses to tmux) | Focus pane Left |
| **`Space + d`** (`A-d`) | Move to split **Down** (crosses to tmux) | Focus pane Down |
| **`Space + f`** (`A-f`) | Move to split **Right** (crosses to tmux) | Focus pane Right |
| **`Space + r`** (`A-r`) | **Split Vertical** (`:vsplit`) | Split pane vertical |
| **`Space + x`** (`A-x`) | **Split Horizontal** (`:split`) | Split pane horizontal |
| **`Space + z`** (`A-z`) | **Toggle Zoom** (maximize/restore split) | Zoom pane fullscreen |
| **`Space + q`** (`A-q`) | **Close Split / Buffer** | Close active pane |

---

## 4. Curated Plugin Suite

- **Completion**: `blink.cmp` (Rust-powered fuzzy completion and snippet expansion).
- **Navigation**: `mrjones2014/smart-splits.nvim` (bidirectional Neovim-tmux boundary crossing).
- **File Exploration**: `stevearc/oil.nvim` (edit directories as text buffers) + `folke/snacks.nvim` (fast fuzzy picker).
- **Jump Navigation**: `folke/flash.nvim` (2-keystroke jump to anywhere on screen).
- **Git**: `lewis6991/gitsigns.nvim` + floating LazyGit (`<leader>gg`).
- **Markdown & Vault**: `MeanderingProgrammer/render-markdown.nvim` with custom Obsidian callouts and checkboxes.
- **Themes**: `catppuccin/nvim` (Mocha default), `ellisonleao/gruvbox.nvim`, and `folke/tokyonight.nvim`.
