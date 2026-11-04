return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          actions = {
            explorer_first_sibling = function(picker, item)
              if not item then
                return
              end
              local Tree = require("snacks.explorer.tree")
              local parent_dir = vim.fs.dirname(item.file)
              local parent_node = Tree:node(parent_dir)
              if not parent_node then
                return
              end

              local children = vim.tbl_values(parent_node.children)
              table.sort(children, function(a, b)
                if a.dir ~= b.dir then
                  return a.dir
                end
                return a.name < b.name
              end)

              local filter = Tree:filter(picker.opts)
              for i = 1, #children do -- Forward iteration (only difference)
                if filter(children[i]) then
                  require("snacks.explorer.actions").update(picker, { target = children[i].path })
                  return
                end
              end
            end,
            explorer_last_sibling = function(picker, item)
              -- Your logic here
              if not item then
                return
              end
              local Tree = require("snacks.explorer.tree")
              local parent_dir = vim.fs.dirname(item.file)
              local parent_node = Tree:node(parent_dir)
              if not parent_node then
                return
              end

              local children = vim.tbl_values(parent_node.children)
              table.sort(children, function(a, b)
                if a.dir ~= b.dir then
                  return a.dir
                end
                return a.name < b.name
              end)

              local filter = Tree:filter(picker.opts)
              for i = #children, 1, -1 do
                if filter(children[i]) then
                  picker:find({
                    on_done = function()
                      -- Use the internal update mechanism
                      require("snacks.explorer.actions").update(picker, { target = children[i].path })
                    end,
                  })
                  return
                end
              end
            end,
          },
          win = {
            list = {
              keys = {
                ["<C-T>"] = { "edit_tab", mode = { "n", "i" } },
                ["J"] = { "explorer_last_sibling", mode = { "n", "i" } },
                ["K"] = { "explorer_first_sibling", mode = { "n", "i" } },
              },
            },
          },
        },
      },
      win = {
        input = {
          keys = {
            ["<C-L>"] = { "loclist", mode = { "n", "i" } },
          },
        },
      },
    },
    terminal = {
      win = { style = "float" },
    },
  },
}
