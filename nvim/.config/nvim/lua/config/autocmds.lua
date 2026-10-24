-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- ==============================================================================
-- Autocommands & Filetype Specific Formatting
-- ==============================================================================

-- Auto-fold YAML frontmatter on opening markdown note
local function fold_yaml_frontmatter(buf)
  local lines = vim.api.nvim_buf_get_lines(buf, 0, 30, false)
  if lines[1] and lines[1]:match("^%-%-%-") then
    for i = 2, #lines do
      if lines[i]:match("^%-%-%-") or lines[i]:match("^%.%.%.") then
        vim.opt_local.foldmethod = "manual"
        vim.cmd(string.format("silent! 1,%dfold", i))
        break
      end
    end
  end
end

-- Markdown Readability & Buffer Formatting:
-- 1. Disable distracting spell check undercurls across multilingual/technical notes
-- 2. Clean soft line-wrapping at word boundaries without breaking words in half
-- 3. Automatic hanging indent for wrapped list items and paragraphs
-- 4. Clean non-jumping line numbers (disable relativenumber for note readability)
-- 5. Suppress noisy inline virtual text diagnostics and signcolumn markers in prose buffers
-- 6. Auto-fold frontmatter so document opens cleanly on the note title
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
    fold_yaml_frontmatter(event.buf)
  end,
})
