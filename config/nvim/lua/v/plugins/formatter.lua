return {
  "mhartington/formatter.nvim",
  config = function()
    require("formatter").setup({
      logging = false,
      log_level = vim.log.levels.DEBUG,
      filetype = {
        lua = {
          require("formatter.filetypes.lua").stylua,
        },
        javacript = {
          require("formatter.filetypes.javascript").prettier,
          require("formatter.filetypes.javascript").eslint,
        },
        typescript = {
          require("formatter.filetypes.javascript").prettier,
          require("formatter.filetypes.typescript").eslint,
        },
        go = {
          require("formatter.filetypes.go").gofmt,
        },
        elixir = {
          require("formatter.filetypes.elixir").mixformat,
        },
      },
    })
  end,
}
