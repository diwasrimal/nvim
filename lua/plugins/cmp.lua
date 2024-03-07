return {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
    },
    config = function()
        local ok, luasnip = pcall(require, "luasnip")
        if not ok then return end

        -- Avoids weird tab jumps
        luasnip.config.set_config({
            region_check_events = 'InsertEnter',
            delete_check_events = 'InsertLeave'
        })

        local ok, cmp = pcall(require, "cmp")
        if not ok then return end

        local ok, snippets = pcall(require, "luasnip.loaders.from_vscode")
        if ok then snippets.lazy_load() end

        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },

            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'nvim_lsp_signature_help' },
                { name = 'luasnip' }, -- For luasnip users.
                { name = 'path' },
                { name = 'buffer' },
            }),

            preselect = cmp.PreselectMode.None,
            mapping = {
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),

                -- Safely select entries with return key
                ['<CR>'] = cmp.mapping.confirm(),

                -- Ctrl n/p to select next/prev item on list
                -- Ctrl n also triggers completion menu
                ["<C-n>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end),
                ["<C-p>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    end
                end),

                -- Tab will jump snippet forward
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                -- Shift tab always jumps back from snippet
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            },
        })
    end,

}
