function GruvboxPrettify ()
  vim.cmd("hi SignColumn guibg=NONE")
  vim.cmd("hi CursorLineNr guibg=NONE")
  vim.cmd("hi Pmenu guibg=NONE")
  vim.cmd("hi PmenuSel guifg=#F24735 guibg=NONE")
  vim.cmd("hi DiagnosticSignWarn guibg=NONE guifg=#E0B72F")
  vim.cmd("hi DiagnosticSignError guibg=NONE guifg=#FB4934")
  vim.cmd("hi VertSplit guibg=NONE")
  vim.cmd("hi DiagnosticVirtualTextWarn guifg=#B57614 guibg=#3C3836 gui=italic")
  vim.cmd("hi DiagnosticVirtualTextError guifg=#bb3c3c guibg=#3C3836 gui=italic")
end

require("gruvbox").setup({
  undercurl = false,
  underline = false,
  bold = true,
  italic = false,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = true,
})

vim.cmd("colorscheme gruvbox")
GruvboxPrettify()
