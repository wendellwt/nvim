-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- copied from youtube, not sure about these:
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

-- have no idea what this is, or why I would want it:
-- maybe it is : clear search?
vim.keymap.set('n', '<leader>h', 'nohlsearch<CR>')

-- from starterkit:

local keymap = vim.keymap

-- General keymaps
keymap.set("i", "jk", "<ESC>") -- exit insert mode with jk
keymap.set("i", "ii", "<ESC>") -- exit insert mode with ii

-- Tab management - hardly used, buffers are used more
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open a new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close a tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- previous tab


keymap.set("n", "<leader>sx", ":close<CR>") -- close split window

-- Nvim-tree
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>") -- toggle focus to file explorer
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>") -- find file in file explorer


-- LSP - of marginal use, may be deleted
keymap.set('n', '<leader>gg', ':lua vim.lsp.buf.hover()<CR>')
keymap.set('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>')
keymap.set('n', '<leader>gD', ':lua vim.lsp.buf.declaration()<CR>')
keymap.set('n', '<leader>gi', ':lua vim.lsp.buf.implementation()<CR>')
keymap.set('n', '<leader>gt', ':lua vim.lsp.buf.type_definition()<CR>')
keymap.set('n', '<leader>gr', ':lua vim.lsp.buf.references()<CR>')
keymap.set('n', '<leader>gs', ':lua vim.lsp.buf.signature_help()<CR>')
keymap.set('n', '<leader>rr', ':lua vim.lsp.buf.rename()<CR>')
keymap.set('n', '<leader>gf', ':lua vim.lsp.buf.format({async = true})<CR>')
keymap.set('v', '<leader>gf', ':lua vim.lsp.buf.format({async = true})<CR>')
keymap.set('n', '<leader>ga', ':lua vim.lsp.buf.code_action()<CR>')
keymap.set('n', '<leader>gl', ':lua vim.diagnostic.open_float()<CR>')
keymap.set('n', '<leader>gp', ':lua vim.diagnostic.goto_prev()<CR>')
keymap.set('n', '<leader>gn', ':lua vim.diagnostic.goto_next()<CR>')
keymap.set('n', '<leader>tr', ':lua vim.lsp.buf.document_symbol()<CR>')
keymap.set('i', '<C-Space>',  ':lua vim.lsp.buf.completion()<CR>')

