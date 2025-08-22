-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "+", "<C-A>")
vim.keymap.set("n", "-", "<C-X>")
vim.keymap.set("n", "<C-G>", "<Cmd>let @*=expand('%:.')<CR><C-G>")
vim.keymap.set("n", "<C-Q>", function()
  local buffer = vim.api.nvim_get_current_buf()
  local window = vim.api.nvim_get_current_win()

  for _, value in ipairs(vim.api.nvim_list_wins()) do
    if value ~= window and vim.api.nvim_win_get_buf(value) == buffer then
      return vim.api.nvim_win_close(0, true)
    end
  end

  vim.api.nvim_buf_delete(0, { force = true })
end)
-- vim.keymap.set("n", "<leader>cc", "<Cmd>cclose<CR>")
-- vim.keymap.set("n", "<leader>cf", "<Cmd>cfirst<CR>")
-- vim.keymap.set("n", "[c", "<Cmd>cprevious<CR>")
-- vim.keymap.set("n", "]c", "<Cmd>cnext<CR>")
-- vim.keymap.set("n", "[l", "<Cmd>lprevious<CR><C-G>")
-- vim.keymap.set("n", "]l", "<Cmd>lnext<CR><C-G>")
vim.keymap.set({ "n", "o", "v" }, "H", "col('.') == 1 ? '^' : '0'", { expr = true })
vim.keymap.set("n", "L", "col('.') == col('$') - 1 ? 'g_' : '$'", { expr = true })
vim.keymap.set({ "o", "v" }, "L", "$")
