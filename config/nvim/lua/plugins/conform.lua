local Util = require("lazyvim.util")
return {
  "stevearc/conform.nvim",
  keys = {
    { "<leader>cF", false },
    { "<leader>cf", false },
    {
      "<leader>lf",
      function()
        Util.format({ force = true })
      end,
      desc = "Format file",
    },
  },
  opts = {
    formatters_by_ft = {
      js = { "prettier", "eslint-lsp" },
      ts = { "prettier", "eslint-lsp" },
      tsx = { "prettier", "eslint-lsp" },
      jsx = { "prettier", "eslint-lsp" },
      typescriptreact = { "prettier", "eslint-lsp" },
      javascriptreact = { "prettier", "eslint-lsp" },
      javascript = { "prettier", "eslint-lsp" },
      typescript = { "prettier", "eslint-lsp" },
      vue = { "prettier", "eslint-lsp" },
    },
  },
}
