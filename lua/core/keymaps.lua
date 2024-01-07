-- Default mappings 
-- Mappings specific to a plugin is kept in its config file

local opts = { noremap = true, silent = true }
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Better yank
vim.keymap.set("n", "<leader>Y", '"+Y', { remap = true })
vim.keymap.set({"n", "v"}, "<leader>y", '"+y', { remap = true })

-- Tab and quickfix list navigations
vim.keymap.set("n", "[t", "<cmd>tabprev<cr>", opts)
vim.keymap.set("n", "]t", "<cmd>tabnext<cr>", opts)
vim.keymap.set("n", "[q", "<cmd>cprev<cr>", opts)
vim.keymap.set("n", "]q", "<cmd>cnext<cr>", opts)
vim.keymap.set("n", "<leader>qo", "<cmd>copen<cr>", opts)
vim.keymap.set("n", "<leader>qq", "<cmd>cclose<cr>", opts)

-- Window management
vim.keymap.set("n", "<leader>w", "<c-w>", { remap = true })
vim.keymap.set("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- Move text up and down and visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)

-- Better jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "<leader>O", "O<Esc>O", opts)
