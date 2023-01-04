local ok, mason = pcall(require, "mason")
if not ok then
  print("Mason not found!")
  return
end

mason.setup({
  ui = {
    border = { "┌", "─", "┐",	"│", "┘", "─", "└",	"│" },
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok then
  print("mason-lspconfig not found!")
  return
end

mason_lspconfig.setup({
  ensure_installed = { "sumneko_lua", "clangd", "pyright" },
})
