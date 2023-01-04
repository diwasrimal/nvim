-- Shorten function name
local keymap = vim.keymap.set

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

--[[ 
Modes
  "n" = normal_mode
  "i" = insert_mode
  "v" = visual_mode
  "x" = visual_block_mode
  "t" = term_mode
  "c" = command_mode
]]

-- Window movements and resizing
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader>wH", "<C-w>H", opts)
keymap("n", "<leader>wJ", "<C-w>J", opts)
keymap("n", "<leader>wK", "<C-w>K", opts)
keymap("n", "<leader>wL", "<C-w>L", opts)
keymap("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
keymap("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", "<cmd>bnext<CR>", opts)
keymap("n", "<S-h>", "<cmd>bprevious<CR>", opts)
keymap("n", "<S-q>", "<cmd>bd!<CR>", opts)

-- Text manipulation
-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Better copy paste
keymap("n", "Y", "yg$", opts)
keymap("v", "p", '"_dP', opts)
keymap("n", "<leader>y", '\"+y', opts)
keymap("n", "<leader>Y", '\"+yg$', opts)
keymap("v", "<leader>y", '\"+y', opts)

keymap("n", "J", "mzJ`z", opts)

-- Better jumping
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<leader>O", "O<Esc>O", opts)

-- Quickfix list
keymap("n", "]q", "<cmd>cprev<CR>", opts)
keymap("n", "[q", "<cmd>cnext<CR>", opts)
keymap("n", "<leader>qo", "<cmd>copen<CR>", opts)
keymap("n", "<leader>qk", "<cmd>cclose<CR>", opts)
keymap("n", "<leader>qf", "<cmd>cfirst<CR>", opts)
keymap("n", "<leader>ql", "<cmd>clast<CR>", opts)

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
local builtin = require('telescope.builtin')
keymap('n', '<C-p>', builtin.find_files, opts)
keymap('n', '<leader>ff', builtin.git_files, opts)
keymap('n', '<leader>fg', builtin.live_grep, opts)
keymap('n', '<leader>fb', builtin.buffers, opts)
keymap('n', '<leader>fh', builtin.help_tags, opts)
keymap('n', '<leader>fs', builtin.spell_suggest, opts)
keymap('n', '<leader>fk', builtin.keymaps, opts)
keymap('n', '<leader>fd', builtin.diagnostics, opts)
keymap('n', '<leader>fm', builtin.man_pages, opts)
keymap('n', '<leader>fw', function ()
  local search_term = vim.fn.input("Search word: ")
  builtin.grep_string({ search = search_term })
end
, opts)

-- Git
-- keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- DAP
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
-- keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
-- keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
-- keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
-- keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
