local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>sp', builtin.find_files, {})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})
vim.keymap.set('n', '<leader> ', builtin.buffers, {})
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })


-- Remaps I added
------------------
vim.keymap.set('n', '<leader>sf', function()
    require('telescope.builtin').find_files(
        {
            cwd = os.getenv("HOME"),
            -- ignore = { "*/.vim/undodir", "~/.cache/*" },
            file_ignore_patterns = {
                "undodir", ".cache", ".cargo", ".rustup", ".local", ".npm", ".node-gyp", "drive"
            }
        }
    )
end, { desc = '[S]earch [F]iles' })
------------------
vim.keymap.set('n', '<leader>sF', function()
    require('telescope.builtin').find_files(
        {
            cwd = os.getenv("HOME"),
            -- ignore = { "*/.vim/undodir", "~/.cache/*" },
            hidden=true,
            file_ignore_patterns = {
                "undodir", ".cache", ".cargo", ".rustup", ".local", ".npm", ".node-gyp", "drive"
            }
        }
    )
end, { desc = '[S]earch Hidden [F]iles' })
------------------
vim.keymap.set('n', '<leader>sd', function()
    require('telescope.builtin').lsp_document_diagnostics()
end, { desc = '[S]earch [D]iagnostics' })
------------------
