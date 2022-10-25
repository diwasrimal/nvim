require("mason").setup({
  ui = {
    border = { "┌", "─", "┐",	"│", "┘", "─", "└",	"│" },
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup({
  ensure_installed = { "sumneko_lua", "clangd", "pyright" },
})
