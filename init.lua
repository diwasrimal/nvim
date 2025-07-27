-- Core configs
require("core.options")
require("core.keymaps")
require("core.autocommands")

-- Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	print("Installing lazy.nvim and plugins, reopen nvim once done!")
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local lazy_opts = {
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
},

-- Load plugins listed in ./lua/plugins
require("lazy").setup("plugins", lazy_opts)

-- vim.cmd[[colorscheme gruvbox-material]]
require('onedark').load()

require("after.highlight")
