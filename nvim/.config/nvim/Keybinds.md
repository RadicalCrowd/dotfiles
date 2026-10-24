---
type: resource
status: active
para: area
area: SystemConfig
owner: akif
created: 2026-10-24
updated: 2026-10-24
tags: [systemconfig, nvim, neovim, keybinds, cheatsheet, spacefn, shortcuts]
---

# Neovim Keybinds & Ergonomic Cheat Sheet

Comprehensive reference guide for all custom, SpaceFN, Obsidian vault, and LazyVim keybinds configured in `~/.config/nvim/`.

[[03-Areas/SystemConfig/nvim/README|nvim Overview]] · [[03-Areas/SystemConfig/nvim/design|Neovim Design Spec]] · [[03-Areas/SystemConfig/tmux/README|tmux Overview]]

---

## 1. SpaceFN Left-Hand Navigation Cluster (Neovim & Tmux Parity)

All window and split actions operate without touching physical `Ctrl` or `Alt` keys via the **SpaceFN** layer (translated to `Alt` chords via `keyd`):

| Chord (Hold Space) | Raw Chord | Action in Neovim | Tmux Equivalent |
|---|---|---|---|
| **`Space + e`** | `A-e` | Move to split **Up** (crosses to tmux) | Focus pane Up |
| **`Space + s`** | `A-s` | Move to split **Left** (crosses to tmux) | Focus pane Left |
| **`Space + d`** | `A-d` | Move to split **Down** (crosses to tmux) | Focus pane Down |
| **`Space + f`** | `A-f` | Move to split **Right** (crosses to tmux) | Focus pane Right |
| **`Space + r`** | `A-r` | **Split Vertical** (`:vsplit`) | Split pane vertical |
| **`Space + x`** | `A-x` | **Split Horizontal** (`:split`) | Split pane horizontal |
| **`Space + z`** | `A-z` | **Toggle Zoom** (maximize/restore split) | Zoom pane fullscreen |
| **`Space + q`** | `A-q` | **Close Split / Buffer** | Close active pane |

*Note: All SpaceFN navigation chords function in Normal, Insert, Visual, and Terminal modes.*

---

## 2. Obsidian Vault & Periodic Daily Notes

Built-in daily note generator matching Obsidian's Daily Notes plugin with automated template expansion:

| Keybind | Mode | Description |
|---|---|---|
| **`d`** | Normal (Home Dashboard) | Open Today's Daily Note (scaffolds from template if missing) |
| **`<leader>od`** | Normal | Open Today's Daily Note (creates missing note) |
| **`<leader>dd`** | Normal | Double-tap alias for Today's Daily Note |
| **`<leader>dn`** | Normal | Explicit alias: New / Today's Daily Note |
| **`<leader>ol`** | Normal | Open Latest Existing Daily Note in history |
| **`<leader>dl`** | Normal | Alias: Open Latest Existing Daily Note in history |
| **`<CR>` on `[[Wikilink]]`** | Normal | Jump to target note in vault (`~/Obsidian-Vaults/RadicallyInsane`) |
| **`za` / `l` on line 1** | Normal | Toggle folded YAML frontmatter |

---

## 3. Distraction-Free Writing & Markdown Controls

| Keybind | Mode | Description |
|---|---|---|
| **`<leader>z`** | Normal | **Toggle Centered Zen Mode** (110-col margins, Obsidian readable length) |
| **`<leader>um`** | Normal | **Toggle Markdown Live Rendering** (render-markdown on/off) |
| **`<leader>cp`** | Normal | **Markdown Preview** in web browser |
| **`<leader>ul`** | Normal | **Toggle Line Numbers** (between clean hidden gutter and numbers) |
| **`<leader>us`** | Normal | **Toggle Spell Check** |

---

## 4. Theme Switcher & Visual Customization

| Keybind | Mode | Description |
|---|---|---|
| **`<leader>ut`** | Normal | **Theme Switcher** (live fuzzy preview across Tokyo Night, Kanagawa, Gruvbox, Rose Pine) |
| **`<leader>uC`** | Normal | Upstream Colorscheme Picker |

---

## 5. File Navigation & Motion

| Keybind | Mode | Description |
|---|---|---|
| **`<C-b>`** | Normal / Insert / Visual / Term | **Toggle Sidebar File Explorer** (Fresh editor & VS Code parity) |
| **`-`** | Normal | Open parent directory in **Oil.nvim** (edit filesystem as a text buffer) |
| **`<leader>e`** | Normal | Open **Oil.nvim** file explorer |
| **`s`** | Normal / Visual | **Flash Jump** (2-keystroke jump to any word/character on screen) |
| **`S`** | Normal / Visual | **Flash Treesitter** node selection jump |
| **`<leader><space>`** | Normal | Find Files (Snacks fuzzy picker) |
| **`<leader>ff`** | Normal | Find Files alias |
| **`<leader>fr`** | Normal | Recent Files |
| **`<leader>sg`** | Normal | Live Grep search across repository/vault |
| **`<leader>bb`** / **`<leader>,`** | Normal | Switch Buffer |
| **`<leader>bd`** | Normal | Delete / Close active buffer |

---

## 6. Todo Comments & Code Annotation

| Keybind | Mode | Description |
|---|---|---|
| **`<leader>st`** | Normal | Search Todo Comments across workspace (`TODO`, `FIX`, `HACK`, `WARN`) |
| **`]t`** | Normal | Jump to next Todo comment |
| **`[t`** | Normal | Jump to previous Todo comment |

---

## 7. Git Workflow

| Keybind | Mode | Description |
|---|---|---|
| **`<leader>gg`** | Normal | Open **Floating LazyGit** popup window |
| **`<leader>ub`** | Normal | Toggle Git Line Blame in the gutter |

---

## 8. Basic Editing Ergonomics

| Keybind | Mode | Description |
|---|---|---|
| **`<C-s>`** | Insert / Normal / Visual | **Quick Save** file |
| **`<Esc>`** | Insert / Normal | Clear search highlights and escape |
| **`<`** / **`>`** | Visual | Indent lines without losing visual selection (`<gv`, `>gv`) |
