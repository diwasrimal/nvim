local ok1, lspconfig = pcall(require, "lspconfig")
if not ok1 then
    return
end

local ok2, mason = pcall(require, "mason")
if ok2 then
    mason.setup({})
end

local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "gR", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
    vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, bufopts)
    vim.keymap.set("n", "<leader>dl", vim.diagnostic.setqflist, bufopts)
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "<leader>lf", function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)
end

local setup_lsps = function()
    local client_capabilities = vim.lsp.protocol.make_client_capabilities()
    local capabilities = require("cmp_nvim_lsp").default_capabilities(client_capabilities)
    local servers = {
        "lua_ls",
        "jdtls",
        "gopls",
        "clangd",
    }
    local settings = {
        lua_ls = {
            Lua = {
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'},
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
            },
        },

        -- Other lsp settings ...
    }
    for _, server in ipairs(servers) do
        lspconfig[server].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = settings[server],
        })
    end
end

local setup_visuals = function()
    local signs = { Error = "✘", Warn = "", Hint = "󰛨", Info = "" }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- Use single borders 
    -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with( vim.lsp.handlers.hover, { border = "single", width = 60 })
    -- vim.diagnostic.config({ float = { border = "single" } })
    -- require('lspconfig.ui.windows').default_options.border = 'single'
end

setup_lsps()
setup_visuals()
