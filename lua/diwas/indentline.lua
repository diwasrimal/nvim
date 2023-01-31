require("indent_blankline").setup {
  enabled = true,
  buftype_exclude = { "terminal", "nofile" },
  -- filetype_exclude = {
  --   "help",
  --   "startify",
  --   "dashboard",
  --   "packer",
  --   "neogitstatus",
  --   "NvimTree",
  --   "Trouble",
  --   "text",
  -- },
  char = "▏",
  use_treesitter = false,
  show_end_of_line = true,
  show_first_indent_level = true,
  show_trailing_blankline_indent = false,
  show_current_context = false,
  -- show_current_context_start = true,
}
