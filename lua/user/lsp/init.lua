local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  print("nvim-lspconfig not found")
  return
end

-- Load visual settings
require("user.lsp.visuals").setup()

-- Function called when a LSP client gets attached to a buffer
local on_attach = function (client, bufnr)

  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  -- Mappings
  vim.keymap.set("n", "K",  vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, bufopts)
  vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, bufopts)

end

-- Setup servers
local servers = require("mason-lspconfig").get_installed_servers()
for _, server in pairs(servers) do
  if server == "excluded" then
    goto continue
  end
  lspconfig[server].setup({
    on_attach = on_attach,
  })
  ::continue::
end
