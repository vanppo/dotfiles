local filetypes = { "NvimTree" }

return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    opts = {
      sections = {
        lualine_a = {
          { "mode", icon = "󰀘" },
        },
        lualine_c = {
          {
            "filename",
            file_status = false,
            path = 1,
            cond = function()
              for _, filetype in ipairs(filetypes) do
                if vim.bo[0].filetype == filetype then
                  return false
                end
              end

              return true
            end,
          },
        },
      },
    },
  },
}
