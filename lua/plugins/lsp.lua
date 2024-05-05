return {
    'neovim/nvim-lspconfig',
    dependencies = {
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim",
        "nvim-lua/plenary.nvim", -- for none-ls
    },
    config = function()
        local lspconfig = require("lspconfig")
        require("mason").setup()

        local capabilities = nil
        local ok, cmplsp = pcall(require, "cmp_nvim_lsp")
        if ok then
            capabilities = cmplsp.default_capabilities()
        end

        -- Diagnostic icons shown in sign column
        local signs = { Error = "✘", Warn = "", Hint = "󰛨", Info = "" }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        -- Specify servers and settings here
        local servers = {
            "clangd",
            "gopls",
            "rust_analyzer",
            "tsserver",
            "emmet_language_server",
            "pyright",
            -- "tailwindcss",
            -- "astro",
            -- "jdtls",
        }
        local settings = {
            gopls = {
                completeUnimported = true,
                usePlaceholders = true,
                analyses = {
                    unusedparams = true,
                },
                -- hints = {
                --     assignVariableTypes = true,
                --     compositeLiteralFields = true,
                --     compositeLiteralTypes = true,
                --     constantValues = true,
                --     functionTypeParameters = true,
                --     parameterNames = true,
                --     rangeVariableTypes = true,
                -- }
            },
            clangd = {
                cmd = "~/.local/share/nvim/mason/bin/clangd",   -- dont use /usr/bin/clangd that comes with xcode cli tools
            }
            -- ...
        }

        local on_attach = function(client, bufnr)
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
            vim.keymap.set("n", "gs", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", bufopts) -- goto definition in split view
            vim.keymap.set("n", "gtd", vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
            vim.keymap.set("n", "gR", vim.lsp.buf.references, bufopts)
            vim.keymap.set("n", "gr", vim.lsp.buf.rename, bufopts)
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
            vim.keymap.set("n", "<leader>ls", vim.diagnostic.open_float, bufopts)
            vim.keymap.set("n", "<leader>ld", vim.diagnostic.setqflist, bufopts)
            vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, bufopts)
        end

        -- This is kept seperate so that lsp and null ls formatter don't format twice
        vim.keymap.set({ "n", "v" }, "<leader>lf", function()
            vim.lsp.buf.format({ async = true })
        end, bufopts)

        for _, server in ipairs(servers) do
            lspconfig[server].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = settings[server],
            })
        end

        -- Setup for none ls
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.black,
                -- null_ls.builtins.formatting.goimports,
            },
            on_attach = on_attach,
        })
    end,
}
