return {
  "folke/todo-comments.nvim",
  event = "VimEnter",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
      signs = true,
      sign_priority = 8,
      keywords = {
        BUGS = { icon = " ", color = "#da3633" },
        HACK = { icon = " ", color = "#FF00FF" },
        DEBG = { icon = "? ", color = "#FF00FF" },
        TODO = { icon = " ", color = "#d29922" },
        WARN = { icon = " ", color = "#d29922" },
        FEAT = { icon = "+ ", color = "#d29922" },
        TASK = { icon = " ", color = "#3fb950" },
        TEST = { icon = "⏲ ", color = "#3fb950" },
        PERF = { icon = " ", color = "#3fb950" },
        NOTE = { icon = " ", color = "#58a6ff" },
        INFO = { icon = "! ", color = "#58a6ff" },
      },
      gui_style = {
        fg = "NONE",
        bg = "BOLD",
      },
      merge_keywords = true,
      highlight = {
        multiline         = true,
        multiline_pattern = "^.",
        multiline_context = 10,
        before            = "fg", -- "fg" or "bg" or empty
        keyword           = "wide_bg", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty
        after             = "fg", -- "fg" or "bg" or empty
        pattern           = [[.*<(KEYWORDS)\s*:]],
        comments_only     = true,
        max_line_len      = 400,
        exclude           = {},
      },
      search = {
        command = "rg",
        args    = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        pattern = [[\b(KEYWORDS):]], -- ripgrep regex
        -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
      },
  }
}
