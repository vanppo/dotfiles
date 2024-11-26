return {
  {
    "kyazdani42/nvim-tree.lua",
    keys = {
      { "<C-BSLASH>", "<Cmd>NvimTreeFindFileToggle<CR>" },
    },
    dependencies = { "kyazdani42/nvim-web-devicons" },
    opts = {
      actions = {
        open_file = {
          quit_on_open = true,
          window_picker = {
            enable = false,
          },
        },
      },
      disable_netrw = true,
      hijack_cursor = true,
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        local opts = { buffer = bufnr, noremap = true, nowait = true, silent = true }

        vim.keymap.set("n", "<C-R>", api.tree.reload, opts)
        vim.keymap.set("n", "<BS>", api.tree.collapse_all, opts)
        vim.keymap.set("n", "<Tab>", api.node.open.preview, opts)
        vim.keymap.set("n", "=", ":vertical resize 40<CR>", opts)
        vim.keymap.set("n", "<", ":vertical resize -10<CR>", opts)
        vim.keymap.set("n", ">", ":vertical resize +10<CR>", opts)
        vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts)
        vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts)
        vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts)
        vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts)
        vim.keymap.set("n", "R", api.fs.rename_sub, opts)
        vim.keymap.set("n", "c", api.fs.copy.node, opts)
        vim.keymap.set("n", "d", api.fs.remove, opts)
        vim.keymap.set("n", "h", api.node.navigate.parent_close, opts)
        vim.keymap.set("n", "l", api.node.open.edit, opts)
        vim.keymap.set("n", "m", api.fs.cut, opts)
        vim.keymap.set("n", "n", api.fs.create, opts)
        vim.keymap.set("n", "p", api.fs.paste, opts)
        vim.keymap.set("n", "r", api.fs.rename, opts)
        vim.keymap.set("n", "s", api.node.open.horizontal, opts)
        vim.keymap.set("n", "t", api.node.open.tab, opts)
        vim.keymap.set("n", "v", api.node.open.vertical, opts)
        vim.keymap.set("n", "y", api.fs.copy.relative_path, opts)
      end,
      renderer = {
        icons = {
          glyphs = {
            git = {
              deleted = "",
              ignored = "◌",
              renamed = "",
              staged = "✓",
              unmerged = "",
              unstaged = "✗",
              untracked = "★",
            },
            folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
            },
          },
        },
        indent_markers = {
          enable = true,
        },
        root_folder_label = false,
      },
      view = {
        width = 40,
      },
    },
  },
}
