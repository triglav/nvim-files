return {
  ---@type LazySpec
  {
    "folke/zen-mode.nvim",
    cmd = {
      "ZenMode",
    },
    keys = {
      { "<Leader>uz", "<Cmd>ZenMode<CR>", desc = "Zen Mode" },
    },
    opts = {
      plugins = {
        kitty = {
          enabled = true,
        },
      },
    },
  },
}
