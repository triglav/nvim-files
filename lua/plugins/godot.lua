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
}
