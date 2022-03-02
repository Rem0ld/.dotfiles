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

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

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

" Mappings: telescope
nnoremap <Leader><Leader>v :Telescope sourcery<CR>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>app <cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor())<cr>

nnoremap <leader>2 <cmd>:tabnew<cr>
nnoremap <leader>w <cmd>:bd<cr>
nnoremap <leader>git <cmd>:FloatermNew lazygit<cr>

nnoremap <C-_> <cmd>:noh<cr>

nnoremap <leader>ev :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>pl :e ~/.config/nvim/plugins.vim<cr>
nnoremap <leader>mx :e ~/.config/tmux/.tmux.conf<cr>

nnoremap <leader><Right> :bn<CR>
nnoremap <leader><Left> :bp<CR>

" Mappings:floaterm
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'

nnoremap H gT
nnoremap L gt

" Mappings: tinkeray
nmap <Leader>t <Plug>TinkerayOpen

function! SourceryMappings()
  nmap <buffer> gp <Plug>SourceryGoToRelatedPluginDefinition
  nmap <buffer> gm <Plug>SourceryGoToRelatedMappings
  nmap <buffer> gc <Plug>SourceryGoToRelatedConfig
endfunction

" -------------------------------- LSP Saga Mappings --------------------------- "                                  

" Mappings: lspsaga

nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>

nnoremap <silent><leader>cd <cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>

nnoremap <silent><leader>cc <cmd>lua require('lspsaga.diagnostic').sahow_cursor_diagnostics()<CR>

nnoremap <silent> [e <cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]e <cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>

" -------------------------------- Trouble Mappings ---------------------------- "                                  

" Mappings: TroubleToggle

nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" -------------------------------------- NERDTree --------------------------------- "                                  

" Mappings: NERDTree

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
map <leader>r :NERDTreeFind<cr>