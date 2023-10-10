require("nvim-tree").setup({
    -- set the position of the nvim tree to right and background_colour as transparent
    sort_by = "case_sensitive",
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    diagnostics = {
        enable = true,
    },
    update_focused_file = {
        enable = true,
    },
    view = {
        width = 30,
        side = 'left',
        number = true,
        relativenumber = true
    },
    -- auto_close = true,
    -- hijack_cursor = true,
    open_on_tab = false,
    -- update_cwd = true,
})

vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
  pattern = "NvimTree_*",
  callback = function()
    local layout = vim.api.nvim_call_function("winlayout", {})
    if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
  end
})

vim.cmd[[hi NvimTreeNormal guibg=0]]
