return {
  "tummetott/reticle.nvim",
  event = "VeryLazy",
  config = function()
    require("reticle").setup({
      on_startup = {
        cursorline = true,
      },
    })
  end,
}
