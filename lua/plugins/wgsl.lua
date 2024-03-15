return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "wgsl",
        "wgsl_bevy",
      })
    end,
  },
}
