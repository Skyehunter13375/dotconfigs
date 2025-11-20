return {
        "nvim-treesitter/nvim-treesitter", 
        lazy = false,  -- Treesitter will lazily load itself
        build = ":TSUpdate"
}