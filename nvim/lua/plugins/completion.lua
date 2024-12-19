local icons = {
  Array = "",
  Boolean = "",
  Class = "",
  Color = "",
  Constant = "",
  Constructor = "",
  Enum = "",
  EnumMember = "",
  Event = "",
  Field = "",
  File = "",
  Folder = "󰉋",
  Function = "󰊕",
  Interface = "",
  Key = "",
  Keyword = "",
  Method = "",
  Module = "",
  Namespace = "",
  Null = "󰟢",
  Number = "",
  Object = "",
  Operator = "",
  Package = "",
  Property = "",
  Reference = "",
  Snippet = "",
  String = "",
  Struct = "",
  Text = "",
  TypeParameter = "",
  Unit = "",
  Value = "",
  Variable = "󰀫",
}

return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      {
        "dcampos/cmp-snippy",
        dependencies = {
          {
            "dcampos/nvim-snippy",
            dependencies = { "honza/vim-snippets" },
          },
        },
      },
    },
    opts = function()
      local cmp = require("cmp")

      return {
        snippet = {
          expand = function(args)
            require("snippy").expand_snippet(args.body)
          end,
        },
        formatting = {
          format = function(entry, item)
            item.kind = string.format("%s", icons[item.kind])

            item.menu = ({
              buffer = "[BUF]",
              nvim_lsp = "[LSP]",
              nvim_lua = "[LUA]",
              path = "[PAT]",
              snippy = "[SNP]",
            })[entry.source.name]

            return item
          end,
        },
        mapping = {
          ["<C-P>"] = cmp.mapping.select_prev_item(),
          ["<C-N>"] = cmp.mapping.select_next_item(),
          ["<C-C>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ["<C-J>"] = function(fallback)
            if require("snippy").can_expand_or_advance() then
              print("top")
              require("snippy").expand_or_advance()
            else
              fallback()
            end
          end,
          ["<C-K>"] = function(fallback)
            if require("snippy").can_jump(-1) then
              require("snippy").previous()
            else
              fallback()
            end
          end,
        },
        sources = cmp.config.sources(
          { { name = "nvim_lsp" }, { name = "nvim_lua" } },
          { { name = "buffer" }, { name = "path" }, { name = "snippy" } }
        ),
      }
    end,
  },
}
