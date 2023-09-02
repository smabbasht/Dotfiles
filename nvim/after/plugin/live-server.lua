require('live-server').setup {
    -- Arguments passed to live-server via `vim.fn.jobstart()`
    args = { '--port=7000', '--browser=brave-browser' }
}

