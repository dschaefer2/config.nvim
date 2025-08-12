local mode = { "i", "x", "n", "s" }
vim.keymap.set(mode, "<C-f>", "<Right>")
vim.keymap.set(mode, "<C-b>", "<Left>")
vim.keymap.set(mode, "<C-n>", "<Down>")
vim.keymap.set(mode, "<C-p>", "<Up>")
vim.keymap.set(mode, "<C-a>", "<Home>")
vim.keymap.set(mode, "<C-e>", "<End>")
vim.keymap.set(mode, "<C-d>", "<Del>")
vim.keymap.set(mode, "<C-S-n>", "<PageDown>")
vim.keymap.set(mode, "<C-S-p>", "<PageUp>")

vim.keymap.set("i", "<C-space>", "<C-x><C-o>")
vim.keymap.set("i", "<C-CR>", "<Esc>")
vim.keymap.set("n", "<C-l>", "zz")
vim.keymap.set("n", "<C-k>", "d$")

vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

vim.pack.add({
    "https://github.com/folke/tokyonight.nvim",
})

vim.cmd("colorscheme tokyonight-night")

