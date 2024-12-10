return {
    {
        --rust lsp setup, may split into different file
        'simrat39/rust-tools.nvim',
        config = function()
            local rt = require 'rust-tools'

            rt.setup {
                server = {
                    on_attach = function(_, bufnr)
                        -- Hover actions
                        vim.keymap.set('n', '<C-space>', rt.hover_actions.hover_actions, { buffer = bufnr })
                        -- Code action groups
                        vim.keymap.set('n', '<Leader>a', rt.code_action_group.code_action_group, { buffer = bufnr })
                    end,
                },
            }
        end,
    },
    {
        'williamboman/mason.nvim',
        lazy = false,
        config = function()
            require('mason').setup()
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        lazy = false,
        config = function()
            require('mason-lspconfig').setup {
                auto_install = true,
            }
        end,
    },
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            local lspconfig = require 'lspconfig'
            lspconfig.lua_ls.setup {
                capabilities = capabilities,
            }

            require('lspconfig').clangd.setup {
                capabilities = capabilities,
            }

            require('lspconfig').rust_analyzer.setup {
                capabilities = capabilities,
            }
            require('lspconfig').bacon_ls.setup {
                capabilities = capabilities,
            }
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gD', vim.lsp.buf.definition, {})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
        end,
    },
}
