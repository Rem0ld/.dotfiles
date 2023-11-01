return {
  "folke/which-key.nvim",
  opts = {
    defaults = {
      ["<leader>"] = {
        ["e"] = nil,
        ["E"] = nil,
        ["f"] = {
          name = "Telescope",
          ["f"] = { "<CMD>Telescope find_files<CR>", "Find File" },
          ["F"] = {
            "<CMD>Telescope find_files hidden=true no_ignore=true<CR>",
            "Find all File",
          },
          ["w"] = { "<CMD>Telescope live_grep<CR>", "Find File by grep" },
          ["W"] = {
            "<CMD>Telescope live_grep hidden=true no_ignore=true<CR>",
            "Find File by grep",
          },
          ["b"] = { "<CMD>Telescope buffers<CR>", "Find buffers" },
          ["d"] = { "<CMD>Telescope diagnostics<CR>", "Diagnostics" },
        },
        ["g"] = {
          name = "Git",
          ["g"] = {
            name = "gitui",
          },
        },
        ["j"] = {
          name = "JQ",
        },
        ["l"] = {
          name = "Lsp",
          ["r"] = "rename",
          ["c"] = "code actions",
        },
        p = {
          name = "Packages & Lazy & Mason",
          m = {
            name = "Mason",
            i = "installer",
            u = "update",
            l = {
              name = "Lazy",
            },
          },
        },
        r = {
          name = "Reload",
        },
        s = {
          name = "Search",
        },
      },
      ["<leader>`"] = nil,
      ["<leader>c"] = nil,
      ["<leader>K"] = nil,
      -- ["<leader>d"] = "which_key_ignore",
      -- ["<leader>q"] = "which_key_ignore",
      -- ["<leader>w"] = "which_key_ignore",
      -- ["<leader>k"] = "which_key_ignore",
    },
  },
}
