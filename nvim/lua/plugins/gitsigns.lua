return {
  {
    "lewis6991/gitsigns.nvim",
    event = "VimEnter",
    opts = {
      current_line_blame = true,
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> ∙ [<abbrev_sha>] <summary>",
      on_attach = function(buffer)
        vim.keymap.set("n", "[h", function()
          if vim.wo.diff then
            return "[c"
          else
            return "<Cmd>Gitsigns prev_hunk<CR>"
          end
        end, { buffer = buffer, expr = true })

        vim.keymap.set("n", "]h", function()
          if vim.wo.diff then
            return "]c"
          else
            return "<Cmd>Gitsigns next_hunk<CR>"
          end
        end, { buffer = buffer, expr = true })

        vim.keymap.set("n", "<leader>hd", "<Cmd>Gitsigns diffthis<CR>", { buffer = buffer })
        vim.keymap.set("n", "<leader>hp", "<Cmd>Gitsigns preview_hunk<CR>", { buffer = buffer })
        vim.keymap.set("n", "<leader>hs", "<Cmd>Gitsigns stage_hunk<CR>", { buffer = buffer })
        vim.keymap.set("n", "<leader>hu", "<Cmd>Gitsigns undo_stage_hunk<CR>", { buffer = buffer })
      end,
    },
  },
}
