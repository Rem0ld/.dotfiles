
if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

" Theme plugins
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
"Plug 'morhetz/gruvbox'
"Plug 'arcticicestudio/nord-vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'rust-lang/rust.vim'

Plug 'preservim/nerdcommenter'
Plug 'Chiel92/vim-autoformat'

if has("nvim")
  Plug 'hoob3rt/lualine.nvim'
  Plug 'p00f/nvim-ts-rainbow'
  Plug 'lukas-reineke/indent-blankline.nvim'
  " filer, I'm using nerdTree
  "   Plug 'kristijanhusak/defx-git'
  "   Plug 'kristijanhusak/defx-icons'
  "   Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'folke/lsp-colors.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'nvim-lua/popup.nvim'
  "   Fuzzy finder
  "   Plug 'nvim-lua/plenary.nvim'
  "   Plug 'nvim-telescope/telescope.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'kyazdani42/nvim-web-devicons'
endif
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()

