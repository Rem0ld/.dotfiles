local map = vim.api.nvim_set_keymap

map('n', '<Space>', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = ' '

-- Remove highlight /
map('n', '<C-_>', '<CMD>:noh<CR>', {noremap = true})
-- Config nvim files at 2 fingers away 
map('n', '<Leader>pl', ':e ~/.dotfiles/nvim/lua/plugins.lua<CR>', { noremap = true})
map('n', '<Leader>tmx', ':e ~/.dotfiles/.tmux.conf', { noremap = true})
map('n', '<Leader>mp', ':e ~/.dotfiles/nvim/lua/mappings.lua', { noremap = true})

-- Easy quit
map('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })
map('n', '<Leader>qq', ':q!<CR>', { noremap = true, silent = true })
map('n', '<Leader>w', ':bd<CR>', { noremap = true, silent = true })
-- Back to normal mode, with save
map('i', 'jk', '<ESC>:w<CR>', { noremap = true, silent = true })
map('i', 'kj', '<ESC>:w<CR>', { noremap = true, silent = true })
map('n', '<Leader>s', ':w<CR>', {noremap = true})
-- Easy source/edit vimrc file
map('n', '<Leader>sv', ':source $MYVIMRC<CR>', { noremap = true})
map('n', '<Leader>ev', ':vsplit $MYVIMRC<CR>', { noremap = true})
-- yank from cursor to the end of the line
map('n', 'Y', 'y$', {noremap = true})
-- keep cursor in the middle of the screen
map('n', 'n', 'nzzzv', {noremap = true})
map('n', 'N', 'Nzzzv', {noremap = true})
map('n', 'J', 'mzJ`z', {noremap = true})
-- makes undo better
map('i', ',', ',<C-G>u', {noremap = true})
map('i', '.', '.<C-G>u', {noremap = true})
map('i', '!', '!<C-G>u', {noremap = true})
map('i', '?', '?<C-G>u', {noremap = true})
-- moving text
map('v', 'J', ":m '>+1<CR>gv=gv", {noremap = true})
map('v', 'K', ":m '<-2<CR>gv=gv", {noremap = true})
map('i', '<C-k>', "<ESC>:m .-2<CR>==", {noremap = true})
map('i', '<C-j>', "<ESC>:m .+1<CR>==", {noremap = true})
map('n', '<Leader>j', ":m .+1<CR>==", {noremap = true})
map('n', '<Leader>k', ":m .-2<CR>==", {noremap = true})

-- Telescope config
map('n', '<Leader>ff', '<CMD>:Telescope find_files<CR>', {noremap = true}) 
map('n', '<Leader>fg', '<CMD>:Telescope live_grep<CR>', {noremap = true}) 
map('n', '<Leader>fb', '<CMD>:Telescope buffers<CR>', {noremap = true}) 
map('n', '<Leader>fh', '<CMD>:Telescope help_tags<CR>', {noremap = true}) 

-- Nvim-tree
map('n', '<C-t>', ':NvimTreeToggle<CR>', {noremap = true})
map('n', '<Leader>r', ':NvimTreeRefresh<CR>', {noremap = true})
map('n', '<Leader>n', ':NvimTreeFindFile<CR>', {noremap = true})
