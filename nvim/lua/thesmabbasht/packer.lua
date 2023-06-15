-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Using Packer
    -- Themes
    use({
        "olimorris/onedarkpro.nvim",
        as = 'onedark',
        config = function()
            vim.cmd [[colorscheme onedark]]
        end,
        require("onedarkpro").setup {
            highlights = {
                netrwDir = {
                    fg = "#ffc45f",
                    gui = "bold,italic,underline",
                },
            }
        }

    })


    -- Other Plugins
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('mbbill/undotree')
    use('prichrd/netrw.nvim')
    use('tpope/vim-fugitive')
    use('lewis6991/gitsigns.nvim')
    use('github/copilot.vim')
    use('xiyaowong/nvim-transparent')
    use('windwp/nvim-autopairs')
    use('tpope/vim-surround')
    use('lervag/vimtex')
    use('numToStr/Comment.nvim')
    use('hoob3rt/lualine.nvim')
    use('kyazdani42/nvim-web-devicons')



    -- CoC
    use('neoclide/coc.nvim', { branch = 'release' })

    -- Track
    use('wakatime/vim-wakatime')

    -- LSP ZERO
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippet
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'rafamadriz/friendly-snippets' },


        }
    }
end)
