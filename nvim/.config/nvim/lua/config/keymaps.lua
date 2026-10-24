-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- Better indenting in visual mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Quick save
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Obsidian Daily Note Integration (Obsidian Plugin Parity)
-- <leader>od / <leader>dd: Open today's daily note (generates from template if missing)
-- <leader>ol / <leader>dl: Open latest existing daily note in history
local daily = require("config.daily")

map("n", "<leader>od", daily.open_daily_note, { desc = "Open Today's Daily Note (Create if missing)" })
map("n", "<leader>dd", daily.open_daily_note, { desc = "Open Today's Daily Note (Create if missing)" })
map("n", "<leader>dn", daily.open_daily_note, { desc = "New / Today's Daily Note" })
map("n", "<leader>ol", daily.open_latest_daily_note, { desc = "Open Latest Existing Daily Note" })
map("n", "<leader>dl", daily.open_latest_daily_note, { desc = "Open Latest Existing Daily Note" })

-- Obsidian / Markdown Wikilink Jump: press Enter on [[Wikilink]] to jump
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function(event)
    map("n", "<CR>", function()
      local line = vim.api.nvim_get_current_line()
      -- Check for [[Target]] or [[Target|Label]]
      local link = line:match("%[%[([^%]|]+)")
      if link then
        -- Find file in current working directory or vault
        local vault_dir = vim.fn.expand("~/Obsidian-Vaults/RadicallyInsane")
        local found = vim.fn.globpath(vault_dir, "**/" .. link .. ".md", true, true)
        if #found == 0 then
          found = vim.fn.globpath(".", "**/" .. link .. ".md", true, true)
        end
        if #found > 0 then
          vim.cmd("edit " .. vim.fn.fnameescape(found[1]))
          return
        end
      end
      -- Fallback to default enter behavior
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, false, true), "n", false)
    end, { buffer = event.buf, desc = "Jump to Obsidian Wikilink" })
  end,
})
