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
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

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
  use { "wbthomason/packer.nvim" } -- Have packer manage itself
  use { "numToStr/Comment.nvim" }  -- Comments
  use { "gelguy/wilder.nvim" }     -- Command line ui customization
  use { "dstein64/vim-startuptime" }     -- Command line ui customization

  -- Snippets
  use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
  use { "L3MON4D3/LuaSnip" }             -- snippet engine

  -- cmp plugins
  use { "hrsh7th/nvim-cmp" }         -- Completion menu
  use { "rafamadriz/friendly-snippets" } -- vscode like snippets (https://github.com/L3MON4D3/LuaSnip#add-snippets)
  use { "hrsh7th/cmp-nvim-lsp" }     -- Lsp completion
  use { "hrsh7th/cmp-buffer" }       -- Buffer completions
  use { "hrsh7th/cmp-path" }         -- Path completions
  use { "hrsh7th/cmp-cmdline" }      -- Command-line completions
  -- use { "echasnovski/mini.nvim" }    -- Code formatting

  -- Telescope
  use { "nvim-telescope/telescope.nvim" }
  use { "nvim-lua/plenary.nvim" }  -- Useful lua functions used by lots of plugins (telescope requires this)
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Colorscheme
  use { "ellisonleao/gruvbox.nvim" }
  use { "Mofiqul/dracula.nvim" }

  -- LSP
  use { "neovim/nvim-lspconfig" }               -- enable LSP
  use { "williamboman/mason.nvim" }             -- Have packer manage itself
  use { "williamboman/mason-lspconfig.nvim" }   -- Integrates mason with lspconfig

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter" , {run = ":TSUpdate"} }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)


