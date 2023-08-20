--------------------------------------------------------------------------------------------------------
-- Init.lua
--------------------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------------------
-- Set.lua
--------------------------------------------------------------------------------------------------------
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.o.numberwidth = 1
vim.opt.cursorline = true

vim.opt.mouse = ""

vim.g.python3_host_prog = '/usr/bin/python3'

vim.g.mapleader = " "
vim.g.transparent_enabled = true

vim.g.surround_no_insert_space = 1

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- Reduce Alacritty padding when entering Neovim
vim.cmd([[
  autocmd VimEnter * silent! !sed -i -E '/padding:/,/x: [0-9]+/ s/(x|y): [0-9]+/\1: 0/' ~/.config/alacritty/alacritty.yml | alacritty --daemonize
]])

-- Increase Alacritty padding when exiting Neovim
vim.cmd([[
  autocmd VimLeave * silent! !sed -i -E '/padding:/,/x: [0-9]+/ s/(x|y): [0-9]+/\1: 8/' ~/.config/alacritty/alacritty.yml | alacritty --daemonize
]])


--------------------------------------------------------------------------------------------------------
-- Remap.lua
--------------------------------------------------------------------------------------------------------
vim.g.mapleader = " "

-- Source init.lua
vim.keymap.set('n', '<leader>_', function()
    vim.cmd('so ~/.config/nvim/init.lua')
end, { desc = 'source init.lua' })

-- No-op the arrow keys
vim.keymap.set({ 'n', 'v', 'i' }, '<Up>', '<nop>')
vim.keymap.set({ 'n', 'v', 'i' }, '<Down>', '<nop>')
vim.keymap.set({ 'n', 'v', 'i' }, '<Left>', '<nop>')
vim.keymap.set({ 'n', 'v', 'i' }, '<Right>', '<nop>')

-- map H to 'Hzz' and L to 'Lzz
vim.keymap.set({ 'n', 'v' }, 'H', 'Hzz')
vim.keymap.set({ 'n', 'v' }, 'L', 'Lzz')

vim.keymap.set('n', '<leader>q', vim.cmd.bdelete)
vim.keymap.set('n', '<leader>l', vim.cmd.bnext)
vim.keymap.set('n', '<leader>h', vim.cmd.bprevious)

-- Browse Files
vim.keymap.set('n', '<leader>bf', vim.cmd.Ex)
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Toggle Transparency
vim.keymap.set('n', '<leader>tt', vim.cmd.TransparentToggle, { silent = true }) -- toggle transparent
vim.keymap.set("v", "<leader>y", [["+y"<CR>]])                                  -- copy to system clipboard
-- vim.keymap.set("n", "<leader>y", [["+y"<CR>]]) -- copy to system clipboard

vim.keymap.set("v", "<leader>p", [["_dP]])

vim.keymap.set("v", "J", [[:m '>+1<CR>gv=gv]])
vim.keymap.set("v", "K", [[:m '>-2<CR>gv=gv]])

vim.keymap.set({ "n", "v" }, "<leader>op", [[o<esc>p]])
vim.keymap.set({ "n", "v" }, "<leader>Op", [[O<esc>p]])

-- vim.keymap.set("n", "<leader>s", [[:w<CR>]] ) -- search and replace
vim.keymap.set("i", "<C-s>", [[<esc>:w<CR>li]])  -- search and replace
vim.keymap.set("n", "<C-s>", [[:w<CR>]])         -- search and replace

-- [f]ormat the Buffer
vim.keymap.set("n", "<F5>", vim.lsp.buf.format)

-- See registers
vim.keymap.set("n", "<leader>rg", [[:reg<CR>]])

-- Delete untill the beginning of the line
vim.keymap.set("n", "B", [[c^]])

-- Make current file executable
vim.keymap.set("n", "<leader>x", "[[:!chmod +x %<CR><CR>]]")

--------------------------------------------------------------------------------------------------------
-- Lazy.lua
--------------------------------------------------------------------------------------------------------
local plugins = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/playground',
    'mbbill/undotree',
    'prichrd/netrw.nvim',
    'olimorris/onedarkpro.nvim',
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',
    'github/copilot.vim',
    'xiyaowong/nvim-transparent',
    'windwp/nvim-autopairs',
    'tpope/vim-surround',
    'lervag/vimtex',
    'numToStr/Comment.nvim',
    'hoob3rt/lualine.nvim',
    'kyazdani42/nvim-web-devicons',
    'neoclide/coc.nvim',
    'wakatime/vim-wakatime',
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    -- LSP ZERO
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
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
}

local opts = {}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup(plugins, opt)
