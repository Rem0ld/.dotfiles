-- Functional wrapper for mapping custom keybindings
local function map(mode, lhs, rhs, opts)
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
-- I never use it, the split is weird and with tmux it's not that important
-- map("n", "\\", "<cmd>split<cr>")
map("n", "<leader>h", "<cmd>nohl<cr>")

-- Change mapping record macro
-- map("n", "m", "q")
map("n", "q", "<nop>")

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
-- map("n", "<leader>/", "gcc", { desc = "Comment line" })

-- Format
map("n", "<leader>lf", "<cmd>FormatWrite<cr>", { desc = "Format file" })
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

-- Reload Treesitter highlighting
map(
  "n",
  "<leader>rr",
  "<cmd>ReticleToggleCursorline<cr>",
  { desc = "Reload reticle highlight" }
)

-- floating terminal
map(
  "n",
  "<leader>tf",
  "<cmd>ToggleTerm direction=float<cr>",
  { desc = "Floating Terminal (cwd)" }
)
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })

-- Bufferline & Bufdelete
map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer tab" })
map(
  "n",
  "<S-Tab>",
  "<cmd>BufferLineCyclePrev<cr>",
  { desc = "Previous buffer tab" }
)
map(
  "n",
  "<leader>c",
  "<CMD>:lua MiniBufremove.delete()<CR>",
  { desc = "Close current buffer" }
)

-- Neotree
map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle neotree" })
map("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "Focus neotree" })

-- Telescope
map(
  "n",
  "<leader>fb",
  "<cmd>lua require('telescope.builtin').find_buffers()<cr>",
  { desc = "Find buffers" }
)
map(
  "n",
  "<leader>fc",
  "<cmd>lua require('telescope.builtin').colorscheme()<cr>",
  { desc = "Change colorscheme" }
)
map(
  "n",
  "<leader>ff",
  "<cmd>lua require('telescope.builtin').find_files()<cr>",
  { desc = "Find files" }
)
map(
  "n",
  "<leader>fF",
  "<cmd>lua require('telescope.builtin').find_files({hidden = true, no_ignore = true})<cr>",
  { desc = "Find all files" }
)
map(
  "n",
  "<leader>fm",
  "<cmd>lua require('telescope.builtin').find_marks()<cr>",
  { desc = "Find marks" }
)
map(
  "n",
  "<leader>fo",
  "<cmd>lua require('telescope.builtin').find_oldfiles()<cr>",
  { desc = "Find old files" }
)
map(
  "n",
  "<leader>fq",
  "<cmd>lua require('telescope.builtin').quickfix()<cr>",
  { desc = "Find quickfix" }
)
map(
  "n",
  "<leader>fw",
  "<cmd>lua require('telescope.builtin').live_grep()<cr>",
  { desc = "Live grep" }
)
map(
  "n",
  "<leader>fr",
  "<cmd>lua require('telescope.builtin').lsp_references()<cr>",
  { desc = "Find references" }
)
map(
  "n",
  "<leader>fW",
  "<cmd>lua require('telescope.builtin').live_grep({hidden = true, no_ignore = true})<cr>",
  { desc = "Live grep" }
)
map(
  "n",
  "<leader>sb",
  "<cmd>lua require('telescope.builtin').git_branches()<cr>",
  { desc = "Git branches" }
)
map(
  "n",
  "<leader>sh",
  "<cmd>lua require('telescope.builtin').help_tags()<cr>",
  { desc = "help tags" }
)
map(
  "n",
  "<leader>sm",
  "<cmd>lua require('telescope.builtin').man_pages()<cr>",
  { desc = "man pages" }
)
map(
  "n",
  "<leader>sr",
  "<cmd>lua require('telescope.builtin').registers()<cr>",
  { desc = "Registers" }
)
map(
  "n",
  "<leader>sk",
  "<cmd>lua require('telescope.builtin').keymaps()<cr>",
  { desc = "Keymaps" }
)
map(
  "n",
  "<leader>sc",
  "<cmd>lua require('telescope.builtin').commands()<cr>",
  { desc = "Commands" }
)
map(
  "n",
  "<leader>sn",
  "<cmd>lua require('telescope').extensions.notify.notify()<cr>",
  { desc = "Notify" }
)
map(
  "n",
  "<leader>ls",
  "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>",
  { desc = "Aerial" }
)

-- Gitsigns
map(
  "n",
  "<leader>gj",
  "<cmd>lua require('gitsigns').next_hunk()<cr>",
  { desc = "Next Git hunk" }
)
map(
  "n",
  "<leader>gk",
  "<cmd>lua require('gitsigns').prev_hunk()<cr>",
  { desc = "Prev Git hunk" }
)
map(
  "n",
  "<leader>gl",
  "<cmd>lua require('gitsigns').blame_line()<cr>",
  { desc = "Blame" }
)
map(
  "n",
  "<leader>gp",
  "<cmd>lua require('gitsigns').preview_hunk()<cr>",
  { desc = "Preview hunk" }
)
map(
  "n",
  "<leader>gh",
  "<cmd>lua require('gitsigns').reset_hunk()<cr>",
  { desc = "Reset hunk" }
)
map(
  "n",
  "<leader>gr",
  "<cmd>lua require('gitsigns').reset_buffer()<cr>",
  { desc = "Reset buffer" }
)
map(
  "n",
  "<leader>gs",
  "<cmd>lua require('gitsigns').stage_hunk()<cr>",
  { desc = "Stage hunk" }
)
map(
  "n",
  "<leader>gu",
  "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>",
  { desc = "Undo stage hun" }
)
map(
  "n",
  "<leader>gdd",
  "<cmd>lua require('gitsigns').diffthis()<cr>",
  { desc = "Diff this" }
)
-- Gitui
map(
  "n",
  "<leader>gg",
  "<cmd>lua global.toggle_term_cmd('gitui')<cr>",
  { desc = "gitui (cwd)" }
)

-- Diffview Git
map("n", "<leader>gdo", "<cmd>DiffviewOpen<cr>", { desc = "Diffview open" })
map("n", "<leader>gD", "<cmd>DiffviewClose<cr>", { desc = "Diffview close" })
map(
  "n",
  "<leader>gde",
  "<cmd>DiffviewToggleFiles<cr>",
  { desc = "Diffview toggle files" }
)
map(
  "n",
  "<leader>gdh",
  "<cmd>DiffviewFileHistory<cr>",
  { desc = "Diffview branch history" }
)
map(
  "n",
  "<leader>gdc",
  "<cmd>DiffviewFileHistory %<cr>",
  { desc = "Diffview file history" }
)

-- Lazy menu
map("n", "<leader>pl", "<cmd>Lazy<cr>", { desc = "Show lazy menu" })
-- Mason
map("n", "<leader>pmi", "<cmd>Mason<cr>", { desc = "Mason installer" })
map("n", "<leader>pmu", "<cmd>MasonUpdate<cr>", { desc = "Mason update" })

map(
  "n",
  "<leader>tt",
  "<cmd>TransparentToggle<cr>",
  { desc = "Toggle transparent" }
)

-- INSERT
-- Better escape
map("i", "kj", "<esc>", { silent = true })
map("i", "jj", "<esc>", { silent = true })
map("i", "kk", "<esc>", { silent = true })
map("i", "kj", "<esc>", { silent = true })

map("i", "<C-j>", "<nop>")
map("i", "<C-k>", "<nop>")
