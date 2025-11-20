
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
<Esc> + <Esc>    --  Exit terminal mode
<CTRL> + h       -- Shift focus to the left window 
<CTRL> + j       -- Shift focus to the lower window
<CTRL> + k       -- Shift focus to the upper window
<CTRL> + l       -- Shift focus to the right window
<Space> + s + f  -- Telescope fuzzy find files
<Space> + s + g  -- Telescope fuzzy find grep
<Space> + s + n  -- Telescope fuzzy find NeoVim config directory
<Space> + f + s  -- Open/Focus NeoTree
<Space> + q + q  -- Quit focused window without saving
<Space> + w + q  -- Save buffer to disk and quit focused window
<Space> + t + t  -- Open a floating terminal
```
