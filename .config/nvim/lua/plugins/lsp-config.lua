return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "bashls", "gopls", "intelephense", "lua_ls" },
        automatic_installation = true,
      }

      -- ┣━━━━━━━━━━━┫ Auto-start LSPs by filetype ┣━━━━━━━━━━━┫
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "go", "gomod", "gowork", "gotmpl" },
        callback = function(args)
          vim.lsp.start({
            name = "gopls",
            cmd = { "gopls" },
            root_dir = vim.fs.dirname(vim.fs.find({ "go.mod", ".git" }, { upward = true })[1]),
            capabilities = vim.lsp.protocol.make_client_capabilities(),
            bufnr = args.buf,
          })
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "php",
        callback = function(args)
          vim.lsp.start({
            name = "intelephense",
            cmd = { "intelephense", "--stdio" },
            root_dir = vim.fs.dirname(vim.fs.find({ ".git", "composer.json" }, { upward = true })[1]),
            bufnr = args.buf,
          })
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "lua",
        callback = function(args)
          vim.lsp.start({
            name = "lua_ls",
            cmd = { "lua-language-server" },
            root_dir = vim.fs.dirname(vim.fs.find({ ".git", ".luarc.json" }, { upward = true })[1]),
            settings = {
              Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = { checkThirdParty = false },
                completion = { callSnippet = "Replace" },
              },
            },
            bufnr = args.buf,
          })
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sh", "bash" },
        callback = function(args)
          vim.lsp.start({
            name = "bashls",
            cmd = { "bash-language-server", "start" },
            root_dir = vim.fs.dirname(vim.fs.find({ ".git", ".bashrc" }, { upward = true })[1]),
            capabilities = vim.lsp.protocol.make_client_capabilities(),
            bufnr = args.buf,
          })
        end,
      })
    end,
  },
}

