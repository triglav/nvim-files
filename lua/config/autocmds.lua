-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.frag", "*.vert" },
  callback = function()
    vim.opt.filetype = "glsl"
    vim.opt.commentstring = "// %s"
  end,
})

-- make fugitive windows size stable
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("fugitive_au"),
  pattern = { "fugitive" },
  callback = function()
    vim.opt_local.winfixheight = true
  end,
})

-- make sure whole word search works also with $ (a dollar)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.component.html" },
  callback = function()
    vim.opt_local.iskeyword:append("$")
  end,
})
