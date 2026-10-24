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

-- Open Today's Daily Note from anywhere in any directory (<leader>od or <leader>dd)
local function open_daily_note()
  local vault_dir = vim.fn.expand("~/Obsidian-Vaults/RadicallyInsane")
  local year = os.date("%Y")
  local month = os.date("%m")
  local today = os.date("%Y-%m-%d")
  local today_path = string.format("%s/01-Periodic/%s/Daily/%s/%s.md", vault_dir, year, month, today)

  local target = today_path
  if vim.fn.filereadable(today_path) == 0 then
    local glob_pattern = string.format("%s/01-Periodic/**/Daily/**/*.md", vault_dir)
    local files = vim.fn.glob(glob_pattern, true, true)
    if #files > 0 then
      table.sort(files)
      target = files[#files]
    end
  end

  if vim.fn.filereadable(target) == 1 then
    vim.cmd("edit " .. vim.fn.fnameescape(target))
  else
    vim.notify("Daily note not found at " .. target, vim.log.levels.WARN)
  end
end

map("n", "<leader>od", open_daily_note, { desc = "Open Today's Daily Note" })
map("n", "<leader>dd", open_daily_note, { desc = "Open Today's Daily Note" })

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
