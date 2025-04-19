-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "<S-CR>", "<Esc>")

-- Emacs keys
vim.keymap.set("i", "<C-p>", "<Up>")
vim.keymap.set("i", "<C-n>", "<Down>")
vim.keymap.set("i", "<C-f>", "<Right>")
vim.keymap.set("i", "<C-b>", "<Left>")
vim.keymap.set("i", "<C-a>", "<Home>")
vim.keymap.set("i", "<C-e>", "<End>")

vim.keymap.set("v", "<C-p>", "<Up>")
vim.keymap.set("v", "<C-n>", "<Down>")
vim.keymap.set("v", "<C-f>", "<Right>")
vim.keymap.set("v", "<C-b>", "<Left>")
vim.keymap.set("v", "<C-a>", "<Home>")
vim.keymap.set("v", "<C-e>", "<End>")

vim.keymap.set("n", "<C-v>", "<C-f>")
vim.keymap.set("n", "<C-S-v>", "<C-b>")
vim.keymap.set("n", "<C-p>", "<Up>")
vim.keymap.set("n", "<C-n>", "<Down>")
vim.keymap.set("n", "<C-f>", "<Right>")
vim.keymap.set("n", "<C-b>", "<Left>")
vim.keymap.set("n", "<C-a>", "<Home>")
vim.keymap.set("n", "<C-e>", "<End>")
