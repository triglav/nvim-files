return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        angularls = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "css", "html", "javascript", "jsdoc", "scss", "typescript" })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "css-lsp", "html-lsp", "stylelint-lsp" })
    end,
  },
  {
    "nvim-neotest/neotest",
    -- dependencies = { "haydenmeade/neotest-jest" },
    -- The following fixes tests not working in NX monorepo
    -- Can be reverted once https://github.com/nvim-neotest/neotest-jest/pull/64 is merged
    dependencies = { "guivazcabral/neotest-jest" },
    opts = function(_, opts)
      table.insert(opts.adapters, require("neotest-jest")({}))
    end,
  },
}
