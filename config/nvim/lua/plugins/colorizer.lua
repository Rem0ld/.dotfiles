return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      "css",
      "javascript",
      "lua",
      "typescript",
      "vue",
      html = {
        mode = "foreground",
      },
    })
  end,
}
