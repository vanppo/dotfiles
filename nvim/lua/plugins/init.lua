return {
  {
    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "folke/lazy.nvim",
    init = function()
      require("colors"):setup()
    end,
  },
}
