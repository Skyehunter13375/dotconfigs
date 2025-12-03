return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts  = {
    preset = "modern",
    win    = {
      border  = "rounded",
      padding = { 1, 1 },
      zindex  = 9999,
      width   = 60,
      height  = 25,
    },
    layout = {
      column  = 1,
      spacing = 2,
      width   = { min = 30, max = 30 },
      height  = { min = 5, max = 15 },
    },
  },
  keys     = {
    { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps (which-key)" },
  },
}
