return {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup({})
    local wk = require("which-key")
    wk.register({
      ["<leader>f"] = {
        name = "Telescope",
        ["f"] = { "<CMD>Telescope find_files<CR>", "Find File" },
        ["F"] = { "<CMD>Telescope find_files hidden=true no_ignore=true<CR>", "Find all File" },
        ["w"] = { "<CMD>Telescope live_grep<CR>", " Find File by grep" },
        ["W"] = { "<CMD>Telescope live_grep hidden=true no_ignore=true<CR>", " Find File by grep" },
        ["b"] = { "<CMD>Telescope buffers<CR>", " Find buffers" },
        ["d"] = { "<CMD>Telescope diagnostics<CR>", " Diagnostics" },
      },
      ["<leader>g"] = {
        name = "Git",
      },
      ["<leader>l"] = {
        name = "Lsp",
      },
      ["<leader>p"] = {
        name = "Packages & Lazy & Mason",
      },
      ["<leader>s"] = {
        name = "Search",
      },
      ["<leader>t"] = {
        name = "Terminal",
      },
      ["<leader>d"] = "which_key_ignore",
      ["<leader>q"] = "which_key_ignore",
      ["<leader>w"] = "which_key_ignore",
      ["<leader>j"] = "which_key_ignore",
      ["<leader>k"] = "which_key_ignore",
    })
  end,
}
