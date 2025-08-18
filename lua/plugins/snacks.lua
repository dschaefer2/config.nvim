vim.pack.add({
    "https://github.com/folke/snacks.nvim",
})

require('snacks').setup({
    picker = { enabled = true },
    explorer = { enabled = true },
    notifier = { enabled = true },
	lazygit = { enabled = true },
	terminal = { enabled = true },
})

vim.keymap.set('n', '<leader>e', function() require('snacks').explorer() end, { desc = 'File Explorer' })
vim.keymap.set('n', '<leader><space>', function() require('snacks').picker.smart() end, { desc = 'Smart Find Files' })
vim.keymap.set('n', '<leader>b', function() require('snacks').picker.buffers() end, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>g', function() require('snacks').lazygit() end, { desc = 'Lazy Git' })
vim.keymap.set('n', '<leader>t', function() require('snacks').terminal() end, { desc = 'Terminal' })

