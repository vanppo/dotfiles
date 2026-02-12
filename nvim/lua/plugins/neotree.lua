return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
      },
    },
    window = {
      mappings = {
        ["s"] = "open_split",
        ["v"] = "open_vsplit",
        ["<"] = {
          function()
            local width = vim.api.nvim_win_get_width(0)
            vim.api.nvim_win_set_width(0, width - 10)
          end,
          desc = "decrease width",
        },
        [">"] = {
          function()
            local width = vim.api.nvim_win_get_width(0)
            vim.api.nvim_win_set_width(0, width + 10)
          end,
          desc = "increase width",
        },
      },
    },
  },
}
