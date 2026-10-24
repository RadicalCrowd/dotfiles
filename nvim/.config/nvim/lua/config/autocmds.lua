-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- ==============================================================================
-- Autocommands & Filetype Specific Formatting
-- ==============================================================================

-- Markdown Readability & Buffer Formatting:
-- 1. Disable distracting spell check undercurls across multilingual/technical notes
-- 2. Clean soft line-wrapping at word boundaries without breaking words in half
-- 3. Automatic hanging indent for wrapped list items and paragraphs
-- 4. Clean non-jumping line numbers (disable relativenumber for note readability)
-- 5. Suppress noisy inline virtual text diagnostics in prose buffers
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("markdown_readability", { clear = true }),
  pattern = { "markdown", "text" },
  callback = function(event)
    vim.opt_local.spell = false
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.breakindent = true
    vim.opt_local.breakindentopt = "shift:2,min:40"
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false -- Clean gutter without line number column
    vim.opt_local.signcolumn = "no" -- Clean margin without random sign marks
    vim.diagnostic.config({ virtual_text = false, signs = false }, event.buf)
  end,
})
