return {
  {
    "simrat39/rust-tools.nvim",
    dependencies = "neovim/nvim-lspconfig",
    opts = {},
    -- opts = {
    --   tools = {
    --     inlay_hunts = {
    --       auto = true,
    --     },
    --   },
    -- },
    -- init = function()
    --   require("lazyvim.util").on_attach(function(_, buffer)
    --     -- stylua: ignore
    --     vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
    --     vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
    --   end)
    -- end,
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        rust_analyzer = {
          check = {
            command = "clippy",
            extraArgs = { "--all", "--", "-W", "clippy::all" },
          },
        },
      },
    },
  },
}
