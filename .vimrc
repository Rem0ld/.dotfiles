
" Theme related config for nord
"let g:lightline = {
      "\ 'colorscheme': 'wombat',
      "\ }
"let g:nord_cursor_line_number_background = 1
"let g:rainbow_active = 1

let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

nnoremap <SPACE> <Nop>
let mapleader=" "

inoremap <silent> jk <ESC>:w<CR>
inoremap <silent> kj <ESC>:w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>qq :q!<CR>

" Fundamentals "{{{
" ---------------------------------------------------------------------

" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

" open new split panes to right and below
set splitright
set splitbelow
set nocompatible
set number
set relativenumber
syntax enable
set fileencodings=utf-8,sjis,euc-jp,latin
" Needs to be there to have icons
set encoding=utf-8
set guifont=FiraCode\ Nerd\ Font:h18
set title
set autoindent
set background=dark
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab
"let loaded_matchparen = 1
" set shell=fish
set backupskip=/tmp/*,/private/tmp/*

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executng macros (good performance config)
set lazyredraw
"set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
" Ignore case when searching
set ignorecase
" Be smart when using tabs ;)
set smarttab
" indents
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
 "set wildignore+=*/node_modules/*,_site,*/__pycache__/,*/venv/*,*/target/*,*/.vim$,\~$,*/.log,*/.aux,*/.cls,*/.aux,*/.bbl,*/.blg,*/.fls,*/.fdb*/,*/.toc,*/.out,*/.glo,*/.log,*/.ist,*/.fdb_latexmk
" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Add asterisks in block comments
set formatoptions+=r

"}}}

" Highlights "{{{
" ---------------------------------------------------------------------
set cursorline
"set cursorcolumn

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

"}}}

" File types "{{{
" ---------------------------------------------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

"}}}

" Imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif

runtime ./maps.vim
"}}}

" Syntax theme "{{{
" ---------------------------------------------------------------------

" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  
  colorscheme tokyonight
  " let g:neosolarized_termtrans=1
  "runtime ./colors/gruvbox.vim
endif

"}}}

" Extras "{{{
" ---------------------------------------------------------------------
set exrc
"}}}
" vim: set foldmethod=marker foldlevel=0:i

" split window vertically with vimrc
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source last version vimrc in terminal
:nnoremap <leader>sv :source $MYVIMRC<cr>

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


" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" FZF
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" cmd maj f
nnoremap <leader><S-f> :Rg .<CR>

" LSP Saga
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
"nnoremap <silent> <C-j> <Cmd>Lspsaga diagnostic_jump_next<CR>
"nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
"inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
"nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>


" Excluding dir with Rg command 
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   "rg -g '!design/' -g '!dist/' -g '!pnpm-lock.yaml' -g '!.git' -g '!node_modules' -g '!yarn.lock' --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--exact --delimiter : --nth 4..'}), <bang>0)


 " init indent blankline
 
lua <<EOF

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
show_end_of_line = true,
space_char_blankline = " ",
}

EOF
