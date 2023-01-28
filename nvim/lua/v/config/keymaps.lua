-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- NORMAL
-- Standard
map("n", "<leader>w", "<cmd>w<cr>")
map("n", "<leader>q", "<cmd>q<cr>")
map("n", "<leader>/", ":nohlsearch<CR>", { silent = true })
map("n", "|", "<cmd>vsplit<cr>")
map("n", "\\", "<cmd>split<cr>")
map("n", "<leader>h", "<cmd>nohl<cr>")

-- Move lines
map("n", "<leader>j", ":m .+1<cr>==", { silent = true })
map("n", "<leader>k", ":m .-2<cr>==", { silent = true })

-- Better vertical navigation
map("n", "<C-d>", "<C-d>zz", { silent = true })
map("n", "<C-u>", "<C-u>zz", { silent = true })
map("n", "n", "nzzzv", { silent = true })
map("n", "N", "Nzzzv", { silent = true })

-- Navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to bottom split" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to top split" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })

-- Going through quicklist
map("n", "[q", ":cp<cr><cr>", { silent = true })
map("n", "]q", ":cn<cr><cr>", { silent = true })

-- Better delete ( remove from registers )
map("n", "<leader>d", '"_d', { silent = true })

-- Comment line
map("n", "<leader>/", "gcc", { desc = "Comment line" })

-- floating terminal
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Floating Terminal (cwd)" })
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })

-- Bufferline & Bufdelete
map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer tab" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer tab" })
map("n", "<leader>c", "<cmd>Bdelete<cr>", { desc = "Close current buffer" })

-- Neotree
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle neotree" })
map("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "Focus neotree" })

-- Telescope
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", { desc = "Find files" })
map(
  "n",
  "<leader>fF",
  "<cmd>lua require('telescope.builtin').find_files({hidden = true, no_ignore = true})<cr>",
  { desc = "Find all files" }
)
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').find_buffers()<cr>", { desc = "Find buffers" })
map("n", "<leader>fm", "<cmd>lua require('telescope.builtin').find_marks()<cr>", { desc = "Find marks" })
map("n", "<leader>fo", "<cmd>lua require('telescope.builtin').find_oldfiles()<cr>", { desc = "Find old files" })
map("n", "<leader>fw", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { desc = "Live grep" })
map(
  "n",
  "<leader>fW",
  "<cmd>lua require('telescope.builtin').live_grep({hidden = true, no_ignore = true})<cr>",
  { desc = "Live grep" }
)
map("n", "<leader>sb", "<cmd>lua require('telescope.builtin').git_branches()<cr>", { desc = "Git branches" })
map("n", "<leader>sh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", { desc = "help tags" })
map("n", "<leader>sm", "<cmd>lua require('telescope.builtin').man_pages()<cr>", { desc = "man pages" })
map("n", "<leader>sr", "<cmd>lua require('telescope.builtin').registers()<cr>", { desc = "Registers" })
map("n", "<leader>sk", "<cmd>lua require('telescope.builtin').keymaps()<cr>", { desc = "Keymaps" })
map("n", "<leader>sc", "<cmd>lua require('telescope.builtin').commands()<cr>", { desc = "Commands" })
map("n", "<leader>sn", "<cmd>lua require('telescope').extensions.notify.notify()<cr>", { desc = "Notify" })
map("n", "<leader>ls", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", { desc = "Aerial" })
map("n", "<leader>lD", "<cmd>lua require('telescope.builtin').diagnostics()<cr>", { desc = "Diagnostics" })

-- Gitsigns
map("n", "<leader>gj", "<cmd>lua require('gitsigns').next_hunk()<cr>", { desc = "Next Git hunk" })
map("n", "<leader>gk", "<cmd>lua require('gitsigns').prev_hunk()<cr>", { desc = "Next Git hunk" })
map("n", "<leader>gl", "<cmd>lua require('gitsigns').blame_line()<cr>", { desc = "Next Git hunk" })
map("n", "<leader>gp", "<cmd>lua require('gitsigns').preview_hunk()<cr>", { desc = "Next Git hunk" })
map("n", "<leader>gh", "<cmd>lua require('gitsigns').reset_hunk()<cr>", { desc = "Next Git hunk" })
map("n", "<leader>gr", "<cmd>lua require('gitsigns').reset_buffer()<cr>", { desc = "Next Git hunk" })
map("n", "<leader>gs", "<cmd>lua require('gitsigns').stage_hunk()<cr>", { desc = "Next Git hunk" })
map("n", "<leader>gu", "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", { desc = "Next Git hunk" })
map("n", "<leader>gd", "<cmd>lua require('gitsigns').diffthis()<cr>", { desc = "Next Git hunk" })
-- Gitui
map("n", "<leader>gg", "<cmd>lua global.toggle_term_cmd('gitui')<cr>", { desc = "gitui (cwd)" })

-- Lazy menu
map("n", "<leader>pl", "<cmd>Lazy<cr>", { desc = "Show lazy menu" })
-- Mason
map("n", "<leader>pmi", "<cmd>Mason<cr>", { desc = "Mason installer" })
map("n", "<leader>pmu", "<cmd>Mason<cr>", { desc = "Mason update" })

-- INSERT
-- Better escape
map("i", "kj", "<esc>", { silent = true })
map("i", "jj", "<esc>", { silent = true })
map("i", "kk", "<esc>", { silent = true })
map("i", "kj", "<esc>", { silent = true })

map("i", "<C-j>", "<nop>")
map("i", "<C-k>", "<nop>")
