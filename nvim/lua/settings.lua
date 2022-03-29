
local opt = vim.opt

vim.env.WORKSPACE = '~/workspace'


opt.clipboard = 'unnamedplus'

vim.cmd([[
	colorscheme gruvbox-flat
]])

opt.encoding = 'UTF-8'
opt.guifont = 'FiraCode Nerd Font:h18'
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.wrap = true
opt.cursorline = true
opt.scrolloff = 10
opt.mouse = 'a'
opt.colorcolumn = '80'
opt.smartcase = true
opt.ignorecase = true
opt.viewoptions = 'folds,cursor'
opt.expandtab = true
opt.showcmd = true
opt.autoindent = true
opt.hlsearch = true

-- Save/restore code folds
vim.cmd([[
augroup saveFolds
    autocmd!
    autocmd BufWinLeave ?* mkview
    autocmd BufWinEnter ?* silent! loadview
augroup END
]])
