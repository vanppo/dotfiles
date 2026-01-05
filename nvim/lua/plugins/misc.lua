return {
  {
    "andymass/vim-matchup",
    opts = {
      delim = { stopline = 1024 },
    },
  },
  { "arthurxavierx/vim-caser", event = "VimEnter" },
  {
    "michaelrommel/nvim-silicon",
    cmd = "Silicon",
    opts = {
      pad_horiz = 32,
      pad_vert = 32,
      to_clipboard = true,
    },
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
