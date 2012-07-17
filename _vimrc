set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/_vimfiles/bundle/vundle/
call vundle#rc()

" Thanks to scrooloose
Bundle 'scrooloose/nerdtree.git'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'scrooloose/syntastic.git'
Bundle 'scrooloose/snipmate-snippets.git'
" Syntastic settings
let g:syntastic_phpcs_conf = " --standard=Zend "

" God save Timmy
Bundle 'tpope/vim-unimpaired.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-repeat.git'
Bundle 'tpope/vim-fugitive.git'
" git status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" requires perl and ack
Bundle 'ack.vim'
Bundle 'nerdtree-ack'
" ack output format
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" requires ctags
Bundle 'majutsushi/tagbar.git'

Bundle 'matchit.zip'
" misc
Bundle 'millermedeiros/vim-statline.git'
Bundle 'Raimondi/delimitMate.git'
Bundle 'snipMate'

" Quick save
map <F2> :w<cr>
imap <F2> <c-o>:w<cr>

" Sidebars mappings
nmap <Leader>fe :NERDTreeToggle<CR>:NERDTreeMirror<CR>
nmap <Leader>fef :NERDTreeFind<CR>
nmap <Leader>fep :NERDTree 
nmap <Leader>o :TagbarToggle<CR>

" customize cursor lines
hi CursorLine   cterm=NONE ctermbg=none guibg=black 
hi CursorColumn cterm=NONE ctermbg=darkgray guibg=darkgray
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
nnoremap <Leader>vr :so ~/.vimrc<CR>

filetype plugin indent on
syntax on
colorscheme desert
set wildmenu
set hidden 
set guioptions-=TrL
set relativenumber 
set cursorline
set mouse=a

" Formating settings
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set ai 
set cin 

" backup settings
set nowritebackup
set noswapfile
set nobackup

" search and wildmenu
set wildmenu
set showmatch
set hlsearch
set incsearch
set ignorecase
set lz
set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

" Tabs mappings
map <Leader>tt :tabe
map <Leader>tc :tabc<cr>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>es :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>ev :vnew <C-R>=expand("%:p:h") . '/'<CR>

map <Leader>eh :e C:\Windows\System32\drivers\etc\hosts<cr>

map <Leader>xf :%!xmllint --format --encode UTF-8 - <cr>

