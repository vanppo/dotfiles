-- Options
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "matchit",
  "netrw",
  "netrwFileHandlers",
  "netrwPlugin",
  "netrwSettings",
  "rrhelper",
  "spellfile_plugin",
  "tar",
  "tarPlugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = true
end

local options = {
  autowrite = true,
  clipboard = "unnamedplus",
  completeopt = { "menuone", "preview" },
  cursorline = true,
  expandtab = true,
  fillchars = "eob: ,msgsep:─",
  foldenable = false,
  foldlevel = 1,
  foldmethod = "indent",
  laststatus = 3,
  ignorecase = true,
  mouse = "",
  number = true,
  numberwidth = 2,
  ruler = false,
  scrolljump = 7,
  scrolloff = 3,
  shiftround = true,
  shiftwidth = 2,
  showmode = false,
  signcolumn = "yes:2",
  smartcase = true,
  smartindent = true,
  softtabstop = 2,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 2,
  termguicolors = true,
  timeoutlen = 512,
  title = true,
  undofile = true,
  updatetime = 256,
  wrap = false,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Keymaps
vim.keymap.set("n", "+", "<C-A>")
vim.keymap.set("n", "-", "<C-X>")
vim.keymap.set("n", "<C-G>", "<Cmd>let @*=expand('%:.')<CR><C-G>")
vim.keymap.set("n", "<C-Q>", "<Cmd>bdelete!<CR>")
vim.keymap.set("n", "<leader>cc", "<Cmd>cclose<CR>")
vim.keymap.set("n", "<leader>cf", "<Cmd>cfirst<CR>")
vim.keymap.set("n", "[c", "<Cmd>cprevious<CR>")
vim.keymap.set("n", "]c", "<Cmd>cnext<CR>")
vim.keymap.set("n", "[l", "<Cmd>lprevious<CR><C-G>")
vim.keymap.set("n", "]l", "<Cmd>lnext<CR><C-G>")
vim.keymap.set({ "n", "o", "v" }, "H", "col('.') == 1 ? '^' : '0'", { expr = true })
vim.keymap.set("n", "L", "col('.') == col('$') - 1 ? 'g_' : '$'", { expr = true })
vim.keymap.set({ "o", "v" }, "L", "$")

-- Plugins
local directory = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.fn.isdirectory(directory) then
  vim.fn.system({
    "git",
    "clone",
    "--branch=stable",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim",
    directory,
  })
end

vim.opt.rtp:prepend(directory)

require("lazy").setup("plugins", {
  change_detection = {
    notify = false,
  },
  ui = {
    border = "single",
  },
})
