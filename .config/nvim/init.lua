vim.cmd("colorscheme unokai")

local o = vim.opt

o.termguicolors = true
o.number = true
o.relativenumber = true
o.cursorline = true
o.signcolumn = "yes"
o.numberwidth = 4

o.expandtab = true
o.shiftwidth = 4
o.softtabstop = 4
o.tabstop = 4
o.autoindent = true
o.smartindent = true

o.ignorecase = true
o.smartcase = true
o.hlsearch = false

local map = vim.keymap.set
vim.g.mapleader = " "

map("n", "<leader>e", "<cmd>Ex<cr>")
map({"i", "n"}, "<C-s>", "<cmd>w<cr>")
