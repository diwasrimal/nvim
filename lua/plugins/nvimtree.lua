return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        vim.keymap.set("n", "<leader>eo", "<cmd>NvimTreeToggle<CR>")
        vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFocus<CR>")
        vim.keymap.set("n", "<leader>el", "<cmd>NvimTreeFindFile<CR>")

        local function my_on_attach(bufnr)
            local api = require('nvim-tree.api')
            local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }
            api.config.mappings.default_on_attach(bufnr)
            vim.keymap.set('n', 'R', api.fs.rename_sub, opts)
            vim.keymap.set('n', '+', api.tree.change_root_to_node, opts)
            vim.keymap.set('n', '<C-r>', api.tree.reload, opts)
        end


        require("nvim-tree").setup({
            on_attach = my_on_attach,
        })
    end,
}
