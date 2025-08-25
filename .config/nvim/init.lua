--------------------------
-- Options
--------------------------
local o = vim.o
o.termguicolors = true
o.showmode = false
o.background = "dark"
o.number = true
o.relativenumber = true
o.signcolumn = 'yes'
o.winborder = "rounded"
o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.smartindent = true
o.wrap = false
o.swapfile = false
o.undofile = true
o.undolevels = 10000
o.incsearch = true
o.smartcase = true
o.ignorecase = true
o.scrolloff = 8
o.sidescrolloff = 8
o.completeopt = "menu,menuone,fuzzy,noselect,popup,preview"
o.cursorline = false
o.splitright = true
o.splitbelow = true

--------------------------
-- Keymaps
--------------------------
vim.g.mapleader = " "
local map = vim.keymap.set

map('n', '<leader>o', ':update<CR> :source<CR>', { desc = "Source lua file" })
map('n', '<leader>w', ':write<CR>', { desc = "Save current file " })
map('n', '<leader>q', ':quit<CR>', { desc = "Quit" })
map('n', '<leader>ff', ':Pick files<CR>', { desc = "Search files" })
map('n', '<leader>fo', ':Pick oldfiles<CR>', { desc = "Search old files" })
map('n', '<leader>fb', ':Pick buffers<CR>', { desc = "Search buffers" })
map('n', '<leader>fh', ':Pick help<CR>', { desc = "Search help" })
map('n', '<leader>fd', ':Pick diagnostic<CR>', { desc = "Search diagnostics" })
map('n', '<leader>f:', ':Pick history<CR>', { desc = "Search command history" })
map('n', '<leader>/', ':Pick grep_live<CR>', { desc = "Live grep" })
map('n', '<leader>e', ':Oil --float<CR>', { desc = "File explorer (oil)" })

map('n', '<leader>cf', vim.lsp.buf.format, { desc = "Code format" })
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code actions" })
map('n', '<leader>cr', vim.lsp.buf.rename, { desc = "Rename" })
map('n', '<leader>ct', function()
    vim.cmd("lua MiniTrailspace.trim()")
    vim.cmd("lua MiniTrailspace.trim_last_lines()")
end, { desc = "Clean trailing whitespace" })

map('n', '<leader>bd', ':bdelete<CR>', { desc = "Delete current buffer" })

map('n', '<leader>uc', ':Pick colorschemes<CR>', { desc = "Colorschemes" })

map('n', '<C-/>', function()
    vim.cmd(":bot term")
    vim.cmd(":resize 10")
end, { desc = "Open a terminal" })

map('n', '<leader>pu', vim.pack.update, { desc = "Update plugins" })

map('n', '<leader>ce', function()
    local filename = vim.fn.expand("%")
    local basename = vim.fn.expand("%:r")
    local filetype = vim.bo.filetype
    local cmd = nil
    local function checkFile(name)
        local f = io.open(name, "r")
        if f then
            io.close(f)
            return true
        else
            return false
        end
    end
    if filetype == "lua" then
        cmd = "term lua " .. filename
    elseif filetype == "c" then
        if checkFile("./Makefile") then
            cmd = "term make && ./bin/" .. basename
        else
            print("No Makefile detected!")
            return
        end
    end
    if cmd then
        vim.cmd("w")
        vim.cmd("split")
        vim.cmd("resize 10")
        vim.cmd(cmd)
        vim.cmd("norm G")
    else
        print("No interpreter or compiler defined for filetype: '" .. filetype .. "'")
    end
end, { desc = "Code Execute/Compile" })

--------------------------
-- Auto-commands etc
--------------------------
local function augroup(name)
    return vim.api.nvim_create_augroup("customGroup_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
        (vim.hl or vim.highlight).on_yank()
    end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
    group = augroup("resize_splits"),
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    group = augroup("auto_create_dir"),
    callback = function(event)
        if event.match:match("^%w%w+:[\\/][\\/]") then
            return
        end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

--------------------------
-- Plugins
--------------------------
vim.pack.add({
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/echasnovski/mini.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/ribru17/bamboo.nvim" },
})

require "oil".setup()

require "mini.icons".setup()
require "mini.pairs".setup()
require "mini.trailspace".setup()
require "mini.move".setup()
require "mini.git".setup()
require "mini.diff".setup()
require "mini.pick".setup()
require "mini.indentscope".setup()
require "mini.statusline".setup()
require "mini.tabline".setup()
require "mini.extra".setup()
require "mini.surround".setup()

require "mini.snippets".setup()
require "mini.completion".setup({
    window = {
        info = { height = 25, width = 80, border = "rounded" },
        signature = { height = 25, width = 80, border = "rounded" },
    }
})

local miniclue = require('mini.clue')
miniclue.setup({
    triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },

        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },

        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },

        -- `s` key
        { mode = 'n', keys = 's' },
        { mode = 'x', keys = 's' },

        -- Square brackets
        { mode = 'n', keys = ']' },
        { mode = 'n', keys = '[' },

        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },

        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },

        -- Window commands
        { mode = 'n', keys = '<C-w>' },

        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
    },

    clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
    },
})

--------------------------
-- LSP
--------------------------
require "mason".setup()
require "nvim-treesitter.configs".setup({
    ensure_installed = { "lua", "c" },
    auto_install = true,
    highlight = { enable = true },
})

vim.lsp.enable({ "lua_ls", "clangd", "bash-language-server", "marksman" })

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end,
})

--------------------------
-- Colors
--------------------------
require("bamboo").setup({
    style = "multiplex",
    toggle_style_key = "<leader>ut",
    transparent = true,
    code_style = {
        comments = { italic = true, bold = true },
        conditionals = { italic = true },
        keywords = {},
        functions = {},
        namespaces = { italic = true },
        parameters = { italic = true },
        strings = { italic = true },
        variables = {},
    },
    diagnostics = {
        darker = false,
        undercurl = true,
        background = true,
    },
})
require("bamboo").load()
