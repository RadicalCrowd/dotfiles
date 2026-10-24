return {
  -- Theme: Catppuccin Mocha (Default)
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
      integrations = {
        blink_cmp = true,
        gitsigns = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        snacks = true,
        mini = true,
        treesitter = true,
      },
    },
  },

  -- Theme: Gruvbox Retro Dark (Warm Earthy Vintage)
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      contrast = "hard",
      transparent_mode = false,
    },
  },

  -- Theme: Tokyo Night
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      style = "night",
    },
  },

  -- Configure LazyVim to load Catppuccin Mocha by default
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
