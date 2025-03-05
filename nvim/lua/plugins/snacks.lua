return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      win = {
        input = {
          keys = {
            ["<c-t>"] = { "tab", mode = { "n", "i" } },
          },
        },
      },
    },
    terminal = {
      win = { style = "float" },
    },
  },
}
