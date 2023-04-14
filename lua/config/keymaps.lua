-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map({ "n", "v", "i" }, "<F1>", "<Esc>", { remap = true })

-- Emulate the original behaviour/bindings of 'triglav/vim-visual-increment'
map("v", "<C-a>", "g<C-a>")
map("v", "<C-x>", "g<C-x>")
map("v", "g<C-a>", "<C-a>")
map("v", "g<C-x>", "<C-x>")

-- Set CTRL+C and CTRL+V
map("v", "<C-c>", '"+y')
map("i", "<C-v>", "<C-r>+")

-- Keys for switching between tabs in normal mode
map("n", "<leader><tab>1", "<cmd>tabn 1<cr>", { desc = "Tab 1" })
map("n", "<leader><tab>2", "<cmd>tabn 2<cr>", { desc = "Tab 2" })
map("n", "<leader><tab>3", "<cmd>tabn 3<cr>", { desc = "Tab 3" })
map("n", "<leader><tab>4", "<cmd>tabn 4<cr>", { desc = "Tab 4" })
map("n", "<leader><tab>5", "<cmd>tabn 5<cr>", { desc = "Tab 5" })
map("n", "<leader><tab>6", "<cmd>tabn 6<cr>", { desc = "Tab 6" })
map("n", "<leader><tab>7", "<cmd>tabn 7<cr>", { desc = "Tab 7" })
map("n", "<leader><tab>8", "<cmd>tabn 8<cr>", { desc = "Tab 8" })
map("n", "<leader><tab>9", "<cmd>tabn 9<cr>", { desc = "Tab 9" })
map("n", "<leader><tab>0", "<cmd>tabn 10<cr>", { desc = "Tab 10" })
map("n", "<leader><tab>h", "<cmd>tabp<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab>l", "<cmd>tabn<cr>", { desc = "Next Tab" })
-- exists (lazyvim bindings):
-- map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
-- map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
-- not used (lazyvim bindings):
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>[")

-- Easily resize split windows with Alt+hjkl
map("n", "<A-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<A-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<A-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<A-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Diff commands
map("n", "<leader>dt", "<cmd>diffthis<cr>")
map("n", "<leader>do", "<cmd>diffoff!<cr>")
map("n", "<leader>du", "<cmd>diffupdate<cr>")

map("n", "<leader>ul", function()
  Util.toggle("list")
end, { desc = "Toggle List" })
