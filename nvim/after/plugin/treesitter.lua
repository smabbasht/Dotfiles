require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "python", "bash", "fish", "c", "cpp", "cmake", "latex", "rust",
        "bibtex", "lua", "markdown", "vim", "toml", "yaml" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing (for "all")

    highlight = {
        enable = true,

        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}
