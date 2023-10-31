return {
  "mhartington/formatter.nvim",
  config = function()
    require("formatter").setup({
      logging = false,
      log_level = vim.log.levels.DEBUG,
      filetype = {
        elixir = {
          require("formatter.filetypes.elixir").mixformat,
        },
        go = {
          require("formatter.filetypes.go").gofmt,
        },
        heex = {
          require("formatter.filetypes.elixir").mixformat,
          require("formatter.filetypes.html").prettier,
        },
        html = {
          require("formatter.filetypes.html").prettier,
        },
        javacript = {
          require("formatter.filetypes.javascript").prettier,
          require("formatter.filetypes.javascript").eslint,
        },
        lua = {
          require("formatter.filetypes.lua").stylua,
        },
        typescript = {
          require("formatter.filetypes.javascript").prettier,
          require("formatter.filetypes.typescript").eslint,
        },
      },
    })
  end,
}
