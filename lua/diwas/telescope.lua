local ok, telescope = pcall(require, "telescope")
if not ok then
  print("Telescope not found!")
  return
end

local actions = require("telescope.actions")

telescope.setup({

  -- Default telescope configurations go here
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
    borderchars = { "─", "│", "─", "│", "┌", "┐",	"┘", "└" },
  },

  -- Picker specific configuration goes here
  pickers = {
    find_files = {
      previewer = false,
      layout_config = { width = 0.65 },
    },
    git_files = {
      previewer = false,
      layout_config = { width = 0.65 },
    }
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
