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

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local function safe_del(mode, lhs)
			local maps = vim.api.nvim_get_keymap(mode)
			for _, map in ipairs(maps) do
				if map.lhs == lhs then
					vim.keymap.del(mode, lhs)
					return
				end
			end
		end

		safe_del("n", "grn")
		safe_del("n", "grr")
		safe_del("n", "gri")
		safe_del("n", "gO")
		safe_del("x", "gra")
		safe_del("v", "gra")
		safe_del("n", "gra")
		-- safe_del("i", "<C-S>")
		-- vim.keymap.del("n", "grn")
		-- vim.keymap.del({"n", "x", "v"}, "gra")
		-- vim.keymap.del("n", "grr")
		-- vim.keymap.del("n", "gri")
		-- vim.keymap.del("n", "gO")
		-- vim.keymap.del("i", "<C-S>")
	end,
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   callback = function(args)
--     vim.lsp.buf.format()
--     vim.lsp.buf.code_action { context = { only = { 'source.organizeImports' } }, apply = true }
--     vim.lsp.buf.code_action { context = { only = { 'source.fixAll' } }, apply = true }
--   end,
-- })
