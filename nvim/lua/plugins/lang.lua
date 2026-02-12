return {
  {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          elixirls = { enabled = false },
        },
      },
    },
    {
      "mason-org/mason.nvim",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "lexical")
      end,
    },
    {
      "elixir-editors/vim-elixir",
      ft = "elixir",
    },
  },
}
