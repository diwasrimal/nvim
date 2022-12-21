local M = {}

M.setup = function ()

  -- Signs for diagnostics
	local signs = {
		{ name = "DiagnosticSignError", text = "✘" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "ﯦ" },
		{ name = "DiagnosticSignInfo", text = "" },
  }
	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

  -- Surround hover float window with single border
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = "single", width = 60 }
  )

  -- Provide diagnostics in a bordered window
  vim.diagnostic.config({ float = { border = "single" } })

  -- Border for `:LspInfo` window 
  require('lspconfig.ui.windows').default_options.border = 'single'

end

return M
