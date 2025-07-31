return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<leader>/", LazyVim.pick("live_grep", { root = false }), desc = "Grep" },
      { "<leader><space>", LazyVim.pick("files", { root = false, line_query = true }), desc = "Find Files" },
      { "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Find Files" },
      { "<leader>fF", false },
      { "<leader>sg", LazyVim.pick("live_grep", { root = false }), desc = "Grep" },
      { "<leader>sG", false },
      { "<leader>sw", LazyVim.pick("grep_cword", { root = false }), desc = "Word Match" },
      { "<leader>sW", false },
      { "<leader>sw", LazyVim.pick("grep_visual", { root = false }), mode = "v", desc = "Selection" },
      { "<leader>sW", false, mode = "v" },
    },
    opts = {
      winopts = {
        preview = {
          horizontal = "right:40%",
        },
      },
    },
  },
}
