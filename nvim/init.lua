-- This file is a modified version of kickstart.lua from the OpenOS project.


-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

--set mouse=

require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }

  -- use ()
  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }
  ---- plugins --------------------------------------------------------------------

  --          Plugins I installed

  ---- plugins_--------------------------------------------------------------------

  -- use 'nvim-tree/nvim-web-devicons'
  use 'github/copilot.vim'
  -- use 'rafamadriz/friendly-snippets'
  use 'tiagovla/tokyodark.nvim'
  use 'xiyaowong/nvim-transparent'
  use 'mbbill/undotree'
  use 'windwp/nvim-autopairs'
  use 'tpope/vim-surround'
  use 'lervag/vimtex' -- LaTeX support
  -- use 'SirVer/ultisnips'
  -- use 'olimorris/onedarkpro.nvim'
  -- require('coc').setup(
  --   {
  --     "coc-python",
  --     "coc-clangd",
  --   }
  -- )
  -- use {
  --   'marioortizmanero/adoc-pdf-live.nvim',
  --   config = "require('adoc_pdf_live').setup()"
  -- }
  use {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    requires = {'nvim-tree/nvim-web-devicons'}
  }
  --
  ---------- Other Minor Cofigurations (this code block works only here right now, will fix it hopefuly) ------------
  --
  -- Path for python
  vim.g.python3_host_prog = '/usr/bin/python3'

  -- Vim Commands
  vim.opt.incsearch = true -- search as you type
  vim.opt.hlsearch = true  -- highlight search results
  vim.cmd [[set cursorline]]
  vim.cmd [[set noswapfile]]
  vim.cmd [[set relativenumber]]
  vim.cmd [[set scrolloff=5]]
  -- vim.cmd [[TransparentEnable]]

  -- Colorscheme
  -- vim.cmd [[colorscheme tokyodark]]
  -- vim.g.tokyodark_enable_italic = true
  -- vim.g.tokyodark_enable_bold = true
  -- vim.o.termguicolors = true
  -- vim.g.tokyodark_transparent_background = true
  -- vim.g.tokyodark_sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' }


  --------x plugins x-----------------------------------------------------------------------------------------------

  -- Flutter
  use { 'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim' }
  require("flutter-tools").setup {} -- use defaults

  -- Snippets
  use {
    'Shougo/deoplete.nvim',
    run = ':UpdateRemotePlugins'
  }

  -- Enable deoplete at startup
  vim.g.deoplete_enable_at_startup = 1

  -- Install neosnippet.vim and neosnippet-snippets
  use {'Shougo/neosnippet.vim'}
  use {'Shougo/neosnippet-snippets'}

  --
  -- use { 'Shougo/neosnippet.vim'}
  -- use { 'Shougo/neosnippet-snippets'}
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
  -- -- Enable neosnippet for python files
  -- vim.g.neosnippet_snippets_directory = '~/.config/nvim/snippets/'
  -- vim.g.neosnippet_disable_runtime_snippets = 0
  -- vim.g.neosnippet_filetype_map = { python = 'python.snippets' }
  -- vim.g.neosnippet_filetype_suppress = {}
  -- vim.g.neosnippet.snippets_directory = vim.fn.expand("~/.config/nvim/snippets")

  -- use {
  --   'SirVer/ultisnips',
  --   config = function()
  --     vim.g.UltiSnipsExpandTrigger = '<tab>'
  --     vim.g.UltiSnipsJumpForwardTrigger = '<c-b>'
  --     vim.g.UltiSnipsJumpBackwardTrigger = '<c-z>'
  --
  --     -- Python snippets
  --     vim.g.python_highlight_all = 1
  --     vim.g.UltiSnipsSnippetDirectories = { 'UltiSnips' }
  --     vim.g.UltiSnipsFiletypes = {
  --       python = { 'python' },
  --       c = { 'c' },
  --       cpp = { 'cpp' },
  --       cuda = { 'cuda' },
  --       dart = { 'dart' }
  --     }
  --   end,
  --   requires = 'honza/vim-snippets'
  -- }
  --
  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'

  -- use 'navarasu/onedark.nvim' -- Theme inspired by Atom
  use 'nvim-lualine/lualine.nvim'           -- Fancier statusline
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'numToStr/Comment.nvim'               -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth'                    -- Detect tabstop and shiftwidth automaticall
  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then
    plugins(use)
  end

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Keymap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})


-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'tokyodark',
    component_separators = '|',
    section_separators = '',
  },
}

-- Enable Comment.nvim
require('Comment').setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup {
  char = ' ',
  -- char = '┊',
  show_trailing_blankline_indent = false,
}

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'dart', 'help', 'vim' },

  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)


---- Config -------------------------------------------------------------

--        Configurations I wrote for my personal use

---- Config_ ------------------------------------------------------------

-- Setups for Plgins

require('nvim-autopairs').setup()
-- require('nvim-autopairs.completion.cmp').setup({
--   map_cr = true, --  map <CR> on insert mode
--   map_complete = true, -- it will auto insert `(` after select function or method item
--   auto_select = true, -- automatically select the first item
-- })
-- setup for vim-surround
-- require('vim-surround').setup({
--   mappings_style = 'surround',
-- })

-- Switch Buffers


-- map H to 'Hzz' and L to 'Lzz
vim.keymap.set({ 'n', 'v' }, 'H', 'Hzz')
vim.keymap.set({ 'n', 'v' }, 'L', 'Lzz')

vim.keymap.set('n', '<leader>q', vim.cmd.bdelete)
vim.keymap.set('n', '<leader><Right>', vim.cmd.bnext)
vim.keymap.set('n', '<leader><Left>', vim.cmd.bprevious)

-- Browse Files
vim.keymap.set('n', '<leader>bf', vim.cmd.Ex)
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Toggle Transparency
vim.keymap.set('n', '<leader>tt', vim.cmd.TransparentToggle, { silent = true }) -- toggle transparent
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) -- transparent background
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- transparent background

-- Keymap to copy to system clipboard
vim.keymap.set("v", "<leader>y", ":w !xclip -i -sel c\n<leader>") -- copy to system clipboard
--
-- Primeagen's Keymaps
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- search and replace
vim.keymap.set("n", "<F5>", vim.lsp.buf.format)                                          -- [f]ormat the Buffer

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")              -- Open previous sessions through tmux


--
-- LaTeX related settings
-- require('adoc_pdf_live').setup()
-- vim.keymap.set("n", "<leader>lt", vim.cmd.AdocPdfLiveStart) -- Open previous sessions through tmux
--
-----x Config x-----------------------------------------------------------


-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {}
--   clangd = {},
--   pyright = {
--     settings = {
--       python = {
--         analysis = {
--           typeCheckingMode = 'off',
--           autoSearchPaths = true,
--           useLibraryCodeForTypes = true,
--         },
--       },
--     },
--   },
--   prosemd_lsp = {},
--   remark_ls = {},
--   lua_ls = {},
-- dartls = {
--   settings = {
--     dart = {
--       sdkPath = '/usr/lib/dart',
--     },
--   },
-- },
--

-- dartls = {
--   settings = {
--     dart = {
--       sdkPath = '/usr/lib/dart',
--     },
--   },
-- },
-- ltex = {},
-- ltex-ls = {},
-- python_language_server = {},
-- prosemd_language_server = {},
-- remark_language_server = {},
-- lua_language_server = {},
-- gopls = {},
-- pyright = {},
-- rust_analyzer = {},
-- tsserver = {},

-- sumneko_lua = {
--   Lua = {
--     workspace = { checkThirdParty = false },
--     telemetry = { enable = false },
--   },
-- },
-- }

-- Setup neovim lua configuration
require('neodev').setup()
--
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    -- print('LSP: ' .. server_name .. ' is ready')
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- Turn on lsp status information
require('fidget').setup()

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<S-Right>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Left>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}


vim.cmd [[colorscheme tokyodark]]
vim.g.tokyodark_enable_italic = true
vim.g.tokyodark_enable_bold = true

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
