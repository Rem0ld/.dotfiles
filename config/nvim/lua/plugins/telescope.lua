return {
  "nvim-telescope/telescope.nvim",
  -- replace all Telescope keymaps with only one mapping
  keys = function()
    return {
      { "<leader>/", false },
      { "<leader>fe", false },
      { "<leader>fE", false },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fb", "<cmd>lua require('telescope.builtin').find_buffers()<cr>", desc = "Find buffers" },
      { "<leader>fc", "<cmd>lua require('telescope.builtin').colorscheme()<cr>", desc = "Change colorscheme" },
      {
        "<leader>fF",
        "<cmd>lua require('telescope.builtin').find_files({hidden = true, no_ignore = true})<cr>",
        desc = "Find all files",
      },
      { "<leader>fm", "<cmd>lua require('telescope.builtin').find_marks()<cr>", desc = "Find marks" },
      { "<leader>fq", "<cmd>lua require('telescope.builtin').quickfix()<cr>", desc = "Find quickfix" },
      { "<leader>fw", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Live grep" },
      { "<leader>fr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", desc = "Find references" },
      {
        "<leader>fW",
        "<cmd>lua require('telescope.builtin').live_grep({hidden = true, no_ignore = true})<cr>",
        desc = "Live grep - no hidden",
      },
      { "<leader>sb", "<cmd>lua require('telescope.builtin').git_branches()<cr>", desc = "Git branches" },
      { "<leader>sr", "<cmd>lua require('telescope.builtin').registers()<cr>", desc = "Registers" },
      { "<leader>sn", "<cmd>lua require('telescope').extensions.notify.notify()<cr>", desc = "Notify" },
    }
  end,
  opts = function()
    local actions = require("telescope.actions")

    return {
      defaults = {
        mappings = {
          n = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
        },
      },
    }
  end,
}
