return {
  "brenoprata10/nvim-highlight-colors",
  event = "VeryLazy",  -- or any other event you prefer
  config = function()
    require("nvim-highlight-colors").setup({
      -- examples of common options:
      render = "background", -- or "foreground" or "first_column"
      enable_named_colors = true,
      enable_tailwind = true,
    })
  end,
}

