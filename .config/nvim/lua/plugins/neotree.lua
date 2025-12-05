return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy   = false, -- neo-tree will lazily load itself
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true
      }
    }
  }
}
