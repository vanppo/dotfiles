return {
  {
    "echasnovski/mini.nvim",
    event = "VimEnter",
    config = function()
      require("mini.basics").setup({
        options = {
          basic = false,
        },
        mappings = {
          basic = false,
          option_toggle_prefix = "",
        },
        autocommands = {
          basic = false,
          relnum_in_visual_mode = true,
        },
      })
      require("mini.comment").setup()
      require("mini.pairs").setup()
      require("mini.surround").setup({
        mappings = {
          add = "ys",
          delete = "ds",
          find = "",
          find_left = "",
          highlight = "",
          replace = "cs",
          update_n_lines = "",
        },
      })
    end,
  },
}
