local map = vim.keymap.set
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<leader>e", "<cmd>Ex<cr>")
map({ "n", "i", }, "<C-s>", "<Esc><cmd>w<cr>")

map("n", "<leader>bd", "<cmd>bdelete<cr>")
map("n", "<leader>bn", "<cmd>bnext<cr>")
map("n", "<leader>bp", "<cmd>bprev<cr>")
