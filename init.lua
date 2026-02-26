-- set <space> as the leader key
-- must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- enable true color support
vim.opt.termguicolors = true

-- make line numbers default
vim.opt.number = true
vim.opt.relativenumber = false

-- enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- sync clipboard between OS and Neovim.
--  remove this option if you want your OS clipboard to remain independent.
--  see `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- enable break indent
vim.opt.breakindent = true

-- save undo history
vim.opt.undofile = true

-- case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- decrease update time
vim.opt.updatetime = 250

-- decrease mapped sequence wait time
-- displays which-key popup sooner
vim.opt.timeoutlen = 300

-- configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", }

-- preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- show which line your cursor is on
vim.opt.cursorline = true

-- set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true

-- enable line wrapping
vim.opt.wrap = true

-- formatting
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.textwidth = 120

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = " ",
        },
    },
    virtual_text = true, -- show inline diagnostics
})

-- clear search highlights with <Esc>
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- my glorious emacs keys
local mode = { "i", "x", "n", "s" }
vim.keymap.set(mode, "<C-f>", "<Right>")
vim.keymap.set(mode, "<C-b>", "<Left>")
vim.keymap.set(mode, "<C-n>", "<Down>")
vim.keymap.set(mode, "<C-p>", "<Up>")
vim.keymap.set(mode, "<C-a>", "<Home>")
vim.keymap.set(mode, "<C-e>", "<End>")
vim.keymap.set(mode, "<C-d>", "<Del>")

vim.keymap.set("i", "<C-g>", "<Esc>")

vim.keymap.set("n", "<A-f>", "<C-w>l")
vim.keymap.set("n", "<A-b>", "<C-w>h")
vim.keymap.set("n", "<A-n>", "<C-w>j")
vim.keymap.set("n", "<A-p>", "<C-w>k")

vim.keymap.set("n", "<C-x>0", "<C-w>q")
vim.keymap.set("n", "<C-x>1", "<C-w>o")
vim.keymap.set("n", "<C-x>2", "<C-w>s")
vim.keymap.set("n", "<C-x>o", "<C-w>w")

vim.keymap.set("n", "<C-k>", "d$")
vim.keymap.set("n", "<C-l>", "zz")

vim.keymap.set("n", "<leader>pu", vim.pack.update)

-- INFO: colorscheme
vim.pack.add({ "https://github.com/catppuccin/nvim" }, { confirm = false })
vim.cmd.colorscheme("catppuccin")

-- INFO: formatting and syntax highlighting
vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" }, { confirm = false })

require("nvim-treesitter").setup({
    sync_install = false,
    auto_install = true,

    modules = {},
    ignore_install = {},

    ensure_installed = {
        "lua",
        "c",
    },

    highlight = {
        enable = true,
    },
})

-- INFO: completion engine
vim.pack.add({ "https://github.com/saghen/blink.cmp" }, { confirm = false })

require("blink.cmp").setup({
    completion = {
        documentation = {
            auto_show = true,
        },
    },

    sources = {
        -- Remove 'buffer' from this list
        default = { 'lsp', 'path', 'snippets' },
    },

    keymap = {
        ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
        ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
        ['<C-y>'] = { 'select_and_accept', 'fallback' },
        ['<C-e>'] = { 'cancel', 'fallback' },

        ['<Tab>'] = { 'snippet_forward', 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
        ['<CR>'] = { 'select_and_accept', 'fallback' },
        ['<Esc>'] = { 'cancel', 'hide_documentation', 'fallback' },

        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

        ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },

    fuzzy = {
        implementation = "lua",
    },
})

-- INFO: lsp server installation and configuration

vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig", -- default configs for lsps
}, { confirm = false })

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = {
                    'vim',
                    'require'
                },
            },
            format = {
                enable = true,
                defaultConfig = {
                    indent_style = "space",
                    indent_size = 4,
                },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

vim.lsp.enable({
    "lua_ls",
    "sourcekit",
})

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- INFO: better statusline
vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" }, { confirm = false })

require("lualine").setup({
    options = {
        section_separators = { left = "", right = "", },
        component_separators = { left = "", right = "", },
    },
})

-- INFO: keybinding helper
vim.pack.add({ "https://github.com/folke/which-key.nvim" }, { confirm = false })

require("which-key").setup({
    spec = {
        { "<leader>s", group = "[S]earch", icon = { icon = "", color = "green", }, },
    }
})

vim.pack.add({
    "https://github.com/folke/snacks.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
}, { confirm = false })

local snacks = require("snacks")

snacks.setup({
    picker = {},
    explorer = {},
    terminal = {},
})

vim.keymap.set("n", "<leader>f", function () snacks.picker.files() end)
vim.keymap.set("n", "<leader>b", function () snacks.picker.buffers() end)
vim.keymap.set("n", "<leader>e", function () snacks.explorer() end)
vim.keymap.set("n", "<leader>/", function () snacks.picker.grep() end)
vim.keymap.set("n", "<leader>t", function () snacks.terminal.toggle() end)

vim.keymap.set("t", "<A-p>", "<C-\\><C-N><C-w>k")

-- INFO: utility plugins
vim.pack.add({
    "https://github.com/windwp/nvim-autopairs",   -- auto pairs
    "https://github.com/folke/todo-comments.nvim" -- highlight TODO/INFO/WARN comments
}, { confirm = false })

require("nvim-autopairs").setup()
require("todo-comments").setup()

-- uncomment to enable automatic plugin updates
-- vim.pack.update()
