# nvim

Personal Neovim configuration built on **LazyVim**, unified with the **SpaceFN** keyboard layer, monospace punctuation visual language, and seamless bidirectional **tmux** integration. Managed via GNU Stow.

- `~/.config/nvim/` ← `nvim/.config/nvim/`
- `design.md` ← Canonical design specification & requirements

---

## 1. Key Features

- **Zero Maintenance**: Built on LazyVim; upstream tests and adapts to Neovim core updates. You only maintain personal overrides in `lua/plugins/`.
- **Neovim-Tmux Parity**: `Space + e/s/d/f` hops between editor splits and crosses into adjacent tmux panes automatically at window boundaries.
- **Identical Layout Verbs**: `Space + r` (vsplit), `Space + x` (split), `Space + z` (zoom split), and `Space + q` (close) work identically inside and outside Neovim.
- **Monospace Punctuation UI**: Lualine, Gitsigns, and Diagnostics styled with your signature punctuation syntax (`[ ]`, `::`, `|`, `[; %H:%M]`, `<git>`).
- **Blink.cmp**: Sub-millisecond Rust-powered completion engine.
- **Oil.nvim**: Edit the filesystem like a normal text buffer (open with `-` or `<leader>e`).
- **Obsidian / Markdown Support**: In-editor live rendering of callouts (`[!NOTE]`, `[!TIP]`), tables, task checkboxes (`- [ ]`, `- [/]`, `- [x]`), and Enter-to-jump on `[[Wikilinks]]`.
- **Pure Code Policy**: Free of in-editor AI/MCP overhead; starts in under 35ms.

---

## 2. Keybindings Reference

### Window Navigation & Parity (SpaceFN Layer)

| Chord (Hold Space) | Action | Scope |
|---|---|---|
| **`Space + e`** | Move split **Up** | Neovim & Tmux |
| **`Space + s`** | Move split **Left** | Neovim & Tmux |
| **`Space + d`** | Move split **Down** | Neovim & Tmux |
| **`Space + f`** | Move split **Right** | Neovim & Tmux |
| **`Space + r`** | **Split Vertical** | Neovim (`:vsplit`) & Tmux |
| **`Space + x`** | **Split Horizontal** | Neovim (`:split`) & Tmux |
| **`Space + z`** | **Toggle Zoom** | Neovim & Tmux |
| **`Space + q`** | **Close Split / Buffer** | Neovim & Tmux |

### General Editor Shortcuts

| Shortcut | Action |
|---|---|
| **`-`** or **`<leader>e`** | Open parent directory in **Oil.nvim** |
| **`<leader><space>`** | Fuzzy find files (**Snacks picker**) |
| **`<leader>/`** | Live grep across project (**Snacks**) |
| **`<leader>gg`** | Open floating **LazyGit** popup |
| **`s`** / **`S`** | **Flash jump** anywhere on screen |
| **`<leader>st`** | Search **Todo-Comments** |
| **`<leader>ub`** | Toggle git line blame |
| **`<CR>`** (on `[[Note]]`) | Jump to target Obsidian markdown file |

---

## 3. Themes

- **Catppuccin Mocha** (Default)
- **Gruvbox Retro Dark**
- **Tokyo Night**

Swap themes anytime via `:colorscheme gruvbox` or `:colorscheme tokyonight`.

---

## 4. Install & Restow

```bash
cd ~/dotfiles
stow -v -R -t ~ nvim
```

For complete design rules and requirements, see [`design.md`](design.md).
