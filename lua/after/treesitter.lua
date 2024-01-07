local ok1, tsconfig = pcall(require, "nvim-treesitter.configs")
if not ok1 then
    return
end

tsconfig.setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "typescript", "python" },
    sync_install = false,
    auto_install = true,
    ignore_install = { "markdown", "diff" },
    highlight = {
        enable = true,
    },
})

local ok2, tscontext = pcall(require, "treesitter-context")
if ok2 then
    tscontext.setup({
        max_lines = 6,
    })
end
