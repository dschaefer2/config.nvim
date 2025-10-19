local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local mode = { "i", "x", "n", "s" }
vim.keymap.set(mode, "<C-f>", "<Right>")
vim.keymap.set(mode, "<C-b>", "<Left>")
vim.keymap.set(mode, "<C-n>", "<Down>")
vim.keymap.set(mode, "<C-p>", "<Up>")
vim.keymap.set(mode, "<C-a>", "<Home>")
vim.keymap.set(mode, "<C-e>", "<End>")
vim.keymap.set(mode, "<C-d>", "<Del>")
vim.keymap.set(mode, "<C-S-n", "<PgDown>")
vim.keymap.set(mode, "<C-S-P", "<PgUp>")

vim.keymap.set("n", "<C-k>", "d$")
vim.keymap.set("n", "<C-x><C-s>", ":w<CR>")
vim.keymap.set("n", "<C-x>S", ":wa<CR>")

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
vim.keymap.set("n", "<leader>ss", "<C-w>w", { desc = "Switch between splits"})

vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)

