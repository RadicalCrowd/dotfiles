-- ==============================================================================
-- Monospace Punctuation Visual Language UI
-- Follows Starship and Tmux visual grammar: [ ] { } \ | ; : < > , . ? / ! * + -
-- ==============================================================================

return {
  -- Statusline: Lualine styled with punctuation syntax
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = opts.options or {}
      opts.options.section_separators = { left = "", right = "" }
      opts.options.component_separators = { left = "::", right = "|" }

      opts.sections.lualine_a = {
        {
          "mode",
          fmt = function(str)
            return "[" .. str .. "]"
          end,
        },
      }

      opts.sections.lualine_b = {
        {
          "branch",
          icon = "",
          fmt = function(str)
            return str ~= "" and "<" .. str .. ">" or ""
          end,
        },
      }

      opts.sections.lualine_c = {
        {
          "filename",
          path = 1,
          symbols = {
            modified = " [!]",
            readonly = " [ro]",
            unnamed = " [unnamed]",
            newfile = " [+]",
          },
        },
      }

      opts.sections.lualine_x = {
        {
          "diagnostics",
          symbols = {
            error = "! ",
            warn = "! ",
            info = "i ",
            hint = "? ",
          },
        },
        { "diff", symbols = { added = "+", modified = "!", removed = "-" } },
      }

      opts.sections.lualine_y = {
        {
          "filetype",
          fmt = function(str)
            return str ~= "" and "[ " .. str .. " ]" or ""
          end,
        },
      }

      opts.sections.lualine_z = {
        {
          function()
            return "[; " .. os.date("%H:%M") .. "]"
          end,
        },
      }
    end,
  },

  -- Gitsigns: Punctuation indicators in signcolumn
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "!" },
        delete = { text = "-" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "?" },
      },
      current_line_blame = false,
      current_line_blame_opts = {
        delay = 300,
      },
    },
    keys = {
      { "<leader>ub", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle Git Line Blame" },
    },
  },

  -- Diagnostic Signs (Punctuation)
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.diagnostics = opts.diagnostics or {}
      opts.diagnostics.signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "!",
          [vim.diagnostic.severity.WARN] = "!",
          [vim.diagnostic.severity.HINT] = "?",
          [vim.diagnostic.severity.INFO] = "i",
        },
      }
    end,
  },
}
