# Tmux & SpaceFN Design Specification

Canonical design rules, requirements, ergonomic invariants, and punctuation visual language grammar for the tmux environment on Arch Linux (`ak10`).

---

## 1. Design Axioms & Ergonomic Invariants

1. **Zero-Modifier Anchoring**:
   - Daily terminal multiplexing must never require physical `Ctrl` or `Alt` key chording with pinky stretching.
   - The left hand remains anchored on the ESDF home row cluster; the left thumb actuates the Spacebar as a modal layer (`SpaceFN`).
2. **Monospace Punctuation Visual Language**:
   - Status lines, window tags, and sidebars strictly utilize ASCII punctuation marks: `( ) [ ] { } \ | ; ' : " < > , . ? / ! @ # $ % ^ & * _ +`.
   - Powerline block glyphs, icons, and wordy text labels are forbidden. Visual clarity is achieved through typographic weight, color contrast, and punctuation grammar.
3. **Compositor Isolation & Safety**:
   - The keyboard daemon (`keyd`) must never broadcast `Super` (`M-`) chords for internal multiplexer actions to prevent conflicts with Wayland/GNOME Shell compositor shortcuts (`<Super>1..9`, `<Super>a`, `<Super>s`).
   - SpaceFN mappings translate held chords strictly to `A-` (Alt chords), which terminal emulators forward transparently as escape sequences (`\e`).
4. **Zero-Dependency Startup**:
   - Cold startup latency must remain under 5ms.
   - Zero reliance on external plugin managers (e.g. TPM) or network fetches. All themes, sidebars, and toggles are written in pure native tmux configuration and POSIX shell scripts.
5. **Context Continuity**:
   - All newly spawned panes and windows must inherit the active working directory (`-c "#{pane_current_path}"`).
   - Windows and panes must be 1-indexed (`base-index 1`, `pane-base-index 1`) with automatic gap renumbering (`renumber-windows on`).
6. **Automatic Gaming Exemption (Zero Manual Toggles)**:
   - Games (such as Minecraft) require sustained holding of the Spacebar for jumping, swimming, and sprint-jumping.
   - An event-driven background service (`keyd-auto-exempt.service`) automatically detects when Minecraft or 3D games gain focus and dynamically binds `main.space = space`.
   - When switching back to terminal emulators, SpaceFN re-engages instantaneously. No manual toggles, hotkeys, or modal modes are required.

---

## 2. Punctuation Visual Language Grammar

The typographic layout directly reflects the punctuation language established in `~/.config/starship.toml`:

| Glyph / Sequence | Typographic Role | Usage in Tmux / Sidebar | Example |
|---|---|---|---|
| `[ ]` | Outer boundary container | Encloses sessions, inactive windows, active tabs, and time blocks | `[0]`, `[1:zsh]`, `[; 09:15]` |
| `::` | Scope separator | Architectural boundary between session state and window lists | `[0] :: [!1:zsh*!]` |
| `!` | Active state indicator | Wraps the active window index and tab border | `[!1:zsh*!]` |
| `*` | In-progress / focused marker | Marks the active window in sidebar and zoomed states | `[!1!] zsh *` |
| `*z*` | Zoom / Maximize state | Indicates a pane is currently fullscreened | `[!1:zsh [*z*]!]` |
| `;` | Duration / temporal separator | Precedes the time display in status-right | `[; %H:%M]` |
| `< >` | Host / machine container | Demarcates the workstation hostname boundary | `<ak10>` |
| `\|` | Pipeline delimiter | Divides distinct metric segments in the status bar | `[; 09:15] \| <ak10>` |
| `^` `<` `v` `>` | Direction vectors | Concise directional cues in the sidebar cheatsheet | `e:^ s:< d:v f:>` |
| `+` | Add / Create verb | Indicates window creation | `b:[+]` |
| `-` | Horizontal split indicator | Represents horizontal divider line | `x:-` |
| `┌ ┐ ├ ┤ └ ┘` | Box-drawing framing | Monospace border structure for the dedicated sidebar | See Sidebar Layout |

---

## 3. Left-Hand Keymap Cluster Specification

### Directional Cluster (ESDF)
Positioned directly on the natural typing home cluster (shifted one key right from WASD):

```text
       [ E ] : Pane Up (^)
 [ S ] [ D ] [ F ] : Left (<) | Down (v) | Right (>)
```

### Action Verbs Surrounding ESDF
Every pane management action is accessible via single-key reach from the left hand while holding Space:

- **`Space + r`** (`A-r`): Split Pane Vertical (side-by-side, visual `|`)
- **`Space + x`** (`A-x`): Split Pane Horizontal (top/bottom, visual `-`)
- **`Space + z`** (`A-z`): Toggle Zoom (`*z*` fullscreen maximize/restore)
- **`Space + q`** (`A-q`): Close Active Pane (prompts confirmation: `kill-pane #P?`)
- **`Space + b`** (`A-b`): New Window / Tab (`+`)

### Window (Tab) Direct Selection Index
Direct window switching operates without searching or sequential cycling:

| Key (Hold Space) | Target Window | Mapped Keyd Chord |
|---|---|---|
| **`2`** | Window 1 | `A-2` |
| **`3`** | Window 2 | `A-3` |
| **`4`** | Window 3 | `A-4` |
| **`5`** | Window 5 | `A-5` |
| **`g`** | Window 5 | `A-g` |
| **`a`** | Window 6 | `A-a` |
| **`w`** | Window 7 | `A-w` |
| **`c`** | Window 8 | `A-c` |
| **`t`** | Window 9 | `A-t` |

---

## 4. Dedicated Left Sidebar Architecture

- **Invocation**: Toggled via `Space + \` (`A-\`), executed by `~/.config/tmux/scripts/sidebar-toggle.sh`.
- **Dimensions**: Fixed 30-character horizontal split pinned to the left edge (`split-window -b -h -l 30`).
- **Render Engine**: Pure POSIX bash loop (`~/.config/tmux/scripts/sidebar.sh`) with `tput civis` cursor hiding, 2-second trap-aware refresh loop, and dynamic truncation ensuring right borders never overflow.
- **Visual Structure**:

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

## 5. Dual-Theme Palette & Runtime Switching

Theme toggling occurs instantly in runtime via `Space + y` (`A-y`), invoking `toggle-theme.sh`. The active selection is preserved in `~/.config/tmux/.current-theme`.

### Palette A: Catppuccin Mocha (Default)
- Base Background: `#1e1e2e`
- Default Text: `#cdd6f4`
- Boundary / Accent: Cyan (`#89dceb`)
- Inactive Muted: Surface2 (`#585b70`)
- Active Highlight: Green (`#a6e3a1`) & Blue (`#89b4fa`)
- Warning / State: Yellow (`#f9e2af`) & Magenta (`#cba6f7`)

### Palette B: Gruvbox Retro Dark
- Base Background: `#282828`
- Default Text: `#ebdbb2`
- Boundary / Accent: Aqua (`#8ec07c`)
- Inactive Muted: Surface2 (`#665c54`)
- Active Highlight: Green (`#b8bb26`) & Yellow (`#fabd2f`)
- Warning / State: Orange (`#fe8019`) & Purple (`#d3869b`)

---

## 6. Clipboard & Copy Mode Pipeline

- **Protocol**: Wayland native OSC-52 / `wl-copy`.
- **Trigger**: Mouse wheel scroll-up or `Space + [` (vi-mode).
- **Navigation**: ESDF keys bound inside `copy-mode-vi` table (`e`=up, `s`=left, `d`=down, `f`=right).
- **Selection**: `v` activates character selection; `V` activates line selection.
- **Yank**: `y` copies selection directly to system clipboard via `wl-copy` and cancels selection.
- **Mouse**: Left-click drag auto-copies on release (`MouseDragEnd1Pane`).

---

## 7. Packaging & System Deployment

- **GNU Stow Package**: `~/dotfiles/tmux/` links directly to `~/.config/tmux/`.
- **System Compatibility Symlink**: `~/.tmux.conf` contains `source-file ~/.config/tmux/tmux.conf` to support legacy tooling.
- **Keyd Daemon Location**: `~/dotfiles/keyd/etc/keyd/default.conf` symlinked to `/etc/keyd/default.conf`.
- **Restow Command**:
  ```bash
  cd ~/dotfiles && stow -v -R -t ~ tmux
  ```
