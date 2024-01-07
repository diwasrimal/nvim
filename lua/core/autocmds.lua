local definitions = {
  {
    { "BufWinEnter", "BufRead", "BufNewFile" },
    {
      group = "_format_options",
      pattern = "*",
      command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
    },
  },
  {
    { "BufWritePost", "BufLeave" },
    {
      pattern = os.getenv("HOME") .. "/.local/share/todos.txt",
      command = ":!kill -SIGRTMIN+6 $(pidof dwmblocks)",
    },
  },
}

for _, entry in ipairs(definitions) do
  local event = entry[1]
  local opts = entry[2]
  if type(opts.group) == "string" and opts.group ~= "" then
    local exists, _ = pcall(vim.api.nvim_get_autocmds, { group = opts.group })
    if not exists then
      vim.api.nvim_create_augroup(opts.group, {})
    end
  end
  vim.api.nvim_create_autocmd(event, opts)
end
