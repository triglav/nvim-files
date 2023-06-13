return {
  {
    "tpope/vim-projectionist",
    cmd = { "A", "AS", "AV" },
    keys = {
      { "<leader>oo", "<cmd>A<cr>", desc = "Open alternative file" },
      { "<leader>os", "<cmd>AS<cr>", desc = "Open alternative file in horizontal split" },
      { "<leader>ov", "<cmd>AV<cr>", desc = "Open alternative file in vertical split" },
    },
  },
}
