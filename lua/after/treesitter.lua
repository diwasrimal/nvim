local ok, tsconfig = pcall(require, "nvim-treesitter.configs")
if not ok then
  print("Tresitter not found!")
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

local ok, tscontext = pcall(require, "treesitter-context")
if not ok then
    return
end

tscontext.setup({
    max_lines = 6;
})

