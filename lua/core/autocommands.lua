vim.cmd[[ autocmd FileType markdown,gitcommit setlocal spell ]]
-- vim.cmd[[ autocmd FileType javascriptreact,typescriptreact,html setlocal sw=2 ts=2 ]]

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({ timeout = 100 })
    end,
    group = highlight_group,
    pattern = '*',
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   callback = function(args)
--     vim.lsp.buf.format()
--     vim.lsp.buf.code_action { context = { only = { 'source.organizeImports' } }, apply = true }
--     vim.lsp.buf.code_action { context = { only = { 'source.fixAll' } }, apply = true }
--   end,
-- })
