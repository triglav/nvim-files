local Util = require("lazyvim.util")

return {
  {
    "telescope.nvim",
    opts = {
      defaults = {
        layout_config = {
          width = 0.99,
        },
      },
    },
    keys = {
      { "<leader>/", LazyVim.pick("live_grep", { root = false }), desc = "Grep" },
      { "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files" },
      { "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Find Files" },
      { "<leader>fF", false },
      { "<leader>sg", LazyVim.pick("live_grep", { root = false }), desc = "Grep" },
      { "<leader>sG", false },
      { "<leader>sw", LazyVim.pick("grep_string", { root = false, word_match = "-w" }), desc = "Word Match" },
      { "<leader>sW", LazyVim.pick("grep_string", { root = false }), desc = "Word" },
      { "gd", LazyVim.pick("lsp_definitions", { root = false }), desc = "[G]oto [D]efinition" },
    },
  },
}
