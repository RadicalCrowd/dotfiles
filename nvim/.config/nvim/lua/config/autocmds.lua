-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

local function get_latest_daily_note()
  local vault_dir = vim.fn.expand("~/Obsidian-Vaults/RadicallyInsane")
  local year = os.date("%Y")
  local month = os.date("%m")
  local today = os.date("%Y-%m-%d")
  local today_path = string.format("%s/01-Periodic/%s/Daily/%s/%s.md", vault_dir, year, month, today)

  if vim.fn.filereadable(today_path) == 1 then
    return today_path
  end

  -- Fallback: most recent daily note by filename sort
  local glob_pattern = string.format("%s/01-Periodic/**/Daily/**/*.md", vault_dir)
  local files = vim.fn.glob(glob_pattern, true, true)
  if #files > 0 then
    table.sort(files)
    return files[#files]
  end

  return today_path
end

-- Automatically open latest daily note when launching Neovim with no arguments
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("open_daily_on_startup", { clear = true }),
  callback = function()
    if vim.fn.argc() == 0 and vim.api.nvim_buf_get_name(0) == "" then
      local note = get_latest_daily_note()
      if vim.fn.filereadable(note) == 1 then
        vim.cmd("edit " .. vim.fn.fnameescape(note))
      end
    end
  end,
})
