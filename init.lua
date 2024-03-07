-- Core configs
require("core.options")
require("core.keymaps")
require("core.autocommands")

-- Plugin management using lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    print("Installing lazy.nvim, close and reopen neovim!")
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
require("lazy").setup("plugins")
vim.cmd[[colorscheme monokai-pro]]
