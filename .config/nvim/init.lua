-- ┣━━━━━━━━━━━━━━━━━━━━━━┫ Setting My Preferred Defaults ┣━━━━━━━━━━━━━━━━━━━━━━━┫ --
vim.g.mapleader      = ' '      -- Set leader key to space [MUST be done before loading lazy.nvim]
vim.g.maplocalleader = ' '      -- Set leader key to space [MUST be done before loading lazy.nvim]
vim.o.mouse          = 'a'      -- Empty string here disables mouse mode entirely
vim.opt.tabstop      = 4        -- Number of visual spaces per TAB
vim.opt.shiftwidth   = 4        -- Number of spaces to use for each step of (auto)indent
vim.opt.swapfile     = false    -- Stop nvim from creating .swp files all over the place.
vim.opt.expandtab    = true     -- Use spaces instead of TAB characters
vim.g.have_nerd_font = true     -- Only if you really have a nerd font installed
vim.o.undofile       = true     -- Save undo history <C-r> is the default to redo
vim.o.ignorecase     = true     -- Case-insensitive searching UNLESS \C or contains capital letters in string
vim.o.smartcase      = true     -- Case-insensitive searching UNLESS \C or contains capital letters in string
vim.o.splitright     = true     -- Configure how new splits should be opened
vim.o.splitbelow     = true     -- Configure how new splits should be opened
vim.o.list           = true     -- Configure whitespace characters
vim.opt.listchars    = { tab = '» ', trail = '·', nbsp = '␣' } -- Configure whitespace characters
vim.opt.conceallevel = 2


-- ┣━━━━━━━━━━━━━━━━━━━━━┫ Sync Clipboard Between OS & Nvim ┣━━━━━━━━━━━━━━━━━━━━━┫ --
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)


-- ┣━━━━━━━━━━━━━━━━━━━━━━┫ Install & Configure lazy.nvim ┣━━━━━━━━━━━━━━━━━━━━━━━┫ --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins") -- Reads from lua/plugins dir on change
local builtin = require("telescope.builtin") -- Required for treesitter to work


-- ┣━━━━━━━━━━━━━━━━┫ Display diagnostic data in-line with code ┣━━━━━━━━━━━━━━━━━┫
vim.diagnostic.config({
  virtual_text = true,      -- Show virtual text for diagnostics
  signs = true,             -- Show signs in the sign column
  update_in_insert = false, -- Don't update diagnostics in insert mode
  severity_sort = true,     -- Sort diagnostics by severity
  float = {                 -- Configuration for the floating window
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})


-- ┣━━━━━━━━━━━━┫ Keybind for auto-comment a selected block of text ┣━━━━━━━━━━━━━┫
local comment_prefix = {
  go     = "// ",
  php    = "// ",
  c      = "// ",
  cpp    = "// ",
  bash   = "# ",
  sh     = "# ",
  python = "# ",
}

local function comment_block()
  local ft = vim.bo.filetype
  local prefix = comment_prefix[ft] or "// "
  vim.cmd("normal! I" .. prefix)
end

vim.keymap.set("v", "<C-C>", comment_block, {
  noremap = true,
  silent  = true,
  desc    = "Comment selected block",
})


-- ┣━━━━━━━━━━━━━━━━━━━━━━┫ Setting My Preferred Keybinds ┣━━━━━━━━━━━━━━━━━━━━━━━┫ --
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>',                          {desc='Exit terminal mode' })
vim.keymap.set('n', '<C-w>v',     ':vnew<CR>',                            {desc='Split current window vertically' })
vim.keymap.set('n', '<C-w>V',     ':new<CR>',                             {desc='Split current window Horizontally' })
vim.keymap.set('n', '<C-h>',      '<C-w><C-h>',                           {desc='Move focus to the left window' })
vim.keymap.set('n', '<C-l>',      '<C-w><C-l>',                           {desc='Move focus to the right window' })
vim.keymap.set('n', '<C-j>',      '<C-w><C-j>',                           {desc='Move focus to the lower window' })
vim.keymap.set('n', '<C-k>',      '<C-w><C-k>',                           {desc='Move focus to the upper window' })
vim.keymap.set('n', '<leader>sf', builtin.find_files,                     {desc='Treesitter Fuzzyfind Files' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep,                      {desc='Treesitter Fuzzyfind Grep'})
vim.keymap.set('n', '<leader>fs', ':Neotree filesystem reveal left<CR>',  {desc='Show/Hide Neotree'})
vim.keymap.set('n', '<leader>q',  ':q!<CR>',                              {desc='Quit without saving'})
vim.keymap.set('n', '<leader>w',  ':w!<CR>',                              {desc='Save and Quite'})
vim.keymap.set('v', '<leader>//', ":'<,'>normal! I// <CR>",               {desc='Comment selected block', silent=true})
vim.keymap.set('n', '<leader>//', ":normal! I// <CR>",                    {desc='Comment current line',   silent=true})
vim.keymap.set('n', '<leader>sn', function() builtin.find_files { cwd = vim.fn.stdpath 'config' } end, { desc = "Seach NeoVim config files" })

