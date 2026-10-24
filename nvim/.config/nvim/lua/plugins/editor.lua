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

  -- Todo-Comments: Punctuation-tagged comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = true,
      keywords = {
        FIX = { icon = "! ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
        TODO = { icon = "[ ] ", color = "info" },
        HACK = { icon = "* ", color = "warning" },
        WARN = { icon = "! ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = "; ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = ":: ", color = "hint", alt = { "INFO" } },
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
    opts = {
      heading = {
        sign = false,
        icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
      },
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
        border = "thin",
      },
      checkbox = {
        enabled = true,
        unchecked = { icon = "[ ] " },
        checked = { icon = "[x] " },
        custom = {
          in_progress = { raw = "[-]", rendered = "[/] ", highlight = "RenderMarkdownWarn" },
        },
      },
      pipe_table = {
        preset = "single",
        border = { "┌", "┬", "┐", "├", "┼", "┤", "└", "┴", "┘", "│", "─" },
      },
      callout = {
        note = { raw = "[!NOTE]", rendered = ":: NOTE", highlight = "RenderMarkdownInfo" },
        tip = { raw = "[!TIP]", rendered = ":: TIP", highlight = "RenderMarkdownSuccess" },
        important = { raw = "[!IMPORTANT]", rendered = ":: IMPORTANT", highlight = "RenderMarkdownHint" },
        warning = { raw = "[!WARNING]", rendered = ":: WARNING", highlight = "RenderMarkdownWarn" },
        caution = { raw = "[!CAUTION]", rendered = ":: CAUTION", highlight = "RenderMarkdownError" },
      },
    },
  },

  -- Floating LazyGit integration
  {
    "folke/snacks.nvim",
    opts = {
      lazygit = {
        configure = true,
      },
    },
    keys = {
      { "<leader>gg", function() Snacks.lazygit() end, desc = "LazyGit (Floating Popup)" },
    },
  },
}
