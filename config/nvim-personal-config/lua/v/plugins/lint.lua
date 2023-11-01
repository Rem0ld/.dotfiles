return {
  "mfussenegger/nvim-lint",
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint" },
      javascriptreact = { "eslint" },

      typescript = { "eslint" },
      typescriptreact = { "eslint" },

      svelte = { "eslint" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd(
      { "BufEnter", "BufWritePost", "BufRead", "InsertLeave" },
      {
        callback = function()
          require("lint").try_lint()
        end,
        group = lint_augroup,
      }
    )

    vim.keymap.set("n", "<leader>ll", function()
      lint.try_lint()
    end, { desc = "Try linting current file" })
  end,
  event = { "BufReadPre", "BufNewFile" },
  lazy = true,
}
