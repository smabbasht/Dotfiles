require("nvim-tree").setup {
    hijack_unnamed_buffer_when_opening = true,
    view = {
        side = "right",
        number = true,
        relativenumber = true,
        signcolumn = "yes",
        width = 35,
        float = {
            enable = false,
            quit_on_focus_loss = true,
        },
    },
}

vim.cmd[[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]
