local ok, telescope = pcall(require, "telescope")
if not ok then
  print("Telescope not found!")
  return
end

local actions = require("telescope.actions")
local utils = require("telescope.utils")
local builtin = require("telescope.builtin")

local git_or_local_files = function()
    local _, ret, _ = utils.get_os_command_output({ 'git', 'rev-parse', '--is-inside-work-tree' })
    if ret == 0 then
        builtin.git_files()
    else
        builtin.find_files()
    end
end

vim.keymap.set('n', '<c-p>', git_or_local_files, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>fS', builtin.lsp_workspace_symbols, {})


telescope.setup({

  -- Default telescope configurations go here
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
    borderchars = { "─", "│", "─", "│", "┌", "┐",	"┘", "└" },
  },

  -- Fzf for faster searches
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
})

telescope.load_extension('fzf')

