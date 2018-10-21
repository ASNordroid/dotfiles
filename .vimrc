if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Plug 'scrooloose/nerdtree'
" Plug 'scrooloose/syntastic'
" Plug 'tpope/vim-fugitive'
" Plug 'valloric/youcompleteme'
" Plug 'vim-syntastic/syntastic'
" Plug 'davidhalter/jedi-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'vimwiki/vimwiki'
Plug 'zah/nim.vim'
call plug#end()

set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8
set hlsearch
set number
set showmode

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

colorscheme nord

map! <F3> <C-R>=strftime('%d.%m.%Y')<CR>
map! <F4> <C-R>=strftime('%H:%M')<C-R>
nnoremap <silent> <Space> :nohlsearch <Bar>:echo<CR>
map q: :

fun! JumpToDef()
    if exists("*GotoDefinition_" . &filetype)
        call GotoDefinition_{&filetype}()
    else
        exe "norm! \<C-]>"
    endif
endf " Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i
