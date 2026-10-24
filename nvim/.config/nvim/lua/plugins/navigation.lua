-- ==============================================================================
-- Neovim-Tmux Parity & Smart Splits (ESDF Navigation)
-- SpaceFN translates [Space + key] into Alt chords (A-e, A-s, A-d, A-f, etc.)
-- ==============================================================================

return {
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    opts = {
      ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" },
      ignored_buftypes = { "nofile" },
      resize = {
        amount = 3,
      },
      move = {
        at_edge = "wrap",
      },
    },
    keys = {
      -- Directional Window / Pane Navigation (ESDF)
      { "<A-e>", function() require("smart-splits").move_cursor_up() end, mode = { "n", "i", "v", "t" }, desc = "Move to window/pane up" },
      { "<A-s>", function() require("smart-splits").move_cursor_left() end, mode = { "n", "i", "v", "t" }, desc = "Move to window/pane left" },
      { "<A-d>", function() require("smart-splits").move_cursor_down() end, mode = { "n", "i", "v", "t" }, desc = "Move to window/pane down" },
      { "<A-f>", function() require("smart-splits").move_cursor_right() end, mode = { "n", "i", "v", "t" }, desc = "Move to window/pane right" },

      -- Parity: Split Verbs (Matches tmux Space + r and Space + x)
      { "<A-r>", "<cmd>vsplit<cr>", mode = { "n", "i", "v", "t" }, desc = "Split window vertical" },
      { "<A-x>", "<cmd>split<cr>", mode = { "n", "i", "v", "t" }, desc = "Split window horizontal" },

      -- Parity: Zoom / Maximize Window Toggle (Matches tmux Space + z)
      {
        "<A-z>",
        function()
          if vim.t.maximized then
            vim.cmd("wincmd =")
            vim.t.maximized = false
          else
            vim.cmd("wincmd _ | wincmd |")
            vim.t.maximized = true
          end
        end,
        mode = { "n", "i", "v", "t" },
        desc = "Toggle zoom active window",
      },

      -- Parity: Close Split / Window (Matches tmux Space + q)
      {
        "<A-q>",
        function()
          if #vim.api.nvim_tabpage_list_wins(0) > 1 then
            vim.cmd("close")
          else
            Snacks.bufdelete()
          end
        end,
        mode = { "n", "i", "v", "t" },
        desc = "Close active split or buffer",
      },
    },
  },
}
