local util = require("lspconfig.util")

return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        angularls = {
          root_dir = util.root_pattern("angular.json", "project.json"),
        },
      },
      setup = {
        angularls = function()
          LazyVim.lsp.on_attach(function(client)
            --HACK: disable angular renaming capability due to duplicate rename popping up
            client.server_capabilities.renameProvider = false
          end, "angularls")
        end,
      },
    },
  },
  {
    "garymjr/nvim-snippets",
    opts = {
      extended_filetypes = {
        ["html"] = { "angular" },
        ["jsonc"] = { "angular" },
        ["typescript"] = { "angular" },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = { "haydenmeade/neotest-jest" },
    opts = function(_, opts)
      table.insert(opts.adapters, require("neotest-jest")({}))
    end,
  },
}
