-- disable netrw at the very start of your init.lua for nvim tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.backup = false
vim.o.cmdheight = 1
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.fileencoding = "utf-8"
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.laststatus = 3
vim.o.mouse = "a"
vim.o.number = true
vim.o.numberwidth = 4
vim.o.pumheight = 15
vim.o.relativenumber = true
vim.o.ruler = false
vim.o.scrolloff = 8
vim.o.shiftwidth = 4
vim.o.sidescrolloff = 8
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.timeoutlen = 1000
vim.o.undofile = true
vim.o.updatetime = 300
vim.o.wrap = false
vim.o.writebackup = false

vim.opt.fillchars.eob=" "		        -- Fill ~ with spaces in empty places
vim.opt.iskeyword:append("-")                   -- treats words with `-` as single words
vim.opt.shortmess:append "c"                    -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
vim.opt.whichwrap:append("<,>,[,],h,l")         -- keys allowed to move to the previous/next line when the beginning/end of line is reached
