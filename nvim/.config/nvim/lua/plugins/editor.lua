-- ==============================================================================
-- Editor Plugins: Oil.nvim, Flash.nvim, Todo-Comments, Markdown & Git
-- ==============================================================================

return {
  -- Oil.nvim: Edit filesystem like a normal vim buffer
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      default_file_explorer = true,
      columns = { "icon" },
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 2,
        max_width = 90,
        max_height = 0,
        border = "single",
      },
    },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory with Oil" },
      { "<leader>e", "<cmd>Oil<cr>", desc = "File Explorer (Oil)" },
    },
  },

  -- Flash.nvim: 2-keystroke jump to anywhere on screen
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        search = {
          enabled = false, -- keep native / search untouched
        },
      },
    },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },

  -- Todo-Comments: Punctuation-tagged comments (Max 2 chars per sign)
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = true,
      keywords = {
        FIX = { icon = "! ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
        TODO = { icon = "# ", color = "info" },
        HACK = { icon = "* ", color = "warning" },
        WARN = { icon = "! ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = "> ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = ": ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "? ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
    },
    keys = {
      { "<leader>st", "<cmd>TodoSnacks<cr>", desc = "Search Todo Comments" },
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
    },
  },

  -- Markdown Live Rendering & Obsidian Callouts
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
    opts = {
      heading = {
        enabled = true,
        sign = true,
        position = "overlay",
        icons = { "◉ ", "○ ", "✸ ", "✿ ", "◆ ", "◇ " },
        signs = { "󰫎 " },
        width = "full",
        left_pad = 1,
        right_pad = 1,
        min_width = 0,
        border = false,
        backgrounds = {
          "RenderMarkdownH1Bg",
          "RenderMarkdownH2Bg",
          "RenderMarkdownH3Bg",
          "RenderMarkdownH4Bg",
          "RenderMarkdownH5Bg",
          "RenderMarkdownH6Bg",
        },
        foregrounds = {
          "RenderMarkdownH1",
          "RenderMarkdownH2",
          "RenderMarkdownH3",
          "RenderMarkdownH4",
          "RenderMarkdownH5",
          "RenderMarkdownH6",
        },
      },
      paragraph = {
        enabled = true,
        left_margin = 0,
        min_width = 0,
      },
      code = {
        enabled = true,
        sign = false,
        style = "full",
        position = "right",
        language_pad = 1,
        language_name = true,
        language_icon = true,
        width = "block",
        left_pad = 2,
        right_pad = 2,
        border = "thin",
        above = "▄",
        below = "▀",
        highlight = "RenderMarkdownCode",
        highlight_inline = "RenderMarkdownCodeInline",
      },
      dash = {
        enabled = true,
        icon = "─",
        width = "full",
        highlight = "RenderMarkdownDash",
      },
      bullet = {
        enabled = true,
        icons = { "●", "○", "◆", "◇" },
        left_pad = 0,
        right_pad = 1,
        highlight = "RenderMarkdownBullet",
      },
      checkbox = {
        enabled = true,
        position = "inline",
        unchecked = {
          icon = "󰄱 ",
          highlight = "RenderMarkdownUnchecked",
        },
        checked = {
          icon = "󰄵 ",
          highlight = "RenderMarkdownSuccess",
        },
        custom = {
          in_progress = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownWarn" },
          todo_slash = { raw = "[/]", rendered = "󰥔 ", highlight = "RenderMarkdownWarn" },
          cancelled = { raw = "[~]", rendered = "󰅖 ", highlight = "RenderMarkdownError" },
          important = { raw = "[!]", rendered = "󰀪 ", highlight = "RenderMarkdownWarn" },
        },
      },
      quote = {
        enabled = true,
        icon = "▋",
        repeat_linebreak = false,
        highlight = {
          "RenderMarkdownQuote1",
          "RenderMarkdownQuote2",
          "RenderMarkdownQuote3",
          "RenderMarkdownQuote4",
          "RenderMarkdownQuote5",
          "RenderMarkdownQuote6",
        },
      },
      pipe_table = {
        enabled = true,
        preset = "single",
        style = "full",
        cell = "padded",
        alignment_indicator = "━",
        border = { "┌", "┬", "┐", "├", "┼", "┤", "└", "┴", "┘", "│", "─" },
        head = "RenderMarkdownTableHead",
        row = "RenderMarkdownTableRow",
        padding = 1,
      },
      callout = {
        note = { raw = "[!NOTE]", rendered = "󰋽 Note", highlight = "RenderMarkdownInfo" },
        tip = { raw = "[!TIP]", rendered = "󰌶 Tip", highlight = "RenderMarkdownSuccess" },
        important = { raw = "[!IMPORTANT]", rendered = "󰅾 Important", highlight = "RenderMarkdownHint" },
        warning = { raw = "[!WARNING]", rendered = "󰀪 Warning", highlight = "RenderMarkdownWarn" },
        caution = { raw = "[!CAUTION]", rendered = "󰳦 Caution", highlight = "RenderMarkdownError" },
        danger = { raw = "[!DANGER]", rendered = "󱐌 Danger", highlight = "RenderMarkdownError" },
        bug = { raw = "[!BUG]", rendered = "󰨰 Bug", highlight = "RenderMarkdownError" },
        example = { raw = "[!EXAMPLE]", rendered = "󰉹 Example", highlight = "RenderMarkdownHint" },
        quote = { raw = "[!QUOTE]", rendered = "󱆨 Quote", highlight = "RenderMarkdownQuote" },
        todo = { raw = "[!TODO]", rendered = "󰗡 Todo", highlight = "RenderMarkdownInfo" },
      },
      link = {
        enabled = true,
        image = "󰥶 ",
        email = "󰀓 ",
        hyperlink = "󰌹 ",
        highlight = "RenderMarkdownLink",
        wiki = {
          enabled = true,
          icon = "󱗖 ",
          conceal_destination = true,
          highlight = "RenderMarkdownWikiLink",
        },
      },
      win_options = {
        conceallevel = {
          default = vim.api.nvim_get_option_value("conceallevel", {}),
          rendered = 3,
        },
        concealcursor = {
          default = vim.api.nvim_get_option_value("concealcursor", {}),
          rendered = "nc",
        },
      },
      anti_conceal = {
        enabled = true,
        disabled_modes = { "n" },
        ignore = {
          code_background = true,
          indent = true,
          sign = true,
          virtual_lines = true,
        },
      },
    },
  },

  -- Markdownlint configuration: suppress line-length and HTML warnings
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      local lint = require("lint")
      local md = lint.linters["markdownlint-cli2"]
      if md then
        local cfg = vim.fn.expand("~/.markdownlint.json")
        if vim.fn.filereadable(cfg) == 1 then
          md.args = { "--config", cfg, "-" }
        end
      end
    end,
  },

  -- Floating LazyGit integration & Zen Mode
  {
    "folke/snacks.nvim",
    opts = {
      lazygit = {
        configure = true,
      },
      zen = {
        toggles = {
          dim = false,
        },
        win = {
          width = 120,
        },
      },
    },
    keys = {
      { "<leader>gg", function() Snacks.lazygit() end, desc = "LazyGit (Floating Popup)" },
      { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode (Centered Reading)" },
    },
  },
}
