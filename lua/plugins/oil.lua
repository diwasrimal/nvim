return {
	'stevearc/oil.nvim',
	config = function()
		require("oil").setup({
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
			},
			keymaps = {
				["q"] = "actions.close",
				["<C-p>"] = false,
				["<C-e>"] = "actions.preview",
			}
		})
		vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>")
	end,
}
