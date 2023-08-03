return {
  "mhartington/formatter.nvim",
  config = function()
    require("formatter").setup({
      logging = true,
      log_level = vim.log.levels.DEBUG,
      filetype = {
        lua = {
          require("formatter.filetypes.lua").stylua,
        },
        javacript = {
          require("formatter.filetypes.javascript").eslint_d,
        },
        typescript = {
          require("formatter.filetypes.typescript").eslint_d,
        },
      },
    })
  end,
}
