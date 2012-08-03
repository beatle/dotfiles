set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

if has('gui_running')
	colorscheme eclipse 
else 
	colorscheme navajo
endif

filetype plugin indent on
syntax on
set hidden 

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" unite. experimental
Bundle 'unite.vim'
Bundle 'Shougo/vimfiler.git'
" Bundle 'neocomplcache'

nmap <Leader>fe :VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>

" quick search
Bundle 'ctrlp.vim'
Bundle 'ack.vim'
let g:ctrlp_lazy_update = 1
let g:ackprg="ack-grep -H --nocolor --nogroup --column "

" quick navigation && edit
Bundle 'EasyMotion'
Bundle 'unimpaired.vim'
Bundle 'delimitMate.vim'
Bundle 'surround.vim'
Bundle 'The-NERD-Commenter'
Bundle 'repeat.vim'

" Code tools "
Bundle 'Syntastic'
Bundle 'Tagbar'
Bundle 'techlivezheng/tagbar-phpctags.git'
let g:syntastic_phpcs_conf = " --standard=Zend "
nmap <Leader>o :TagbarToggle<CR>

" php
Bundle 'phpcomplete.vim'
Bundle 'phpfolding.vim'
Bundle 'stephpy/vim-phpqa.git'

" Version control
Bundle 'gitv'
Bundle 'fugitive.vim'
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
map <silent> <Leader>gs :Gstatus<cr>
map <silent> <Leader>gd :Gdiff<cr>
map <silent> <Leader>gb :Git branch<cr>
map <silent> <Leader>gba :Git branch -a<cr>

" relaional db access
Bundle 'dbext.vim'
let g:dbext_default_profile_mysql_local = 'type=MYSQL:user=root:passwd=1:extra=-t'

set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
set virtualedit=all             " allow the cursor to go in to "invalid" places
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

" Debugger
" Unmap default key maps to avoid conflicts with Desktop Environment
" autocmd VimEnter * unmap <F1>
" autocmd VimEnter * unmap <F2>
" autocmd VimEnter * unmap <F3>
" autocmd VimEnter * unmap <F4>
" " autocmd VimEnter * unmap <F5>
" " autocmd VimEnter * unmap <F6>
" autocmd VimEnter * unmap <F10>
" autocmd VimEnter * unmap <F11>
" autocmd VimEnter * unmap <F12>
"  
" " remap it all with Leader key
" map <Leader>dm :python debugger_mark()<cr>
" " map <Leader>dR :python debugger_resize()<cr>
" map <Leader>di :python debugger_command('step_into')<cr>
" map <Leader>dn :python debugger_command('step_over')<cr>
" map <Leader>do :python debugger_command('step_out')<cr>

" map <Leader>dr :python debugger_run()<cr>
" map <Leader>dq :python debugger_quit()<cr>

" map <Leader>dg :python debugger_globals()<cr>
" map <Leader>dc :python debugger_context()<cr>
" map <Leader>dp :python debugger_property()<cr>
" 
" nnoremap <Leader>de :python debugger_watch_input("eval")<cr>A
" vnoremap <Leader>de :python debugger_visual_eval()<cr>A
