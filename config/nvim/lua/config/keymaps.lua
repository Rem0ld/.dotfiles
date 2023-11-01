-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Keymaps are automatically loaded on the VeryLazy event
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

local Util = require("lazyvim.util")

-- Remove keymaps
vim.keymap.del("n", "<leader>qq")
vim.keymap.del("n", "<leader>l")
vim.keymap.del("n", "<leader>fn")
vim.keymap.del("n", "<leader>gG")
vim.keymap.del("n", "<leader>cf")
vim.keymap.del("n", "<leader>cd")
-- Windows
vim.keymap.del("n", "<leader>ww")
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>w-")
vim.keymap.del("n", "<leader>w|")
-- Tabs
vim.keymap.del("n", "<leader><tab>l")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>[")
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>d")

-- INSERT
-- Better escape
map("i", "kj", "<esc>", { silent = true })
map("i", "jj", "<esc>", { silent = true })
map("i", "kk", "<esc>", { silent = true })
map("i", "kj", "<esc>", { silent = true })

-- NORMAL
-- Standard
map("n", "<leader>w", "<cmd>w<cr>")
map("n", "<leader>q", "<cmd>q<cr>")
map("n", "|", "<cmd>vsplit<cr>")
-- I never use it, the split is weird and with tmux it's not that important
-- map("n", "\\", "<cmd>split<cr>")
map("n", "<leader>h", "<cmd>nohl<cr>")
-- Neotree
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle neotree" })
map("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "Focus neotree" })

-- Change mapping record macro
-- map("n", "m", "q")
map("n", "q", "<nop>")

-- Better vertical navigation
map("n", "<C-d>", "<C-d>zz", { silent = true })
map("n", "<C-u>", "<C-u>zz", { silent = true })
map("n", "n", "nzzzv", { silent = true })
map("n", "N", "Nzzzv", { silent = true })

-- Format Json
map("n", "<leader>jq", "<cmd>%!jq .<cr>", { desc = "Format json current file" })

-- Logsitter
map("n", "<leader>lg", "<cmd>Logsitter<cr>", { desc = "Log line" })

-- Reloads
-- Reload Treesitter highlighting
map(
  "n",
  "<leader>rt",
  "<cmd>write | edit | TSBufEnable highlight<cr>",
  { desc = "Reload treesitter for current buffer" }
)
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })

-- Gitui
map("n", "<leader>gg", function()
  Util.terminal({ "gitui" })
end)
map("n", "<leader>pl", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Bufferline & Bufdelete
map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer tab" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer tab" })
