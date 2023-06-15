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

