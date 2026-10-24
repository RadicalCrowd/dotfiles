# tmux

High-ergonomics terminal multiplexer environment for Arch Linux (`ak10`) designed around the **SpaceFN** keyboard layer, monospace punctuation visual language, dedicated left vertical sidebar, and standalone theme switching between Catppuccin Mocha and Gruvbox Retro Dark. Managed via GNU Stow.

- `~/.config/tmux/tmux.conf` ← `tmux/.config/tmux/tmux.conf`
- `~/.config/tmux/themes/` ← `tmux/.config/tmux/themes/`
- `~/.config/tmux/scripts/` ← `tmux/.config/tmux/scripts/`
- `design.md` ← Canonical design specification & requirements

---

## 1. Key Architecture & Design Invariants

- **Zero-Modifier Operation**: Day-to-day multiplexer control never requires physical `Ctrl` or `Alt` chording. The left hand remains anchored on the ESDF home row cluster while the thumb uses the spacebar as a modal layer (`SpaceFN` via `keyd`).
- **Monospace Punctuation Visual Language**: Follows the punctuation design language of the Starship shell prompt (`starship.toml`). All status lines, window tags, and sidebars strictly utilize ASCII punctuation characters: `[ ] { } \ | ; : < > , . ? / ! * + -`.
- **Compositor Isolation**: `keyd` maps exclusively to Alt chords (`A-`), guaranteeing zero conflict with GNOME Wayland compositor shortcuts (`<Super>1..9`, `<Super>a`, `<Super>s`).
- **Automatic Game Exemption**: A kernel event daemon (`keyd-auto-exempt.service`) detects when games like Minecraft or Steam gain focus, automatically restoring Spacebar to a raw physical key so you can sprint-jump, swim, and hold space with zero delay.
- **Zero-Dependency Startup**: Instant (<5ms) cold startup using pure native tmux configuration and POSIX shell scripts; no TPM plugin overhead.

---

## 2. SpaceFN Cheat Sheet (Left-Hand Cluster)

> **Typing Feel**: Tap Space to insert a normal space character. Hold Space with your left thumb to activate the multiplexer layer.

### Directional Pane Navigation (ESDF)

```text
       [ E ] : Pane Up (^)
 [ S ] [ D ] [ F ] : Left (<) | Down (v) | Right (>)
```

| Key (Hold Space) | Action | Tmux Directive |
|---|---|---|
| **`e`** | Navigate Pane **Up** | `select-pane -U` |
| **`s`** | Navigate Pane **Left** | `select-pane -L` |
| **`d`** | Navigate Pane **Down** | `select-pane -D` |
| **`f`** | Navigate Pane **Right** | `select-pane -R` |

### Pane & Window Management

| Key (Hold Space) | Action | Symbol | Tmux Directive |
|---|---|---|---|
| **`r`** | **Split Vertical** (side-by-side) | `\|` | `split-window -h -c "#{pane_current_path}"` |
| **`x`** | **Split Horizontal** (top/bottom) | `-` | `split-window -v -c "#{pane_current_path}"` |
| **`z`** | **Toggle Zoom** (maximize/restore pane) | `*z*` | `resize-pane -Z` |
| **`q`** | **Close Active Pane** (prompts confirmation) | `[x]` | `confirm-before -p "kill-pane #P? (y/n)" kill-pane` |
| **`b`** | **New Window** (tab) | `[+]` | `new-window -c "#{pane_current_path}"` |

### Window (Tab) Direct Selection Index

Direct 1-key jumps to windows without searching or cycling:

| Key (Hold Space) | Target Window |
|---|---|
| **`2`** | Window 1 |
| **`3`** | Window 2 |
| **`4`** | Window 3 |
| **`5`** | Window 4 |
| **`g`** | Window 5 |
| **`a`** | Window 6 |
| **`w`** | Window 7 |
| **`c`** | Window 8 |
| **`t`** | Window 9 |

---

## 3. Monospace Punctuation Status Line

```text
[0] ::  [!1:zsh*!]  [2:nvim]  [3:build]                         :: [; 11:05] | <ak10>
```

- **Session**: `[session] :: ` with boundary brackets and scope separator.
- **Active Tab**: `[!#I:#W!]` with green active exclamation indicators and `*` focus marker.
- **Inactive Tab**: `[#I:#W]` with muted boundary brackets.
- **Zoomed State**: `[*z*]` indicator.
- **Duration / Time**: `[; %H:%M]` matching shell execution duration syntax.
- **Host**: `<#h>` angle bracket container.

---

## 4. Dedicated Left Sidebar (`Space + \`)

Pressing **`Space + \`** toggles a fixed 30-character vertical pane pinned to the left edge (`~/.config/tmux/scripts/sidebar.sh`):

```text
┌── [TMUX] ──────────────────┐
│ :: session : [dev]         │
├── {WINDOWS} ───────────────┤
│ [!1!] zsh *                │
│ [#2]  nvim                 │
├── <SPACEFN> ───────────────┤
│ e:^   s:<   d:v   f:>      │
│ r:|   x:-   z:[z] q:[x]    │
│ b:[+] (new window)         │
├── ;JUMP; ──────────────────┤
│ 2:W1  3:W2  4:W3  5:W4     │
│ g:W5  a:W6  w:W7  c:W8     │
│ t:W9                       │
└── [\:toggle | y:theme] ────┘
```

---

## 5. Instant Theme Switcher (`Space + y`)

Pressing **`Space + y`** instantly swaps runtime color palettes without restarting sessions:
- **Catppuccin Mocha** (Default): Pastel dark theme with cyan/blue accents and surface2 framing.
- **Gruvbox Retro Dark**: High-contrast warm aesthetic with aqua/yellow accents and earthy backgrounds.
- Active theme state is persisted in `~/.config/tmux/.current-theme`.

---

## 6. Wayland Native Clipboard & Copy Mode

- **Enter Copy Mode**: Mouse wheel scroll-up or `Space + [`.
- **Navigation**: `e` (up), `s` (left), `d` (down), `f` (right).
- **Selection**: `v` (character select), `V` (line select).
- **Yank**: `y` copies directly to system clipboard via `wl-copy`.
- **Mouse Drag**: Highlighting text automatically yanks to Wayland clipboard.

---

## 7. Install & Deployment

Requires GNU Stow and `keyd`:

```bash
# Stow tmux configuration
cd ~/dotfiles
stow -v -t ~ tmux

# Verify symlink
ls -la ~/.config/tmux/tmux.conf
```

For complete specification, design rules, and requirements, see [`design.md`](design.md).
