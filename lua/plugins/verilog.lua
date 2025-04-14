return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "verilog",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                verible = {
                    root_dir = function(fname)
                        return vim.fs.dirname(vim.fs.find("verible.filelist", { path = fname, upward = true })[1])
                    end,
                },
            },
        },
    },
}
