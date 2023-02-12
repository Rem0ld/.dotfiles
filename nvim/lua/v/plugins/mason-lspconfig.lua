return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
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
