-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local opt = vim.opt

-- Line numbers & signs
opt.relativenumber = true
opt.number = true
opt.signcolumn = "yes"

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Split directions
opt.splitright = true
opt.splitbelow = true

-- Clipboard: Synchronize with Wayland clipboard
opt.clipboard = "unnamedplus"

-- Clean cursor and search
opt.cursorline = true
opt.ignorecase = true
opt.smartcase = true

-- Window border styling
opt.fillchars = {
  foldopen = "v",
  foldclose = ">",
  fold = " ",
  foldsep = " ",
  diff = "/",
  eob = " ",
}

-- ------------------------------------------------------------------------------
-- Auto-open latest Daily Note when launching Neovim with no file arguments
-- ------------------------------------------------------------------------------
local function get_latest_daily_note()
  local vault_dir = vim.fn.expand("~/Obsidian-Vaults/RadicallyInsane")
  local year = os.date("%Y")
  local month = os.date("%m")
  local today = os.date("%Y-%m-%d")
  local today_path = string.format("%s/01-Periodic/%s/Daily/%s/%s.md", vault_dir, year, month, today)

  if vim.fn.filereadable(today_path) == 1 then
    return today_path
  end

  local glob_pattern = string.format("%s/01-Periodic/**/Daily/**/*.md", vault_dir)
  local files = vim.fn.glob(glob_pattern, true, true)
  if #files > 0 then
    table.sort(files)
    return files[#files]
  end

  return today_path
end

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
