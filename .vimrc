set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plugin 'dense-analysis/ale'
" All of your Plugins must be added before the following line

call vundle#end()            " required

syntax enable
filetype plugin indent on    " required

set termguicolors
colorscheme molokai
hi Normal ctermbg=NONE guibg=NONE

" Theme for Airline
" let g:airline_theme='deus'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

set number             " show line numbers
set encoding=utf-8     " set encoding to UTF-8 (default was "latin1")
set wildmenu           " visual autocomplete for command menu
set showmatch          " highlight matching parentheses / brackets [{()}]
set cursorline         " highlight current line
set noswapfile         " disable the swapfile
set incsearch          " show search results as you type
set hlsearch           " highlight all results

"" Tab settings

set tabstop=4           " width that a <TAB> character displays as
set expandtab           " convert <TAB> key-presses to spaces
set shiftwidth=4        " number of spaces to use for each step of (auto)indent
set softtabstop=4       " backspace after pressing <TAB> will remove up to this many spaces

set autoindent          " copy indent from current line when starting a new line
set smartindent         " even better autoindent (e.g. add indent after '{')

" ALE and Linting and Fixers
let g:ale_linters = {'python':['flake8']}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines','trim_whitespace','prettier'],
\   'python': ['black'],
\}

let g:ale_fix_on_save = 1


" Splits and Tabbed Files
" To open vertical split on right and horizontal below
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" For removing one of the two statusline i.e removing the default one
" set noshowmode  " to get rid of thing like --INSERT--
" set noshowcmd  " to get rid of display of last command
" set shortmess+=F  " to get rid of the file name displayed in the command line bar
