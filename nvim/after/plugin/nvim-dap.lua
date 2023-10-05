require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
require("dapui").setup()
require("nvim-dap-virtual-text").setup()

-- Debugger
vim.api.nvim_set_keymap("n", "<leader>dt", ":DapUiToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>si", ":DapStepInto<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>so", ":DapStepOver<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>sr", ":DapStepOut<CR>", { noremap = true })