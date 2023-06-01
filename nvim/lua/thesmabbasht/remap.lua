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
