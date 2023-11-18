local lsp = require("lsp-zero").preset({})

lsp.ensure_installed({
	-- "jsonlint",
	-- "stylua",
	-- "json-lsp",
	-- "css-lsp",
	-- "alex",
	-- "autopep8",
	-- "bash-debug-adapter",
	-- "bash-language-server",
	-- "clang-format",
	-- "cpplint",
	-- "cpptools",
	-- "custom-elements-languageserver",
	-- "debugpy",
	-- "dockerfile-language-server",
	-- "eslint-lsp",
	-- "eslint_d",
	-- "hadolint",
	-- "html-lsp",
	-- "htmlbeautifier",
	-- "latexindent",
	-- "lua-language-server",
	-- "prettierd",
	-- "pylint",
	-- "python-lsp-server",
	-- "remark-cli",
	-- "remark-language-server",
	-- "rust-analyzer",
	-- "rustfmt",
	-- "selene",
	-- "sonarlint-language-server",
	-- "sqlfluff",
	-- "sqlfmt",
	-- "sqlls",
	-- "taplo",
	-- "texlab",
	-- "ts-standard",
	-- "vale",
	-- "yaml-language-server",
	-- "yamlfmt",
	-- "yamllint",
	-- "chrome-debug-adapter",
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp.on_attach(function(client, bufnr)
	--lsp.default_keymaps({buffer = bufnr})
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>gr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>br", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-l>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

-- use lspconfig to setup lsp for rust-analyzer
-- require("lspconfig").rust_analyzer.setup({
-- 	capabilities = lsp.capabilities,
-- 	on_attach = lsp.on_attach,
-- 	cmd = {
-- 		"rustup",
-- 		"run",
-- 		"stable",
-- 		"rust-analyzer",
-- 	},
-- })

vim.diagnostic.config({
	virtual_text = true,
})
