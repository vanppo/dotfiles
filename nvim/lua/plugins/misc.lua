return {
  {
    "andymass/vim-matchup",
    opts = {
      delim = { stopline = 1024 },
    },
  },
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
      default_mappings = true,
      timeout = 128,
      mappings = {
        i = {
          j = {
            k = "<Esc>",
          },
        },
        c = {
          j = {
            k = "<Esc>",
          },
        },
        t = {
          j = {
            k = "<Esc>",
          },
        },
        v = {
          j = {
            k = "<Esc>",
          },
        },
        s = {
          j = {
            k = "<Esc>",
          },
        },
      },
    },
  },
  "wsdjeg/vim-fetch",
}
