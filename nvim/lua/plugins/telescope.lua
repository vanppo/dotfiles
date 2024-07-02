return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>cp", "<Cmd>Telescope commands<CR>" },
      { "<leader>fb", "<Cmd>Telescope buffers<CR>" },
      { "<leader>ff", "<Cmd>Telescope find_files<CR>" },
      { "<leader>fr", "<Cmd>Telescope live_grep<CR>" },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          width = 0.8,
          height = 0.8,
          preview_cutoff = 120,
        },
        mappings = {
          i = {
            ["<C-S>"] = "select_horizontal",
            ["<ESC>"] = "close",
          },
          n = {
            ["s"] = "select_horizontal",
            ["t"] = "select_tab",
            ["v"] = "select_vertical",
            ["<ESC>"] = "close",
          },
        },
        path_display = { "smart" },
        prompt_prefix = "   ",
        sorting_strategy = "ascending",
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          -- "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim",
        },
      },
      pickers = {
        find_files = {
          find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
        },
      },
    },
  },
}
