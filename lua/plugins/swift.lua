return {
    {
        'nvim-treesitter/nvim-treesitter',
        opts = {
            ensure_installed = {
                'swift',
            },
        },
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require 'lspconfig'
            lspconfig.sourcekit.setup {}
        end,
    },
    {
        'mfussenegger/nvim-dap',
        config = function()
            local dap = require 'dap'
            dap.adapters.lldb = {
                type = 'executable',
                command = 'xcrun',
                args = { 'lldb-dap' },
            }

            dap.providers.configs['swift'] = function()
                local descstr = vim.fn.system 'swift package describe --type json'
                if vim.v.shell_error ~= 0 then
                    return {}
                end
                local outputPath = vim.fn.system 'swift build --show-bin-path'
                outputPath = outputPath:sub(1, -2)
                if vim.v.shell_error ~= 0 then
                    return {}
                end

                local desc = vim.fn.json_decode(descstr)
                local targets = desc.targets
                local configs = {}
                for _, target in pairs(targets) do
                    if target.type == 'executable' then
                        table.insert(configs, {
                            name = target.name,
                            type = 'lldb',
                            request = 'launch',
                            program = outputPath .. '/' .. target.name,
                            cwd = '${workspaceFolder}',
                        })
                    end
                end
                return configs
            end
        end,
    },
}
