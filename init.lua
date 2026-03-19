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

-- my glorious emacs keys
local mode = { "i", "x", "n", "s" }
vim.keymap.set(mode, "<C-g>", "<Esc>")
vim.keymap.set(mode, "<C-f>", "<Right>")
vim.keymap.set(mode, "<C-b>", "<Left>")
vim.keymap.set(mode, "<C-n>", "<Down>")
vim.keymap.set(mode, "<C-p>", "<Up>")
vim.keymap.set(mode, "<C-a>", "<Home>")
vim.keymap.set(mode, "<C-e>", "<End>")
vim.keymap.set(mode, "<C-d>", "<Del>")

vim.keymap.set("n", "<C-BS>", "diw")
vim.keymap.set("i", "<C-x><C-s>", "<Esc>:w<CR>")
vim.keymap.set("n", "<C-x><C-s>", ":w<CR>")
vim.keymap.set("n", "<C-x>c", ":q<CR>")
vim.keymap.set("n", "<C-g>", "<Esc>:nohlsearch<CR>")

vim.keymap.set("n", "<C-x>0", "<C-w>q")
vim.keymap.set("n", "<C-x>1", "<C-w>o")
vim.keymap.set("n", "<C-x>2", "<C-w>s")
vim.keymap.set("n", "<C-x>o", "<C-w>w")

vim.keymap.set("i", "<C-k>", "<Esc>ld$a")
vim.keymap.set("n", "<C-k>", "d$")
vim.keymap.set("n", "<C-l>", "zz")
vim.keymap.set("n", "<C-s>", "/")

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

vim.pack.add({ "https://codeberg.org/mfussenegger/nvim-dap" }, { confirm = false })

local dap = require("dap")

vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug Continue" })
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dd", dap.clear_breakpoints, { desc = "Clear Breakpoints" })
vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Run Last Configuration" })
vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Restart Current Session" })
vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "Terminate Session" })

vim.fn.sign_define('DapBreakpoint', { text='🛑', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text='🔍', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text='🚫', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })

dap.adapters.lldb = {
    type = "executable",
    command = "lldb-dap"
}

-- We'll manage our own configs to allow for prebuild and such
dap.swiftpm = {}
local root = vim.fs.root(0, "Package.swift")
if root then
    local filepath = vim.fs.joinpath(root, ".vscode", "nvim-dap.json")
    local f = io.open(filepath, "r")
    if f then
        local content = f:read("*a")
        f:close()

        local ok, configs = pcall(vim.json.decode, content)
        if ok then
            dap.swiftpm.configs = configs
        else
            vim.notify("Failed to parse " .. filepath, vim.log.levels.ERROR)
        end
    end
end

function SwiftBuild(command)
    Snacks.terminal.open(command, {
        auto_close = false,
        win = {
            position = "bottom",
            on_close = function(win)
                vim.fn.setqflist({}, " ", {
                    title = command,
                    lines = win:lines(),
                    efm = "%E%f:%l:%c: %t%*[^:]: %m,%-C%.%#"
                })
            end
        }
    })
end

vim.keymap.set("n", "<leader>b", function()
    SwiftBuild("swift build")
end)

vim.keymap.set("n", "<leader>ds", function()
    local desc = vim.json.decode(vim.fn.system({"swift", "package", "describe", "--type", "json"}))
    local execs = {}
    for _, product in ipairs(desc.products) do
        if product.type.executable ~= nil then
            table.insert(execs, { text = product.name })
        end
    end

    Snacks.picker.pick({
        source = "swiftpm_configs",
        items = dap.swiftpm.configs,
        format = "text",
        layout = {
            preset = "select"
        },
        confirm = function(picker, item)
            picker:close()
            vim.schedule(function()
                Snacks.input.input({
                    prompt = "Args"
                }, function(input)
                    if input == nil then
                        return
                    end
                    local cmd = { item.text }
                    for _, v in ipairs(vim.split(input, " +")) do
                        table.insert(cmd, v)
                    end
                    print(vim.inspect(cmd))
                end)
           end)
        end
    })
end)

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

vim.keymap.set("n", "<leader>ff", snacks.picker.files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fb", snacks.picker.buffers, { desc = "find Buffers" })
vim.keymap.set("n", "<leader>e", function() snacks.explorer() end, { desc = "Explorer" })
vim.keymap.set("n", "<leader>fg", snacks.picker.grep, { desc = "Grep Files" })
vim.keymap.set("n", "<leader>t", snacks.terminal.toggle, { desc = "Toggle Terminal" })
vim.keymap.set("n", "<leader>fr", snacks.picker.recent, { desc = "Recent Files" })
vim.keymap.set("n", "<leader>fq", snacks.picker.qflist, { desc = "Quickfix" })

vim.keymap.set("n", "<leader>gd", snacks.picker.lsp_definitions, { desc = "Go to Definition" })
vim.keymap.set("n", "<leader>gD", snacks.picker.lsp_declarations, { desc = "Go to Declaration" })
vim.keymap.set("n", "<leader>gr", snacks.picker.lsp_references, { nowait = true, desc = "Find References" })
vim.keymap.set("n", "<leader>gI", snacks.picker.lsp_implementations, { desc = "Go to Implementation" })
vim.keymap.set("n", "<leader>gy", snacks.picker.lsp_type_definitions, { desc = "Go to Type Definition" })
vim.keymap.set("n", "<leader>gci", snacks.picker.lsp_incoming_calls, { desc = "Calls Incoming" })
vim.keymap.set("n", "<leader>gco", snacks.picker.lsp_outgoing_calls, { desc = "Calls Outgoing" })
vim.keymap.set("n", "<leader>gs", snacks.picker.lsp_symbols, { desc = "Find Symbols" })
vim.keymap.set("n", "<leader>sS", snacks.picker.lsp_workspace_symbols, { desc = "Find Workspace Symbols" })

vim.keymap.set("t", "<C-x>o", "<C-\\><C-N><C-w>w")

-- INFO: utility plugins
vim.pack.add({
    "https://github.com/windwp/nvim-autopairs",   -- auto pairs
    "https://github.com/folke/todo-comments.nvim" -- highlight TODO/INFO/WARN comments
}, { confirm = false })

require("nvim-autopairs").setup()
require("todo-comments").setup()

-- uncomment to enable automatic plugin updates
-- vim.pack.update()
