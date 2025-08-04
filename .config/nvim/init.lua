-- Options
local o = vim.o
o.termguicolors = true
o.background = "dark"
o.number = true
o.relativenumber = true
o.signcolumn = 'yes'
o.winborder = "rounded"
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.smartindent = true
o.wrap = false
o.swapfile = false
o.undofile = true
o.incsearch = true
o.smartcase = true
o.ignorecase = true
o.scrolloff = 8
o.sidescrolloff = 8

-- Keymaps
vim.g.mapleader = " "
local map = vim.keymap.set

map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')
map('n', '<leader>f', ':Pick files<CR>')
map('n', '<leader>h', ':Pick help<CR>')
map('n', '<leader>/', ':Pick grep_live<CR>')
map('n', '<leader>e', ':Oil --float<CR>')

map('n', '\\', ':term ')

map('n', '<leader>cf', vim.lsp.buf.format)
map('n', '<leader>ca', vim.lsp.buf.code_action)

map('n', '<leader>d', ':bdelete<CR>')

-- Plugins
vim.pack.add({
	{ src = "https://github.com/neanias/everforest-nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/mason-org/mason.nvim" },
})

require "oil".setup()

require "mini.icons".setup()
require "mini.pairs".setup()
require "mini.surround".setup()
require "mini.move".setup()
require "mini.git".setup()
require "mini.diff".setup()
require "mini.pick".setup()
require "mini.indentscope".setup()
require "mini.statusline".setup()
require "mini.tabline".setup()
require "mini.jump2d".setup()
require "mini.extra".setup()

-- LSP
require "mason".setup()
require "nvim-treesitter.configs".setup({
	ensure_installed = { "lua", "c" },
	auto_install = true,
	highlight = { enable = true },
})

vim.lsp.enable({ "lua_ls", "clangd" })

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local c = vim.lsp.get_client_by_id(ev.data.client_id)
		if c:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, c.id, ev.buf, { autotrigger = true })
		end
	end,
})
vim.cmd("set completeopt+=noselect")

-- Colors
require("everforest").setup({ background = "medium", })
vim.cmd("colorscheme everforest")
-- vim.cmd(":hi statusline guibg=NONE")
