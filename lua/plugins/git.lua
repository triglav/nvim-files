return {
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Gblame",
      "Gbrowse",
      "Gdiff",
      "Gedit",
      "Git",
      "Gllog",
      "Gread",
      "Gsplit",
      "Gtabedit",
      "Gvsplit",
      "Gwrite",
    },
    keys = {
      { "<Leader>gd", "<Cmd>Gdiff<CR>", desc = "Git Diff" },
      { "<Leader>gb", "<Cmd>G blame<CR>", desc = "Git Blame" },
      { "<Leader>gs", "<Cmd>G<CR>", desc = "Git Status" },
      { "<Leader>gl", "<Cmd>Gllog<CR>", desc = "Git Log" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Next Hunk" })

        map("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Prev Hunk" })

        -- Actions
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
        map("n", "<leader>ghS", gs.stage_buffer, { desc = "Stage Buffer" })
        map("n", "<leader>ghu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
        map("n", "<leader>ghR", gs.reset_buffer, { desc = "Reset Buffer" })
        map("n", "<leader>ghp", gs.preview_hunk, { desc = "Preview Hunk" })
        map("n", "<leader>ghb", function()
          gs.blame_line({ full = true })
        end, { desc = "Blame Line" })
        map("n", "<leader>ghd", gs.diffthis, { desc = "Diff This" })
        map("n", "<leader>ghD", function()
          gs.diffthis("~")
        end, { desc = "Diff This ~" })
        map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle Current Line Blame" })
        map("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle Deleted" })

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select Hunk Object" })
      end,
    },
  },
}
