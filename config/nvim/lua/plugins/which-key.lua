return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      triggers_blacklist = {
        i = { "<" },
      },
      ["<leader>"] = {
        ["e"] = nil,
        ["E"] = nil,
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
      ["y"] = nil,
    },
  },
}
