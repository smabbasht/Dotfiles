vim.api.nvim_set_keymap('n', '<leader>sc',
    ':DistantConnect ssh://pakteam@129.21.119.43 options="ssh.backend=libssh,ssh.verbose=true"<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>so', ':DistantOpen ~/research/bnn/bnn-abbas<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>sl', ':DistantLaunch ssh://pakteam@129.21.119.43<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ss', ':DistantSearch<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ssi', ':DistantSystemInfo<CR>', { noremap = true })
