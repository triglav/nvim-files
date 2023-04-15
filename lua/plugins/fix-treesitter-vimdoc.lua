return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- "help" was renamed to "vimdoc"
      opts.ensure_installed = vim.tbl_map(function(s)
        if s == "help" then
          return "vimdoc"
        end
        return s
      end, opts.ensure_installed)
    end,
  },
}
