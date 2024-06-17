return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  enabled = function()
    return LazyVim.pick.want() == "telescope"
  end,
  -- replace all Telescope keymaps with only one mapping
  keys = function()
    return {
      {
        "<leader>,",
        false,
      },
      { "<leader>/", false },
      -- Terminal - using toggleterm
      { "<leader>ft", false },
      { "<leader>fT", false },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      -- find
      { "<leader>fb", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", desc = "File browser" },
      { "<leader>fc", LazyVim.pick.config_files(), desc = "Find Config File" },
      {
        "<leader>ff",
        "<cmd>lua require('telescope.builtin').find_files()<cr>",
        desc = "Find Files (root dir)",
      },
      {
        "<leader>fF",
        "<cmd>lua require('telescope.builtin').find_files({hidden = true, no_ignore = true})<cr>",
        desc = "Find Files - no hidden",
      },
      { "<leader>fR", LazyVim.pick("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },

      { "<leader>fr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
      { "<leader>sg", false },
      { "<leader>fw", LazyVim.pick("live_grep"), desc = "Grep (root dir)" },
      {
        "<leader>fW",
        "<cmd>lua require('telescope.builtin').live_grep({hidden = true, no_ignore = true})<cr>",
        desc = "Live grep - no hidden",
      },
      -- git
      { "<leader>gc", false },
      { "<leader>gs", false },
      -- search
      { '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
      { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
      { "<leader>sb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
      { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
      { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
      { "<leader>sG", false },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
      { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
      { "<leader>sw", LazyVim.pick("grep_string", { word_match = "-w" }), desc = "Word (root dir)" },
      { "<leader>sW", LazyVim.pick("grep_string", { cwd = false, word_match = "-w" }), desc = "Word (cwd)" },
      { "<leader>sw", LazyVim.pick("grep_string"), mode = "v", desc = "Selection (root dir)" },
      { "<leader>sW", LazyVim.pick("grep_string", { cwd = false }), mode = "v", desc = "Selection (cwd)" },
      { "<leader>uC", LazyVim.pick("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
      {
        "<leader>ss",
        function()
          require("telescope.builtin").lsp_document_symbols({
            symbols = require("lazyvim.config").get_kind_filter(),
          })
        end,
        desc = "Goto Symbol",
      },
      {
        "<leader>sS",
        function()
          require("telescope.builtin").lsp_dynamic_workspace_symbols({
            symbols = require("lazyvim.config").get_kind_filter(),
          })
        end,
        desc = "Goto Symbol (Workspace)",
      },
    }
  end,
  opts = function()
    local actions = require("telescope.actions")

    return {
      defaults = {
        file_ignore_patterns = {
          "assets",
        },
        layout_config = {
          prompt_position = "top",
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.smart_send_to_qflist,
          },
        },
        path_display = { "truncate" },
        sorting_strategy = "ascending",
      },
    }
  end,
}
