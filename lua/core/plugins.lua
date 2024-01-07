local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { "wbthomason/packer.nvim" }
  use { "numToStr/Comment.nvim" }
  use { "nvim-tree/nvim-tree.lua" }
  use { "nvim-tree/nvim-web-devicons" }
  use { "windwp/nvim-autopairs" }
  use { "lukas-reineke/indent-blankline.nvim" }

-- Completion + snippets
  use { "hrsh7th/nvim-cmp" }
  use { "rafamadriz/friendly-snippets" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-path" }
  use { "saadparwaiz1/cmp_luasnip" }
  use { "L3MON4D3/LuaSnip" }

  -- Telescope
  use { "nvim-telescope/telescope.nvim" }
  use { "nvim-lua/plenary.nvim" }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Colorscheme
  use { "ellisonleao/gruvbox.nvim" }
  use { "Mofiqul/dracula.nvim" }
  use { "loctvl842/monokai-pro.nvim" }

  -- LSP
  use { "williamboman/mason.nvim" }
  use { "neovim/nvim-lspconfig" }
  use { "onsails/lspkind.nvim" }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter" , run = ":TSUpdate" }
  use { "nvim-treesitter/nvim-treesitter-context" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)


