-- Set ',' as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  'tpope/vim-unimpaired',
  'tpope/vim-apathy',
  'tpope/vim-vinegar',
  'tpope/vim-eunuch',
  'tpope/vim-projectionist',
  'gpanders/editorconfig.nvim',

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- LSP to inject LSP diagnostics, code actions, and more via Lua.
      'jose-elias-alvarez/null-ls.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },
  -- Adds git releated signs to the gutter, as well as utilities for managing changes
  { 'lewis6991/gitsigns.nvim', opts = {} },

  'nvim-tree/nvim-web-devicons', -- Icons
  'ellisonleao/gruvbox.nvim', -- Theme

  { -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    opts = {},
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below automatically adds your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  --
  --    An additional note is that if you only copied in the `init.lua`, you can just comment this line
  --    to get rid of the warning telling you that there are not plugins in `lua/custom/plugins/`.
  -- { import = 'custom.plugins' },
  -- Sets vim.ui.select to telescope
  { 'nvim-telescope/telescope-ui-select.nvim' },

  { "kylechui/nvim-surround", version = "*" },
}, {})

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- Splitting a window will put the new window below the current one
vim.o.splitbelow = true
-- Splitting a window will put the new window right of the current one
vim.o.splitright = true

-- String to put at the start of lines that have been wrapped.
vim.o.showbreak = ">> "

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 3
-- The minimal number of columns to scroll horizontally.
vim.o.sidescroll = 1
-- The minimal number of screen columns to keep to the left and to the right of
-- the cursor if 'nowrap' is set.
vim.o.sidescrolloff = 10

-- Minimal initial height of the help window when it is opened with the ":help"
-- command.
vim.o.helpheight = 10
-- Minimal number of lines for the current window.
vim.o.winheight = 2
-- The minimal height of a window, when it's not the current window.
vim.o.winminheight = 0
-- The minimal width of a window, when it's not the current window.
vim.o.winminwidth = 0

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
--vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- The last character of the selection is included in an operation.
vim.o.selection = 'old'

-- Set colorscheme
vim.o.termguicolors = true
vim.o.background = "dark"
require("nvim-web-devicons").setup {
  color_icons = true,
}
require("gruvbox").setup {
  contrast = "hard",
  invert_signs = false,
}
vim.cmd [[colorscheme gruvbox]]

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience

-- Remove the annoying F1 help bind
vim.keymap.set({ 'n', 'v', 'i' }, '<F1>', '<Esc>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Indent with tab also and keep the selection active
vim.keymap.set('v', '<tab>', '>gv', { silent = true })
vim.keymap.set('v', '<s-tab>', '<gv', { silent = true })
vim.keymap.set('v', '>', '>gv', { silent = true })
vim.keymap.set('v', '<', '<gv', { silent = true })

-- Emulate the original behaviour/bindings of 'triglav/vim-visual-increment'
vim.keymap.set('v', '<C-a>', 'g<C-a>')
vim.keymap.set('v', '<C-x>', 'g<C-x>')
vim.keymap.set('v', 'g<C-a>', '<C-a>')
vim.keymap.set('v', 'g<C-x>', '<C-x>')

-- Use CTRL+C and CTRL+V to copy/paste
vim.keymap.set({ 'v', 's' }, '<C-C>', '"+y')
vim.keymap.set({ 'i', 'c' }, '<C-V>', '<C-R>+')

-- Keys for switching between tabs in normal mode.
vim.keymap.set('n', '<Leader>tt', ':tabnew<CR>')
vim.keymap.set('n', '<Leader>tn', ':tabnext<CR>')
vim.keymap.set('n', '<Leader>tp', ':tabprevious<CR>')
vim.keymap.set('n', '<Leader>tc', ':tabclose<CR>')
vim.keymap.set('n', '<Leader>t1', ':tabnext 1<CR>')
vim.keymap.set('n', '<Leader>t2', ':tabnext 2<CR>')
vim.keymap.set('n', '<Leader>t3', ':tabnext 3<CR>')
vim.keymap.set('n', '<Leader>t4', ':tabnext 4<CR>')
vim.keymap.set('n', '<Leader>t5', ':tabnext 5<CR>')
vim.keymap.set('n', '<Leader>t6', ':tabnext 6<CR>')
vim.keymap.set('n', '<Leader>t7', ':tabnext 7<CR>')
vim.keymap.set('n', '<Leader>t8', ':tabnext 8<CR>')
vim.keymap.set('n', '<Leader>t9', ':tabnext 9<CR>')
vim.keymap.set('n', '<Leader>t0', ':tabnext 10<CR>')

-- Easily resize split windows with Ctrl+hjkl
vim.keymap.set('n', '<C-j>', '<C-w>+')
vim.keymap.set('n', '<C-k>', '<C-w>-')
vim.keymap.set('n', '<C-h>', '<C-w><')
vim.keymap.set('n', '<C-l>', '<C-w>>')

-- Stop the highlighting for the 'hlsearch' option
vim.keymap.set('n', '<esc>', ':noh<return>')

-- Strip all trailing whitespace in the current file.
vim.keymap.set('n', '<leader>W', [[:%s/\s\+$//<cr>:let @/=''<CR>]])
-- Reselect the text that was just pasted.
vim.keymap.set('n', '<leader>v', '`[v`]')
vim.keymap.set('n', '<leader>V', '`[V`]')
-- Force redraw.
vim.keymap.set('n', '<Leader>r', ':redraw!<CR>')
-- Easily change directory to the file being edited.
vim.keymap.set('n', '<Leader>cd', ':cd %:p:h<CR>:pwd<CR>')
-- Easy toggle list
vim.keymap.set('n', '<Leader>l', ':set list! list?<CR>')
-- Easy toggle spell
vim.keymap.set('n', '<Leader>s', ':set spell! spell?<CR>')
-- Easy toggle wrap
vim.keymap.set('n', '<Leader>w', ':set wrap! wrap?<CR>')

-- Fugitive commands
vim.keymap.set('n', '<Leader>gd', ':Gdiff<CR>')
vim.keymap.set('n', '<Leader>gb', ':G blame<CR>')
vim.keymap.set('n', '<Leader>gs', ':Gstatus<CR>')
vim.keymap.set('n', '<Leader>gl', ':Glog<CR>')

-- Diff commands
vim.keymap.set('n', '<Leader>dt', ':diffthis<CR>')
vim.keymap.set('n', '<Leader>do', ':diffoff<CR>')
vim.keymap.set('n', '<Leader>dO', ':diffoff!<CR>')
vim.keymap.set('n', '<Leader>du', ':diffupdate<CR>')

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
    theme = 'gruvbox',
  },
  sections = {
    lualine_c = { { 'filename', path = 1 } },
  },
  inactive_sections = {
    lualine_c = { { 'filename', path = 1 } },
  }
}

-- Enable Comment.nvim
require('Comment').setup()

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup()

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      ".git"
    },
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ['<C-p>'] = require('telescope.actions').cycle_history_prev,
        ['<C-n>'] = require('telescope.actions').cycle_history_next,
        ['<C-k>'] = require('telescope.actions').move_selection_previous,
        ['<C-j>'] = require('telescope.actions').move_selection_next,
        ['<C-a>'] = require('telescope.actions').toggle_all,
      },
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_cursor()
    }
  }
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>m', require('telescope.builtin').buffers, { desc = '[m] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<C-p>', function()
  require('telescope.builtin').find_files({ hidden = true })
end, { desc = 'Find Files' })
vim.keymap.set('n', '<C-g>', require('telescope.builtin').git_status, { desc = 'List [G]it status' })
vim.keymap.set('n', '<leader>f', require('telescope.builtin').live_grep, { desc = 'Grep [F]iles' })
vim.keymap.set('n', '<leader>*', require('telescope.builtin').grep_string, { desc = 'Grep current word in Files' })
-- +++ lots of git operations on everything
vim.keymap.set('n', '<leader>tq', require('telescope.builtin').quickfix, { desc = 'Lists items in the [Q]uickfix list' })
vim.keymap.set('n', '<leader>tl', require('telescope.builtin').loclist,
  { desc = [[Lists items from the current window's [L]ocation list]] })
vim.keymap.set('n', '<leader>tpf', require('telescope.builtin').oldfiles, { desc = 'Lists [P]reviously open [F]iles' })
vim.keymap.set('n', '<leader>tpc', require('telescope.builtin').command_history,
  { desc = 'Lists [Previously] executed [C]ommands' })
vim.keymap.set('n', '<leader>tC', require('telescope.builtin').commands,
  { desc = 'Lists available [C]ommands' })
vim.keymap.set('n', '<leader>ts', require('telescope.builtin').search_history,
  { desc = 'Lists [S]earches that were executed recently' })
vim.keymap.set('n', '<leader>th', require('telescope.builtin').help_tags, { desc = 'Lists available [H]elp tags' })
vim.keymap.set('n', '<leader>td', require('telescope.builtin').diagnostics, { desc = 'Lists [D]iagnostics' })
vim.keymap.set('n', '<leader>tz', require('telescope.builtin').spell_suggest,
  { desc = 'Lists spelling suggestions for the current word under the cursor' })
-- +++ lots of LSP stuff
--

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'help', 'vim' },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = false,

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
  nmap('<C-S-K>', vim.lsp.buf.signature_help, 'Signature Documentation')

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
  nmap('<leader>F', vim.lsp.buf.format, '[F]ormat File')
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()
local null_ls = require('null-ls')
null_ls.setup({
  sources = {
    null_ls.builtins.code_actions.eslint.with({ filetypes = { "javascript", "javascriptreact", "svelte", "typescript",
      "typescriptreact", "vue" } }),
    null_ls.builtins.formatting.prettier.with({ filetypes = { "javascript", "javascriptreact", "svelte", "typescript",
      "typescriptreact", "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml", "markdown", "markdown.mdx",
      "graphql", "handlebars" } })
  }
})

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
  ['angularls'] = function()
    local new_root_dir = require 'lspconfig.util'.root_pattern('angular.json', 'project.json')
    require 'lspconfig'.angularls.setup {
      root_dir = new_root_dir
    }
  end,
}

-- Turn on lsp status information
require('fidget').setup()

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
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

require("nvim-surround").setup()

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
