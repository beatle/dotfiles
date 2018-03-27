call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'gregsexton/gitv'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf'

call plug#end()

set rtp+=/usr/local/opt/fzf

set nocompatible
filetype off

filetype plugin indent on
syntax on

nnoremap <Leader>vr :so ~/.vimrc<CR>
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Quick save
map <F2> :w<cr>
imap <F2> <c-o>:w<cr>

" Tabs mappings
map <Leader>te :tabe %:p:h
map <Leader>tq :tabc<cr>
map <Leader>p :FZF <cr>

" I say `no`:
set nowrap
set nowritebackup
set noswapfile
set nobackup
" do not fold by default
set foldlevelstart=99

" set backupdir=$HOME/.vim/backups
" set directory=$HOME/.vim/temp

" customize cursor lines
hi CursorLine cterm=none ctermbg=none guibg=Black
hi CursorColumn cterm=NONE ctermbg=NONE guibg=NONE

set wildignore+=*/node_modules/*,*/bower_components/*,*/dist/*,*/tmp/*
" File settings
set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

" Formating settings
set cindent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab

" Pleasant Features
set laststatus=2
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set wildmenu
set relativenumber
set number
" set cursorline
" keep 2 lines off the edges of the screen when scrolling
set scrolloff=4
set hidden

" search and wildmenu
set showmatch
set hlsearch
set incsearch
set ignorecase
set lz
set gdefault

au FileType xml setlocal foldmethod=syntax

" autoremove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

" vdebug
let g:xml_syntax_folding=1

" let g:syntastic_javascript_checkers = ['eslint']

set t_Co=256
" set tags+=~/.rvm/gems/ruby-2.1.1/gems/tags
" colorscheme vividchalk

if has('gui_running')
" 	colorscheme intelij
	" molokai freya silent
else
	" colorscheme desert
	" colorscheme navajo
	" colorscheme Mustang
	" colorscheme molokai
  " let g:airline_theme='understated'
endif

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
