-- Individual LSP server settings stored here

local M = {}

M.sumneko_lua = {
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
}

return M
