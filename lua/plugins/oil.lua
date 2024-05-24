return {
  {
    "stevearc/oil.nvim",
    keys = {
      { "-", "<CMD>Oil<CR>", desc = "Explorer Oil", remap = true },
    },
    opts = {
      keymaps = {
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["<C-x>"] = "actions.select_split",
        ["<C-r>"] = "actions.refresh",
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
