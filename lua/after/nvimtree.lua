require("nvim-tree").setup({
    hijack_cursor = true,
})

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true } )
