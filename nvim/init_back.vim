" Install vim-plug if it is not already installed

if empty(glob('~/.vim/autoload/plug.vim'))
    silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Source plugins
  runtime ./plugins.vim

if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif

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

  runtime ./mappings.vim
  runtime ./colors/carbon.vim
