-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function copy_formatted_path(mode)
  local path = vim.fn.expand("%:.")
  if path == "" then
    return
  end

  local start_line, end_line

  if mode == "v" then
    local start_pos = vim.fn.getpos("v")
    local end_pos = vim.fn.getpos(".")

    start_line = start_pos[2]
    end_line = end_pos[2]

    if start_line > end_line then
      start_line, end_line = end_line, start_line
    end
  else
    start_line = vim.fn.line(".")
    end_line = start_line
  end

  local line_suffix = tostring(start_line)
  if start_line ~= end_line then
    line_suffix = start_line .. "-" .. end_line
  end

  local formatted_str = "@" .. path .. "#" .. line_suffix

  vim.fn.setreg("*", formatted_str)

  vim.api.nvim_feedkeys(vim.keycode("<C-G>"), "nt", false)
end

vim.keymap.set("n", "<C-G>", function()
  copy_formatted_path("n")
end, { desc = "Copy path with line number" })

vim.keymap.set("v", "<C-G>", function()
  copy_formatted_path("v")
end, { desc = "Copy path with line range" })

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
vim.keymap.set({ "n", "o", "v" }, "H", "col('.') == 1 ? '^' : '0'", { expr = true })
vim.keymap.set("n", "L", "col('.') == col('$') - 1 ? 'g_' : '$'", { expr = true })
vim.keymap.set({ "o", "v" }, "L", "$")
