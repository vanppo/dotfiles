return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "scheme", "racket" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        racket_langserver = {
          filetypes = { "racket", "scheme" },
        },
      },
    },
  },
  {
    "Olical/conjure",
    ft = { "scheme", "racket" },
    lazy = true,
    init = function()
      vim.g["conjure#filetype#scheme"] = "conjure.client.racket.stdio"
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    ft = { "scheme", "racket" },
  },
}
