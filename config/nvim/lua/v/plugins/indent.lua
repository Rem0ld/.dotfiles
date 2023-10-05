return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  opts = {
    space_char_blankline = " ",
    leading_space_enable = true,
    use_treesitter = true,
    show_end_of_line = true,
    show_current_context = true,
    show_current_context_start = false,
    show_trailing_blankline_indent = false,
    filetype_exclude = {
      "TelescopePrompt",
      "NvimTree",
      "help",
      "txt",
      "markdown",
    },
    buftype_exclude = { "terminal", "nofile" },
  },
  tag = "v2.20.8",
}
