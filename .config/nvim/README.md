
# My personal nvim configs (**Nvim v10+ ONLY**)
If you came across this expecting excellence and a masterclass in LUA you have come to the wrong place friend! I'm just putting this here for my own sanity, and I know just enough about Lua to get by.

If you are looking for a well-built and easy to use neovim config I would suggest checking out [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim).I took a lot of my ideas from there and simplified it down into what I really needed. 


# Plugins:
- nvim-lspconfig
- cmp-nvim-lsp
- lazy.nvim
- mason-lspconfig.nvim
- mason.nvim
- neo-tree.nvim
- nui.nvim
- nvim-cmp
- nvim-treesitter
- nvim-web-devicons
- plenary.nvim
- telescope.nvim
- render-markdown.nvim

# Basic keybinds:
```
<Esc> + <Esc>     --  Exit terminal mode
<CTRL> + h        -- Shift focus to the left window 
<CTRL> + j        -- Shift focus to the lower window
<CTRL> + k        -- Shift focus to the upper window
<CTRL> + l        -- Shift focus to the right window
<CTRL> + w + v    -- Split window vertically (new blank doc)
<CTRL> + w + V    -- Split window horizontally (new blank doc)
<leader> + s + f  -- Telescope fuzzy find files
<leader> + s + g  -- Telescope fuzzy find grep
<leader> + s + n  -- Telescope fuzzy find NeoVim config directory
<leader> + f + s  -- Open/Focus NeoTree
<leader> + q + q  -- Quit focused window without saving
<leader> + w + q  -- Save buffer to disk and quit focused window
<leader> + t + t  -- Open a floating terminal
<leader> + / + /  -- Comment current line (in normal mode) or comment block (in visual mode)
```
