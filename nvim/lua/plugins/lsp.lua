local signs = {
  DiagnosticSignError = "",
  DiagnosticSignInfo = "",
  DiagnosticSignHint = "",
  DiagnosticSignWarn = "",
}

local capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), {
  textDocument = {
    completion = {
      completionItem = {
        commitCharactersSupport = true,
        deprecatedSupport = true,
        insertReplaceSupport = true,
        labelDetailsSupport = true,
        preselectSupport = true,
        snippetSupport = true,
        tagSupport = { valueSet = { 1 } },
        resolveSupport = {
          properties = { "documentation", "detail", "additionalTextEdits" },
        },
      },
    },
  },
})

local function on_attach(client, buffer)
  vim.keymap.set("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { buffer = buffer })
  vim.keymap.set("n", "<leader>fm", "<Cmd>lua vim.lsp.buf.format({ async = true })<CR>", { buffer = buffer })
  vim.keymap.set("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", { buffer = buffer })
  vim.keymap.set("n", "gk", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", { buffer = buffer })
  vim.keymap.set("n", "gl", "<Cmd>lua vim.diagnostic.open_float()<CR>", { buffer = buffer })
  vim.keymap.set("n", "g[", "<Cmd>lua vim.diagnostic.goto_prev()<CR>", { buffer = buffer })
  vim.keymap.set("n", "g]", "<Cmd>lua vim.diagnostic.goto_next()<CR>", { buffer = buffer })

  if client.supports_method("textDocument/documentHighlight") then
    vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_create_autocmd("CursorHold", {
      buffer = buffer,
      group = "lsp_document_highlight",
      callback = function()
        vim.lsp.buf.document_highlight()
      end,
    })
    vim.api.nvim_create_autocmd("CursorHold", {
      buffer = buffer,
      group = "lsp_document_highlight",
      callback = function()
        vim.lsp.buf.clear_references()
      end,
    })
  end

  if client.supports_method("textDocument/formatting") then
    -- vim.keymap.set("n", "<leader>cf", "<Cmd>lua vim.lsp.buf.format({ async = true })<CR>", { buffer = buffer })
    vim.api.nvim_create_user_command("LspCodeFormat", function()
      vim.lsp.buf.format({ async = true })
    end, {})
  end
end

return {
  {
    "williamboman/mason-lspconfig.nvim",
    event = "BufReadPre",
    dependencies = {
      "neovim/nvim-lspconfig",
      {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonUpdate" },
        opts = {
          ui = {
            border = "single",
            icons = {
              package_installed = " ",
              package_pending = " ",
              package_uninstalled = " ",
            },
          },
        },
      },
    },
    init = function()
      for group, icon in pairs(signs) do
        vim.fn.sign_define(group, { text = icon, numhl = group, texthl = group })
      end

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
      vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })
      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
      })
    end,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
      })

      require("mason-lspconfig").setup_handlers({
        function(name)
          local ok, opts = pcall(require, "plugins/lsp/" .. name)
          local options = { capabilities = capabilities, on_attach = on_attach }

          if ok then
            options = vim.tbl_deep_extend("force", options, opts)
          end

          require("lspconfig")[name].setup(options)
        end,
      })
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VimEnter",
    opts = {
      bind = true,
      doc_lines = 0,
      floating_window = true,
      fix_pos = true,
      hint_enable = true,
      hint_prefix = "󰋼 ",
      hint_scheme = "String",
      hi_parameter = "Search",
      max_width = 120,
      handler_opts = {
        border = "single",
      },
    },
  },
}
