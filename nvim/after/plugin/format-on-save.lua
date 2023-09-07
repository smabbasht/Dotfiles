local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

format_on_save.setup({
  exclude_path_patterns = {
    "/node_modules/",
    ".local/share/nvim/lazy",
  },
  formatter_by_ft = {
    css = formatters.prettierd,
    html = formatters.htmlbeautifier,
    c = formatters.clangformat,
    cpp = formatters.clangformat,
    javascript = formatters.prettierd,
    json = formatters.prettierd,
    lua = formatters.stylua,
    markdown = formatters.prettierd,
    python = formatters.autopep8,
    rust = formatters.rustfmt,
    sh = formatters.shfmt,
    sql = formatters.sqlfmt,
    latex = formatters.latexindent,
    typescript = formatters.prettierd,
    typescriptreact = formatters.prettierd,
    yaml = formatters.yamlfmt,
},

  -- Optional: fallback formatter to use when no formatters match the current filetype
  fallback_formatter = {
    formatters.remove_trailing_whitespace,
    formatters.remove_trailing_newlines,
    formatters.prettierd,
  }

})
