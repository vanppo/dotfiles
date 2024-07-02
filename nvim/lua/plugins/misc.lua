return {
  { "Pocco81/auto-save.nvim", event = "VimEnter", config = true },
  "andymass/vim-matchup",
  { "arthurxavierx/vim-caser", event = "VimEnter" },
  {
    "ellisonleao/carbon-now.nvim",
    cmd = "CarbonNow",
    keys = {
      { "<leader>ss", "<Cmd>CarbonNow<CR>", mode = { "n", "v" } },
    },
    opts = { open_cmd = "open" },
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    opts = {
      clear_empty_lines = true,
      mapping = { "jk" },
      timeout = 128,
      keys = function()
        return vim.api.nvim_win_get_cursor(0)[2] > 1 and "<Esc>l" or "<Esc>"
      end,
    },
  },
}
