vim.g.catppuccin_flavour = "mocha"
require("catppuccin").setup({
    transparent_background = true,
    styles = {
      comments = {},
      conditionals = {},
    },
})
vim.cmd[[ colorscheme catppuccin ]]
vim.cmd[[ highlight LineNr guifg=#aaaaaa ]]
vim.cmd[[ highlight CursorLine guibg=#3C3836 ]]
vim.cmd[[ highlight CursorLineNr guifg=#FAB387 ]]
