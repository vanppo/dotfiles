-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = nil
vim.g.maplocalleader = nil

local options = {
  mouse = "",
  relativenumber = false,
  timeoutlen = 512,
  updatetime = 256,
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
