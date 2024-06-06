-- vim.keymap.set("n", "H", ":bp<CR>", {})
-- vim.keymap.set("n", "L", ":bn<CR>", {})

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set mouse=")
vim.cmd("set foldlevel=20")
vim.cmd("set foldcolumn=1")
vim.cmd("set foldmethod=expr")
vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
vim.g.mapleader = " "
vim.o.undofile = true

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', 'H', '<Cmd>BufferPrevious<CR>', opts)
map('n', 'L', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-H>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A-L>', '<Cmd>BufferMoveNext<CR>', opts)
map('n', '<leader>c', '<Cmd>BufferClose<CR>', opts)
