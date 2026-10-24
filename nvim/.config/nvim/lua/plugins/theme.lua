-- ==============================================================================
-- Curated Clean Themes: Tokyo Night, Kanagawa, Gruvbox, Rose Pine & Catppuccin
-- ==============================================================================

return {
  -- Theme 1: Tokyo Night (Default — Modern Deep Cyberpunk Indigo)
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night", -- 'storm', 'moon', 'night', 'day'
      transparent = false,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
      },
      on_highlights = function(hl, c)
        hl.RenderMarkdownH1 = { fg = c.blue, bold = true }
        hl.RenderMarkdownH2 = { fg = c.cyan, bold = true }
        hl.RenderMarkdownH3 = { fg = c.teal, bold = true }
        hl.RenderMarkdownH4 = { fg = c.green, bold = true }
        hl.RenderMarkdownH5 = { fg = c.magenta, bold = true }
        hl.RenderMarkdownH6 = { fg = c.orange, bold = true }
        hl.RenderMarkdownWikiLink = { fg = c.purple, bold = true }
        hl.RenderMarkdownLink = { fg = c.blue, underline = true }
        hl.RenderMarkdownUnchecked = { fg = c.dark5 }
        hl.RenderMarkdownSuccess = { fg = c.green }
        hl.RenderMarkdownWarn = { fg = c.yellow }
        hl.RenderMarkdownError = { fg = c.red }
        hl.RenderMarkdownTableHead = { fg = c.cyan, bold = true }
        hl.RenderMarkdownCode = { bg = c.bg_dark }
        hl.RenderMarkdownCodeInline = { bg = c.bg_highlight }
      end,
    },
  },

  -- Theme 2: Kanagawa (Ultra-Clean Japanese Woodblock & Sumi Ink Aesthetic)
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      undercurl = true,
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      transparent = false,
      dimInactive = false,
      terminalColors = true,
      theme = "dragon", -- 'wave', 'dragon', 'lotus'
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          RenderMarkdownH1 = { fg = theme.syn.special1, bold = true },
          RenderMarkdownH2 = { fg = theme.syn.identifier, bold = true },
          RenderMarkdownH3 = { fg = theme.syn.statement, bold = true },
          RenderMarkdownH4 = { fg = theme.syn.fun, bold = true },
          RenderMarkdownH5 = { fg = theme.syn.type, bold = true },
          RenderMarkdownH6 = { fg = theme.syn.constant, bold = true },
          RenderMarkdownWikiLink = { fg = theme.syn.keyword, bold = true },
          RenderMarkdownLink = { fg = theme.syn.special2, underline = true },
          RenderMarkdownUnchecked = { fg = theme.ui.nontext },
          RenderMarkdownSuccess = { fg = theme.diag.ok },
          RenderMarkdownWarn = { fg = theme.diag.warning },
          RenderMarkdownError = { fg = theme.diag.error },
          RenderMarkdownTableHead = { fg = theme.syn.special1, bold = true },
          RenderMarkdownCode = { bg = theme.ui.bg_m3 },
          RenderMarkdownCodeInline = { bg = theme.ui.bg_p2 },
        }
      end,
    },
  },

  -- Theme 3: Gruvbox Retro Dark (Warm Earthy Vintage)
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      contrast = "hard",
      transparent_mode = false,
      italic = {
        strings = false,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
    },
  },

  -- Theme 4: Rose Pine (Muted Soho Aesthetic)
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    opts = {
      variant = "moon", -- 'main', 'moon', 'dawn'
      dark_variant = "moon",
      styles = {
        bold = true,
        italic = true,
        transparency = false,
      },
    },
  },

  -- Theme 5: Catppuccin Mocha
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      transparent_background = false,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
      },
    },
  },

  -- Default Colorscheme: Tokyo Night
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
