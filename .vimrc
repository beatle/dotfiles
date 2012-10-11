set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

if has('gui_running')
	colorscheme molokai " freya silent
else
	colorscheme desert
endif

filetype plugin indent on
syntax on
set hidden

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" debugger for Dbgp interface
" php, nodejs, python, ruby, perl...
Bundle 'joonty/vdebug.git'
let g:vdebug_keymap = {
\    "run" : "<F5>",
\    "run_to_cursor" : "<Leader>dc",
\    "step_over" : "<Leader>dn",
\    "step_into" : "<Leader>di",
\    "step_out" : "<Leader>do",
\    "close" : "<F6>",
\    "detach" : "<F7>",
\    "set_breakpoint" : "<Leader>db",
\    "get_context" : "<Leader>dg",
\}

" project
"Bundle 'DfrankUtil'
"Bundle 'vimprj'
"Bundle 'indexer.tar.gz'

" quick search
Bundle 'ctrlp.vim'
Bundle 'ack.vim'
let g:ctrlp_lazy_update = 1
let g:ackprg="ack-grep -H --nocolor --nogroup --column "

Bundle 'The-NERD-tree'
" unite. experimental
Bundle 'unite.vim'
Bundle 'Shougo/vimfiler.git'
Bundle 'Shougo/vimproc'
Bundle 'neocomplcache'

nmap <Leader>fe :VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>
nmap <Leader>fef :VimFilerBufferDir -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>
let g:vimfiler_as_default_explorer=1

" quick navigation && edit
Bundle 'EasyMotion'
Bundle 'unimpaired.vim'
Bundle 'delimitMate.vim'
Bundle 'surround.vim'
Bundle 'repeat.vim'
Bundle 'matchit.zip'
Bundle 'tomtom/tcomment_vim.git'
Bundle 'SirVer/ultisnips.git'
Bundle 'mattn/zencoding-vim.git'

Bundle 'Gundo'

" Code tools "
Bundle 'Syntastic'
Bundle 'Tagbar'
Bundle 'techlivezheng/tagbar-phpctags.git'
Bundle 'wesleyche/SrcExpl.git'
let g:syntastic_phpcs_conf = " --standard=Zend "
nmap <Leader>o :TagbarToggle<CR>

" php
Bundle 'phpcomplete.vim'
Bundle 'phpfolding.vim'

" Version control
Bundle 'gitv'
Bundle 'fugitive.vim'
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
map <silent> <Leader>gv :Gitv<cr>
map <silent> <Leader>gs :Gstatus<cr>
map <silent> <Leader>gd :Gdiff<cr>
map <silent> <Leader>gb :Git branch<cr>
map <silent> <Leader>gba :Git branch -a<cr>

" relaional db access
Bundle 'dbext.vim'
let g:dbext_default_profile_mysql_local = 'type=MYSQL:user=root:passwd=1:extra=-t'

Bundle 'Color-Sampler-Pack'

set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
" Buffers wild menu
set wildcharm=<C-Z>
nmap <leader>b :b <C-Z>

" Quick save
map <F2> :w<cr>
imap <F2> <c-o>:w<cr>

" customize cursor lines
hi CursorLine   cterm=NONE ctermbg=none guibg=black
hi CursorColumn cterm=NONE ctermbg=darkgray guibg=darkgray
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
nnoremap <Leader>vr :so ~/.vimrc<CR>

" copy/paste to X buffer
set clipboard=unnamedplus
set relativenumber
set cursorline

set mouse=a
" Formating settings
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set ai " включим автоотступы для новых строк
set cin " включим отступы в стиле Си

" backup settings
set nowritebackup
set noswapfile
set nobackup
set backupdir=$HOME/.vim/backups
set directory=$HOME/.vim/temp

" search and wildmenu
set wildmenu
set showmatch
set hlsearch
set incsearch
set ignorecase
set lz
set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866
set gdefault

" crazy regexp search
nnoremap / /\v
vnoremap / /\v

" Tabs mappings
map <Leader>tt :tabe
map <Leader>tc :tabc<cr>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>es :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>ev :vnew <C-R>=expand("%:p:h") . '/'<CR>

autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType php let php_sql_query=1
autocmd FileType php let php_htmlInStrings=1
autocmd FileType php let php_noShortTags=1

let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
" autoremove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

