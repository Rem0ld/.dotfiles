return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "natecraddock/telescope-zf-native.nvim",
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
          },
        },
        mappings = {
          i = {
            ["<C-q>"] = "smart_send_to_qflist",
          },
        },
      },
      extensions = {
        ["zf-native"] = {
          -- options for sorting file-like items
          file = {
            -- override default telescope file sorter
            enable = true,
            -- highlight matching text in results
            highlight_results = true,
            -- enable zf filename match priority
            match_filename = true,
          },

          -- options for sorting all other items
          generic = {
            -- override default telescope generic item sorter
            enable = true,
            -- highlight matching text in results
            highlight_results = true,
            -- disable zf filename match priority
            match_filename = false,
          },
        },
      },
    })

    telescope.load_extension("zf-native")
  end,
}
