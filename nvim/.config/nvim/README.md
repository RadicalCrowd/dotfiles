---
type: resource
status: active
para: area
area: SystemConfig
owner: akif
created: 2026-10-18
updated: 2026-10-24
tags: [systemconfig, editor, neovim, lazyvim, spacefn, stow, dotfiles, typography]
---

# nvim

Personal Neovim configuration built on **LazyVim**, unified with the **SpaceFN** keyboard layer, monospace punctuation visual language, and seamless bidirectional **tmux** integration. Managed as a GNU Stow package in the dotfiles repo.

| Item | Value |
|---|---|
| Dotfiles package | `~/dotfiles/nvim/` |
| Package directory | `nvim/.config/nvim/` |
| Live target | `~/.config/nvim/` (symlink into `~/dotfiles/nvim/.config/nvim/`) |
| Stow | `stow -v -t ~ nvim` |
| GitHub | [RadicalCrowd/dotfiles](https://github.com/RadicalCrowd/dotfiles) |

---

## 1. Key Features

- **Zero Maintenance**: Anchored on LazyVim; upstream handles core plugin APIs, ensuring version-locked stability and zero breakage when Neovim or plugins update.
- **Neovim-Tmux Parity**: `Space + e/s/d/f` hops between editor splits and crosses into adjacent tmux panes automatically at window boundaries via `smart-splits.nvim`.
- **Identical Layout Verbs**: `Space + r` (vsplit), `Space + x` (split), `Space + z` (zoom split), and `Space + q` (close split) work identically inside and outside Neovim.
- **Monospace Punctuation UI**: Lualine, Gitsigns, and Diagnostics styled with signature punctuation syntax (`[ ]`, `::`, `|`, `[; %H:%M]`, `<git>`).
- **Blink.cmp**: Sub-millisecond Rust-powered completion engine.
- **Oil.nvim**: Edit the filesystem like a normal text buffer (open with `-` or `<leader>e`).
- **Obsidian / Markdown Workflow**: In-editor live rendering of callouts (`[!NOTE]`, `[!TIP]`), tables, task checkboxes (`- [ ]`, `- [/]`, `- [x]`), and Enter-to-jump on `[[Wikilinks]]`.
- **Pure Code Policy**: Free of in-editor AI/MCP overhead; starts in under 35ms.

---

## 2. Notes in this folder

- [[design|Neovim Design Specification]] — Canonical design rules, ergonomic invariants, requirements, and visual grammar contract.
- [[Keybinds|Neovim Keybinds & Cheat Sheet]] — Comprehensive reference table covering SpaceFN, Obsidian daily notes, Zen mode, theme switcher, and navigation shortcuts.

---

## 3. Related

- [[03-Areas/SystemConfig/tmux/README|tmux Overview]] · [[03-Areas/SystemConfig/tmux/design|Tmux Design Spec]]
- [[03-Areas/SystemConfig/zsh/Zsh-Starship-Stow-Environment|Zsh + Starship Environment]]
- [[03-Areas/SystemConfig/README|SystemConfig Overview]] · [[03-Areas/SystemConfig/MOC|SystemConfig MOC]]
