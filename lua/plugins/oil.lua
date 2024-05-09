return {
	'stevearc/oil.nvim',
	config = function()
		require("oil").setup({
			keymaps = {
				["q"] = "actions.close",
			}
		})
		vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>")
	end,
}
