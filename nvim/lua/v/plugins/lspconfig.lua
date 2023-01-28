return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
    "mason.nvim",
    "jose-elias-alvarez/typescript.nvim",
    "folke/neodev.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "b0o/schemastore.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  opts = {
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = { spacing = 4, prefix = "●" },
      severity_sort = true,
    },
    autoformat = true,
    format = {
      formatting_options = nil,
      timeout_ms = nil,
    },
  },
  config = function()
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePost", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ timeout = 2000, bufnr = bufnr })
          end,
        })
      end

      local bufopts = { noremap = true, silent = true, buffer = bufnr }

      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { table.unpack(bufopts), desc = "Go to Declaration" })
      vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { table.unpack(bufopts), desc = "Go to definition" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { table.unpack(bufopts), desc = "Hover" })
      vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", { table.unpack(bufopts), desc = "Go to implementation" })
      vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, { table.unpack(bufopts), desc = "Go to signature help" })
      vim.keymap.set("n", "<leader>lD", vim.lsp.buf.type_definition, { table.unpack(bufopts), desc = "Go to type definition" })
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { table.unpack(bufopts), desc = "Rename" })
      vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action, { table.unpack(bufopts), desc = "Code action" })
      vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { table.unpack(bufopts), desc = "Go to references" })
      vim.keymap.set("n", "<leader>lf", function()
        vim.lsp.buf.format({ async = true })
      end, { table.unpack(bufopts), desc = "Format" })

      vim.keymap.set("n", "gl", vim.diagnostic.open_float, { table.unpack(bufopts), desc = "Line diagnostics" })
      vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { table.unpack(bufopts), desc = "Lsp Info" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { table.unpack(bufopts), desc = "Next Diagnostic" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { table.unpack(bufopts), desc = "Previous Diagnostic" })
    end

    local _cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    local capabilities = _cmp_nvim_lsp and cmp_nvim_lsp.default_capabilities()
      or vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local servers = {
      "bashls",
      "sumneko_lua",
      "cssls",
      "html",
      "emmet_ls",
      "jsonls",
      "yamlls",
      "dockerls",
      "sumneko_lua",
      "tsserver",
      "eslint",
      "rust_analyzer",
      "null_ls",
    }
    for _, server in ipairs(servers) do
      require("v.plugins.lsp." .. server).setup(on_attach, capabilities)
    end

    vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError", numhl = "" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn", numhl = "" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint", numhl = "" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo", numhl = "" })

    vim.diagnostic.config({
      virtual_text = {
        source = "always",
        prefix = "▎",
        spacing = 6,
      },
      float = {
        source = "always",
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
  end,
}
