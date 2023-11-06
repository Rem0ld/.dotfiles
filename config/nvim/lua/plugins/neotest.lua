return {
  "nvim-neotest/neotest",
  config = function()
    require("neotest").setup({
      log_level = "Debug",
      adapters = {
        require("neotest-vitest"),
        require("neotest-elixir"),
      },
    })
  end,
}
