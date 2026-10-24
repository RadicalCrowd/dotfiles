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
