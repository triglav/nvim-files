-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- This file is automatically loaded by plugins.config

local opt = vim.opt

-- Maximum width of text that is being inserted.
opt.textwidth = 100
-- Do not show the line number relative to the line with the cursor in front of each line.
opt.relativenumber = false
-- This defines what bases Vim will consider for numbers when using the CTRL-A
-- and CTRL-X commands for adding to and subtracting from a number
-- respectively.
opt.nrformats = "alpha,octal,hex"

-- If on Vim will wrap long lines at a character in 'breakat'.
opt.linebreak = true
-- String to put at the start of lines that have been wrapped.
opt.showbreak = ">> "
-- Enable break indent
opt.breakindent = true

-- The minimal number of columns to scroll horizontally.
opt.sidescroll = 3
-- The minimal number of screen columns to keep to the left and to the right of
-- the cursor if 'nowrap' is set.
opt.sidescrolloff = 10

-- The minimal height of a window, when it's not the current window.
opt.winminheight = 0
-- The minimal width of a window, when it's not the current window.
opt.winminwidth = 0

-- When using the mouse or when using shifted special keys start Select mode
-- instead of Visual mode.
opt.selectmode = "mouse,key"

-- All matches in a line are substituted instead of one.
opt.gdefault = true

-- Use visual bell instead of beeping.
opt.visualbell = true
