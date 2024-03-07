return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {'nvim-treesitter/nvim-treesitter-context'},
    config = function()
        local ok, tsconfig = pcall(require, "nvim-treesitter.configs")
        if not ok then return end
        tsconfig.setup {
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "typescript", "python" },
            sync_install = false,
            auto_install = true,
            ignore_install = { "markdown", "diff" },
            highlight = {
                enable = true,
            },
        }

        local ok, tscontext = pcall(require, "treesitter-context")
        if not ok then return end
        tscontext.setup()
    end,
}
