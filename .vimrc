set nocompatible              " be iMproved, required

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line

" Initialize plugin system
call plug#end()


set termguicolors
colorscheme molokai
hi Normal ctermbg=NONE guibg=NONE

" Theme for Airline
" let g:airline_theme='deus'
let g:airline_powerline_fonts=1

" For vim-airline to show buffers at top
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

" For coc-prettier extension
command! -nargs=0 Prettier :CocCommand prettier.formatFile

set number relativenumber " show line numbers
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

" For vim-devicons to show icons
set guifont=DroidSansMono\ Nerd\ Font\ 11

" Splits and Tabbed Files
" To open vertical split on right and horizontal below
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" For NERDTree config
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" For NERDTree keymapping
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" For removing one of the two statusline i.e removing the default one
" set noshowmode  " to get rid of thing like --INSERT--
" set noshowcmd  " to get rid of display of last command
" set shortmess+=F  " to get rid of the file name displayed in the command line bar
