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

-- Obsidian / Markdown Wikilink Jump: press Enter on [[Wikilink]] to jump
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function(event)
    map("n", "<CR>", function()
      local line = vim.api.nvim_get_current_line()
      local col = vim.api.nvim_win_get_cursor(0)[2] + 1
      -- Check for [[Target]] or [[Target|Label]]
      local link = line:match("%[%[([^%]|]+)")
      if link then
        -- Find file in current working directory
        local found = vim.fn.globpath(".", "**/" .. link .. ".md", true, true)
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
