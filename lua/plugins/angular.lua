return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      inlay_hints = { enabled = false },
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
