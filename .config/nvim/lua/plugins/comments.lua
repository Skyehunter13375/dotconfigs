return {
  -- # BUGS This is a test
  -- # DEBG This is a test
  -- # TODO This is a test
  -- # WARN This is a test
  -- # FEAT This is a test
  -- # TASK This is a test
  -- # TEST This is a test
  -- # NOTE This is a test

  "folke/todo-comments.nvim",
  event = "VimEnter",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
      signs = true,
      sign_priority = 8,
      keywords = {
        BUGS = { icon = " ", color = "#C97A7A" },
        DEBG = { icon = "? ", color = "#C06A9A" },
        TODO = { icon = "⨯ ", color = "#A37D3E" },
        WARN = { icon = " ", color = "#BFA23A" },
        FEAT = { icon = "+ ", color = "#7FA65A" },
        TASK = { icon = " ", color = "#4FA38A" },
        TEST = { icon = "⏲ ", color = "#4F8FB3" },
        NOTE = { icon = "! ", color = "#7E6BB3" },
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
        before            = "fg",      -- "fg" or "bg" or empty
        keyword           = "bg", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty
        after             = "fg",      -- "fg" or "bg" or empty
        pattern           = [[.*(KEYWORDS)\s* ]],
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
  },
}
