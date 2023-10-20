return {
  "echasnovski/mini.bufremove",
  version = false,
  main = "mini.bufremove",
  config = function()
    require("mini.bufremove").setup({
      slient = true,
    })
  end,
}
