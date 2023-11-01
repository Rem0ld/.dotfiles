return -- LSP keymaps
{
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    keys[#keys + 1] = { "<C-k>", false, mode = "i" }
    keys[#keys + 1] = { "<leader>cl", false }
    keys[#keys + 1] = { "<leader>ca", false }
    keys[#keys + 1] = { "<leader>lc", vim.lsp.buf.code_action, desc = "Code Action" }

    keys[#keys + 1] = { "<leader>cA", false }

    keys[#keys + 1] = { "<leader>cr", false }
    keys[#keys + 1] = { "<leader>lr", vim.lsp.buf.rename, desc = "Rename" }

    keys[#keys + 1] = { "<leader>cd", false }
    keys[#keys + 1] = { "gl", vim.diagnostic.open_float, desc = "Show diagnostics" }

    keys[#keys + 1] = { "<leader>ld", ":Telescope diagnostics<cr>", desc = "Telescope diagnostics" }
  end,
}
