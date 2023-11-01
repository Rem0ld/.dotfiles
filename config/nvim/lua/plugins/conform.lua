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
}
