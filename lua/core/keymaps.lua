-- Default mappings
-- Mappings specific to a plugin is kept in its config file

vim.g.mapleader = ' '

vim.keymap.set("n", "<leader>w", "<c-w>", { remap = true })
vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>")

-- Better yank
vim.keymap.set("n", "<leader>Y", '"+Y', { remap = true })
vim.keymap.set({"n", "v"}, "<leader>y", '"+y', { remap = true })

-- Paste without losing yanked content
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Tab and quickfix list navigations [o]pen [q]uit
vim.keymap.set("n", "<leader>ot", "<cmd>tabnew<cr>")
vim.keymap.set("n", "<leader>oq", "<cmd>copen<cr>")
vim.keymap.set("n", "<leader>qt", "<cmd>tabclose<cr>")
vim.keymap.set("n", "<leader>qq", "<cmd>cclose<cr>")
vim.keymap.set("n", "]t", "<cmd>tabnext<cr>")
vim.keymap.set("n", "[t", "<cmd>tabprev<cr>")
vim.keymap.set("n", "]q", "<cmd>cnext<cr>")
vim.keymap.set("n", "[q", "<cmd>cprev<cr>")

vim.keymap.set("n", "[b", "<cmd>bprevious<cr>")
vim.keymap.set("n", "]b", "<cmd>bnext<cr>")

-- Move text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Quick find replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<leader>s", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Easier scroll
vim.keymap.set("n", "<C-j>", "<C-e>")
vim.keymap.set("n", "<C-k>", "<C-y>")

vim.keymap.set("n",  "<leader>t", function()
    local cmd = vim.fn.filereadable("todo.txt") == 1 and ":e todo.txt" or ":echo 'no todo.txt!'"
    vim.cmd(cmd)
end)

