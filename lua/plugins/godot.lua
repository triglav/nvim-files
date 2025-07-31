return {
  {
    "habamax/vim-godot",
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        gdscript = {},
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      vim.fn.setenv("PYTHONWARNINGS", "ignore::UserWarning")

      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      opts.generator = {
        env = {
          PYTHONWARNINGS = "ignore::UserWarning",
        },
      }
      table.insert(opts.sources, nls.builtins.formatting.gdformat)
      table.insert(opts.sources, nls.builtins.diagnostics.gdlint)
      return opts
    end,
  },
}
