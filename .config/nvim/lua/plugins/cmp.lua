-- This is required to generate the LSP popups
-- The LSP itself does not seem to do so
return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {"hrsh7th/cmp-nvim-lsp"},
        config = function()
            local cmp = require("cmp")

            -- ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫ Theme ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫ --
            vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#1e1e2e" }) -- base (dark slate)
            vim.api.nvim_set_hl(0, "CmpBorder", { fg = "#6c7086", bg = "#1e1e2e" })
            vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#cdd6f4" })
            vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#89b4fa", bold = true })
            vim.api.nvim_set_hl(0, "CmpItemKind", { fg = "#b4befe" })

            -- ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫ Setup ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫ --
            cmp.setup({
                window = {
                completion       = cmp.config.window.bordered({
                    border       = "rounded",
                    winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
                    scrolloff    = 0,
                    side_padding = 0,
                    col_offset   = 75,
                    scrollbar    = true,
                }),
                documentation = cmp.config.window.bordered({
                    border = "rounded",
                    winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder",
                }),
                },

                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),

                sources = {{ name = "nvim_lsp" }},

                experimental = {
                    ghost_text = true, -- faint preview inline
                }
            })

            -- ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫ Attach N Run ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫ --
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            vim.api.nvim_create_autocmd(
                "LspAttach", {
                    callback = function(args)
                        local client = vim.lsp.get_client_by_id(args.data.client_id)
                        if client then
                            client.server_capabilities =
                            vim.tbl_deep_extend("force", client.server_capabilities, capabilities)
                        end
                    end
                }
            )
        end
    }
}
