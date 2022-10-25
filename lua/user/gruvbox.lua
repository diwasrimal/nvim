-- setup must be called before loading the colorscheme
-- Default options:
require("gruvbox").setup({
  italic = false,
  transparent_mode = true,
})
vim.cmd("colorscheme gruvbox")
vim.cmd[[:highlight SignColumn guibg=NONE cterm=NONE term=NONE]]
vim.cmd[[:highlight CursorLineNr guibg=NONE cterm=NONE term=NONE]]
