return {
  "neovim/nvim-lspconfig", -- LSP config
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "simrat39/rust-tools.nvim", -- Rust Custom LSP
    "hrsh7th/cmp-nvim-lsp", -- LSP completion
  },
  config = function()
    -- Base
    local mason = require("mason")
    local mason_lsp = require("mason-lspconfig")
    local lsp = require("lspconfig")

    -- Language specific
    local rust_tools = require("rust-tools")

    -- Tools
    local cmp_lsp = require("cmp_nvim_lsp")

    local signs =
      { Error = " ", Warn = " ", Hint = " ", Information = " " }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.lsp.handlers["textDocument/hover"] =
      vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

    local servers = {
      "cssls",
      "dockerls",
      "gopls",
      "html",
      "jsonls",
      "lua_ls",
      "svelte",
      -- "tailwindcss",
      "taplo",
      "tsserver",
    }

    local server_settings = {
      ["lua_ls"] = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
        },
      },
      -- yamlls lsp configuration for neovim
      ["yamlls"] = {
        yaml = {
          keyOrdering = false,
        },
      },
    }

    local server_with_disabled_formatting = {
      ["tsserver"] = true,
      ["lua_ls"] = true,
      ["tailwindcss"] = true,
      ["cssls"] = true,
    }

    mason.setup()
    mason_lsp.setup({ ensure_installed = servers })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp_lsp.default_capabilities(capabilities)

    -- The biding for every servers
    local on_attach = function(client, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }

      -- vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
      vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
      vim.keymap.set("n", "gl", vim.diagnostic.open_float, bufopts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
      vim.keymap.set("n", "<leader>ld", ":Telescope diagnostics<CR>", bufopts)
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, bufopts)
      vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action, bufopts)

      if server_with_disabled_formatting[client.name] then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end
    end

    for _, server in pairs(servers) do
      if server == "rust_analyzer" then
        rust_tools.setup({ tools = { on_initialized = on_attach } })
      else
        lsp[server].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = server_settings[server],
        })
      end
    end
  end,
}
