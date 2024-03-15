return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>fE", false },
    { "<leader>fe", false },
    { "<leader>e", false },
    { "<leader>E", false },
    { "<leader>ge", false },
    { "<leader>be", false },
  },
  opts = {
    buffers = {
      follow_current_file = {
        enabled = true,
      },
    },
    close_if_last_window = true,
    filesystem = {
      follow_current_file = {
        enabled = true,
      },
    },
    window = {
      position = "float",
      width = 30,
    },
  },
}
