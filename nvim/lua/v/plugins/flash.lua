return {
  "folke/flash.nvim",
  event = "verylazy",
  --@type flash.config
  opts = {},
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          search = {
            mode = function(str)
              return "\\<" .. str
            end,
          },
        })
      end,
      desc = "flash",
    },
    {
      "s",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter()
      end,
      desc = "flash treesitter",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "remote flash",
    },
    {
      "r",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "flash treesitter search",
    },
    {
      "<c-s>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "toggle flash search",
    },
  },
}
