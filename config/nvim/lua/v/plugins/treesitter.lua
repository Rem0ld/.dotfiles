return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    pcall(require("nvim-treesitter.install").update({ with_sync = true }))
  end,
  event = "BufReadPost",
  dependencies = {
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "mrjones2014/nvim-ts-rainbow",
  },
  config = function()
    local MAX_FILE_LINES = 3000
    local MAX_FILE_SIZE = 1048576 * 2 -- 1MB

    require("nvim-treesitter.configs").setup({
      autotag = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      ensure_installed = {
        "bash",
        "lua",
        "javascript",
        "markdown",
        "markdown_inline",
        "go",
        "query",
        "rust",
        "regex",
        "tsx",
        "typescript",
        "vim",
      },
      highlight = {
        enable = true,
        max_file_lines = MAX_FILE_LINES,
        disable = function(_, bufnr)
          local ok, stats =
            pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
          if ok and stats and stats.size > MAX_FILE_SIZE then
            return true
          end
        end,
      },
      rainbow = {
        enable = true,
        extended_mode = false,
        max_file_lines = MAX_FILE_LINES,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-space>",
          node_incremental = "<c-space>",
          scope_incremental = "<c-s>",
          node_decremental = "<c-backspace>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["ap"] = "@parameter.outer",
            ["ip"] = "@parameter.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      use_languagetree = true,
    })
  end,
}
