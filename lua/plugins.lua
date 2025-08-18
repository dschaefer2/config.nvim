vim.pack.add({
    'https://github.com/folke/tokyonight.nvim',
	'https://github.com/folke/which-key.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim',
})

-- Color theme
vim.cmd('colorscheme tokyonight-night')

-- which-key
require('which-key').setup()
vim.keymap.set('n', '<leader>?', function() require('which-key').show() end, { desc = 'Buffer Local Keymap' })

-- status line
require('lualine').setup({})

-- Larger configs
require('plugins.snacks')

