return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "sumneko_lua",
        "rust_analyzer",
        "tsserver",
        "eslint",
        "bashls",
        "dockerls",
        "jsonls",
        "volar",
        "yamlls",
      },
    })
  end,
}
