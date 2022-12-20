-- Shorten function name
local keymap = vim.keymap.set

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
keymap("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", "<cmd>bnext<CR>", opts)
keymap("n", "<S-h>", "<cmd>bprevious<CR>", opts)

-- Move text up and down
-- keymap("v", "J", "<Esc>:m .+1<CR>==gv", opts)
-- keymap("v", "K", "<Esc>:m .-2<CR>==gv", opts)

-- Quickfix list
keymap("n", "<leader>qo", "<cmd>copen<CR>", opts)
keymap("n", "<leader>qk", "<cmd>cclose<CR>", opts)
keymap("n", "<leader>qn", "<cmd>cnext<CR>", opts)
keymap("n", "<leader>qp", "<cmd>cprev<CR>", opts)
keymap("n", "<leader>qf", "<cmd>cfirst<CR>", opts)
keymap("n", "<leader>ql", "<cmd>clast<CR>", opts)

-- Faster window manipulation
keymap("n", "<leader>wH", "<C-w>H", opts)
keymap("n", "<leader>wJ", "<C-w>J", opts)
keymap("n", "<leader>wK", "<C-w>K", opts)
keymap("n", "<leader>wL", "<C-w>L", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Terminal --
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", "<cmd>Lex 25<CR>", opts)

-- Telescope
-- keymap("n", "<C-p>", "<cmd>Telescope find_files<CR>", opts)
-- keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
-- keymap("n", "<leader>fp", "<cmd>Telescope projects<CR>", opts)
-- keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)

-- Git
-- keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')


-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
