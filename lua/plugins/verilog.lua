return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = { ensure_installed = { "verilog" } },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.verible.setup({
                cmd = { "verible-verilog-ls", "--rules_config_search" },
                root_dir = lspconfig.util.root_pattern("verible.filelist", vim.fn.getcwd()),
            })
        end,
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                verilog = { "verible" },
                systemverilog = { "verible" },
            },
            formatters = {
                verible = {
                    prepend_args = {
                        "--indentation_spaces",
                        "4",
                    },
                },
            },
        },
    },
}
