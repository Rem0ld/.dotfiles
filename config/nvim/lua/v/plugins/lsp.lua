return {
  "neovim/nvim-lspconfig", -- LSP config
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp", -- LSP completion
  },
  config = function()
    -- Base
    local mason = require("mason")
    local mason_lsp = require("mason-lspconfig")
    local lsp = require("lspconfig")
    local null_ls_utils = require("null-ls.utils")

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
      "elixirls",
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

      bufopts.desc = "Go to definition"
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)

      bufopts.desc = "Go to type definition"
      vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)

      bufopts.desc = "Go to implementation"
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)

      bufopts.desc = "Show diagnostics"
      vim.keymap.set("n", "gl", vim.diagnostic.open_float, bufopts)

      bufopts.desc = "Go to next diagnostics"
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)

      bufopts.desc = "Go to prev diagnostics"
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)

      bufopts.desc = "Telescope diagnostics"
      vim.keymap.set("n", "<leader>ld", ":Telescope diagnostics<CR>", bufopts)

      bufopts.desc = "Rename"
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, bufopts)

      bufopts.desc = "Code action"
      vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, bufopts)

      if server_with_disabled_formatting[client.name] then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end
    end

    for _, server in pairs(servers) do
      lsp[server].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = server_settings[server],
      })
    end
    lsp.elixirls.setup({
      filetypes = { "elixir", "eelixir", "heex", "surface" },
      capabilities = capabilities,
      cmd = {
        "/Users/pielov/.local/share/nvim/mason/packages/elixir-ls/language_server.sh",
      },
      on_attach = on_attach,
      root_dir = null_ls_utils.root_pattern("mix.exs", ".git")
        or vim.loop.os_homedir(),
      settings = {
        elixirLS = {
          fetchDeps = true,
        },
      },
    })
    lsp.graphql.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = {
        "graphql",
        "gql",
        "svelte",
        "typescriptreact",
        "javascriptreact",
      },
    })
    lsp.html.setup({
      filetypes = {
        "html",
        "heex",
      },
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
}
