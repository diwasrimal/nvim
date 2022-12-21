-- Load visual settings for LSP client
require("diwas.lsp.visuals").setup()

local servers = require("mason-lspconfig").get_installed_servers()
local lspconfig = require("lspconfig")

-- Load mappings when LSP client attaches on to a buffer
local on_attach = function (client, bufnr)
  require("diwas.lsp.mappings").setup(client, bufnr)
end

-- Determine server capabilities
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require("cmp_nvim_lsp").default_capabilities(client_capabilities)

-- Settings specific to a server
local settings = require("diwas.lsp.settings")

for _, server in pairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = settings[server],
  })
end
