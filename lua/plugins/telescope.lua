local Util = require("lazyvim.util")

return {
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    opts = {
      defaults = {
        layout_config = {
          width = 0.99,
        },
      },
    },
    keys = {
      { "<leader>/", Util.telescope("live_grep", { cwd = false }), desc = "Grep" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader><space>", Util.telescope("files", { cwd = false }), desc = "Find Files" },
      { "<leader>ff", Util.telescope("files", { cwd = false }), desc = "Find Files" },
      { "<leader>fF", false },
      { "<leader>sg", Util.telescope("live_grep", { cwd = false }), desc = "Grep" },
      { "<leader>sG", false },
      { "<leader>sw", Util.telescope("grep_string", { cwd = false }), desc = "Word" },
      { "<leader>sW", false },
    },
  },
}
