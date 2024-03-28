-- vim.keymap.set("n", "H", ":bp<CR>", {})
-- vim.keymap.set("n", "L", ":bn<CR>", {})

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set mouse=")
vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', 'H', '<Cmd>BufferPrevious<CR>', opts)
map('n', 'L', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-H>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A-L>', '<Cmd>BufferMoveNext<CR>', opts)
map('n', '<leader>c', '<Cmd>BufferClose<CR>', opts)
