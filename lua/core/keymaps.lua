-- Default mappings 
-- Mappings specific to a plugin is kept in its config file

vim.g.mapleader = ' '

-- Better window management
vim.keymap.set("n", "<leader>w", "<c-w>", { remap = true })

-- Better yank
vim.keymap.set("n", "<leader>Y", '"+Y', { remap = true })
vim.keymap.set({"n", "v"}, "<leader>y", '"+y', { remap = true })

-- Tab and quickfix list navigations
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<cr>")
vim.keymap.set("n", "<leader>tn", "<cmd>tabnext<cr>")
vim.keymap.set("n", "<leader>tp", "<cmd>tabprev<cr>")
vim.keymap.set("n", "<leader>tq", "<cmd>tabclose<cr>")
vim.keymap.set("n", "<leader>qo", "<cmd>copen<cr>")
vim.keymap.set("n", "<leader>qq", "<cmd>cclose<cr>")
vim.keymap.set("n", "[q", "<cmd>cprev<cr>")
vim.keymap.set("n", "]q", "<cmd>cnext<cr>")


-- -- Shorten function name
-- local keymap = vim.keymap.set
--
-- local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }
--
-- --Remap space as leader key
-- vim.keymap.set("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = " "
--
-- -- Window movements and resizing
-- vim.keymap.set("n", "<leader>w", "<C-w>", { noremap = false, })
-- vim.keymap.set("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
-- vim.keymap.set("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
-- vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
-- vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)
--
-- -- Navigate buffers
-- vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", opts)
-- vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", opts)
-- vim.keymap.set("n", "<S-q>", "<cmd>bd!<CR>", opts)
--
-- -- Text manipulation
-- -- Move text up and down
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
--
-- -- Better copy paste
-- vim.keymap.set("n", "Y", "yg$", opts)
-- vim.keymap.set("v", "p", '"_dP', opts)
-- vim.keymap.set("n", "<leader>y", '\"+y', opts)
-- vim.keymap.set("n", "<leader>Y", '\"+yg$', opts)
-- vim.keymap.set("v", "<leader>y", '\"+y', opts)
--
-- vim.keymap.set("n", "J", "mzJ`z", opts)
--
-- -- Better jumping
-- vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
-- vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
-- vim.keymap.set("n", "<leader>O", "O<Esc>O", opts)
--
-- -- Quickfix list
-- vim.keymap.set("n", "]q", "<cmd>cprev<CR>", opts)
-- vim.keymap.set("n", "[q", "<cmd>cnext<CR>", opts)
-- vim.keymap.set("n", "<leader>qo", "<cmd>copen<CR>", opts)
-- vim.keymap.set("n", "<leader>qk", "<cmd>cclose<CR>", opts)
-- vim.keymap.set("n", "<leader>qf", "<cmd>cfirst<CR>", opts)
-- vim.keymap.set("n", "<leader>ql", "<cmd>clast<CR>", opts)
--
-- -- Stay in indent mode
-- vim.keymap.set("v", "<", "<gv", opts)
-- vim.keymap.set("v", ">", ">gv", opts)
--
-- -- Terminal --
-- vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
--
-- -- Plugins --
--
-- -- NvimTree
-- vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true})
--
-- -- Telescope
-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<C-p>', builtin.find_files, opts)
-- vim.keymap.set('n', '<leader>ff', builtin.git_files, opts)
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)
-- vim.keymap.set('n', '<leader>fs', builtin.spell_suggest, opts)
-- vim.keymap.set('n', '<leader>fk', builtin.keymaps, opts)
-- vim.keymap.set('n', '<leader>fd', builtin.diagnostics, opts)
-- vim.keymap.set('n', '<leader>fm', builtin.man_pages, opts)
-- vim.keymap.set('n', '<leader>fw', function ()
--   local search_term = vim.fn.input("Search word: ")
--   builtin.grep_string({ search = search_term })
-- end
-- , opts)
--
-- -- Git
-- -- vim.keymap.set("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
--
-- -- Comment
-- vim.keymap.set("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
-- vim.keymap.set("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')
--
