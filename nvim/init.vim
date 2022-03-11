" Install vim-plug if it is not already installed

if empty(glob('~/.vim/autoload/plug.vim'))
    silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Source plugins
call plug#begin('~/.vim/plugged')
  source ~/.config/nvim/plugins.vim
call plug#end()

if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif

" Load Bufferline at the end of the stack
call sourcery#source_defer('config/bufferline.lua')

" Initialize sourcery
 call sourcery#init()
