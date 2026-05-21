return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      win = {
        input = {
          keys = {
            ["<c-l>"] = { "loclist", mode = { "i", "n" } },
          },
        },
      },
    },
    terminal = {
      win = { style = "float" },
    },
  },
}
