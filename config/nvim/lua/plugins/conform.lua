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
      js = { "prettier", "eslint_d" },
      ts = { "prettier", "eslint_d" },
      tsx = { "prettier", "eslint_d" },
      jsx = { "prettier", "eslint_d" },
      typescriptreact = { "prettier", "eslint_d" },
      javascriptreact = { "prettier", "eslint_d" },
      javascript = { "prettier", "eslint_d" },
      typescript = { "prettier", "eslint_d" },
      vue = { "prettier", "eslint_d" },
    },
  },
}
