local ok, dracula = pcall(require, "dracula")
if not ok then
  print("Dracula not found")
  return
end

function DraculaPrettify ()
  vim.cmd("hi Pmenu guibg=NONE")
  vim.cmd("hi PmenuSel guifg=#FC4E46 guibg=NONE")
  vim.cmd("hi StatusLine guibg=NONE")
  vim.cmd("hi CmpItemAbbrMatch guifg=#BB7CCA guibg=NONE")
  vim.cmd("hi TelescopeNormal guibg=NONE")
  vim.cmd("hi TelescopeSelection guifg=#FF79c6 guibg=NONE")
  vim.cmd("hi NormalFloat guibg=NONE")
  vim.cmd("hi SpecialKey guifg=#ffffff")
  vim.cmd("hi Search guifg=NONE guibg=#525252")
  vim.cmd("hi DiagnosticVirtualTextWarn guifg=#EBCB8B guibg=#2E3440 gui=italic")
  vim.cmd("hi DiagnosticVirtualTextError guifg=#BF616A guibg=#2E3440 gui=italic")
end

dracula.setup({
  transparent_bg = true,
})

vim.cmd("colorscheme dracula")
DraculaPrettify()


