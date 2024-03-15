return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    local fzf = require("fzf-lua")
    vim.keymap.set('n', '<leader>ff', '<cmd>FzfLua<cr>', {})
    vim.keymap.set('n', '<c-p>', fzf.files, {})
    vim.keymap.set('n', '<leader>fg', fzf.git_files, {})
    vim.keymap.set('n', '<leader>fb', fzf.buffers, {})
    vim.keymap.set('n', '<leader>fo', fzf.oldfiles, {})
    vim.keymap.set('n', '<leader>fg', fzf.live_grep, {})
    vim.keymap.set('n', '<leader>fh', fzf.help_tags, {})
    vim.keymap.set('n', '<leader>fd', fzf.diagnostics_document, {})
    vim.keymap.set('n', '<leader>fD', fzf.diagnostics_workspace, {})
    vim.keymap.set('n', '<leader>fs', fzf.lsp_document_symbols, {})
    vim.keymap.set('n', '<leader>fS', fzf.lsp_workspace_symbols, {})
    vim.keymap.set('n', '<leader>fa', fzf.lsp_code_actions, {})
  end
}
