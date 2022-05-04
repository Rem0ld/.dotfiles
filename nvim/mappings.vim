" ------------------------------------------------------------------------------
" # Mappings
" ------------------------------------------------------------------------------
" # All of your mappings go in this file! Don't worry about your mappings
" # being separate from related config. Sourcery provides mappings to
" # easily jump between plugin definitions, mappings, and configs.
" #
" # More info: https://github.com/jesseleite/vim-sourcery#jumping-between-files

let mapleader = ' '


inoremap <silent> jk <ESC>:w<CR>
inoremap <silent> kj <ESC>:w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>qq :q!<CR>

" yank from cursor to the end of line
nnoremap Y y$

" keep cursor in the middle of the screen
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" makes undo better
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-k> <esc>:m .-2<CR>==
inoremap <C-j> <esc>:m .+1<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

nnoremap <leader>w <cmd>:bd<cr>

nnoremap <leader>ev :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>pl :e ~/.config/nvim/plugins.vim<cr>
nnoremap <leader>mx :e ~/.config/tmux/.tmux.conf<cr>

