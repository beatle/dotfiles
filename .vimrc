filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

if has('gui_running')
	colorscheme eclipse 
else 
	colorscheme navajo
endif

set nocompatible 
set hidden 
syntax on
map Q <Nop>

" Ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Fugitive status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Syntastic settings
let g:syntastic_phpcs_conf = " --standard=Zend "

" dbext profiles
let g:dbext_default_profile_mysql_local = 'type=MYSQL:user=root:passwd=1:extra=-t'

" phpdoc mappings
map <Leader>pd :set paste<CR>:exe PhpDoc()<CR>:set nopaste<CR>i
let g:pdv_cfg_php4always = 0
let g:pdv_cfg_php4guess = 0
let g:pdv_cfg_php4guessval = 0
let g:pdv_cfg_folds = 0

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

" i could'nt find any get_number_of_visible_lines function, so i made my own.
function! GetNumberOfVisibleLines()
	let cur_line = line(".")
	let cur_col = virtcol(".")
	normal H
	let top_line = line(".")
	normal L
	let bot_line = line(".")
	execute "normal " . cur_line . "G"
	execute "normal " . cur_col . "|"
	return bot_line - top_line
endfunc

" noremap <PageUp> 39<C-U>:set scroll=0<CR>
function! MyPageUp()
	let visible_lines = GetNumberOfVisibleLines()
	execute "normal " . visible_lines . "\<C-U>:set scroll=0\r"
endfunction

" noremap <PageDown> 39<C-D>:set scroll=0<CR>
function! MyPageDown()
	let visible_lines = GetNumberOfVisibleLines()
	execute "normal " . visible_lines . "\<C-D>:set scroll=0\r"
endfunction

" BorlandPascal pageup/down behaviour!
" todo: when hitting top/bottom of file, then restore Y to lastY
noremap <PageUp> :call MyPageUp()<CR>
noremap <PageDown> :call MyPageDown()<CR>

" Debugger
" Unmap default key maps to avoid conflicts with Desktop Environment
autocmd VimEnter * unmap <F1>
autocmd VimEnter * unmap <F2>
autocmd VimEnter * unmap <F3>
autocmd VimEnter * unmap <F4>
" autocmd VimEnter * unmap <F5>
" autocmd VimEnter * unmap <F6>
autocmd VimEnter * unmap <F10>
autocmd VimEnter * unmap <F11>
autocmd VimEnter * unmap <F12>
 
" remap it all with Leader key
map <Leader>dm :python debugger_mark()<cr>
" map <Leader>dR :python debugger_resize()<cr>
map <Leader>di :python debugger_command('step_into')<cr>
map <Leader>dn :python debugger_command('step_over')<cr>
map <Leader>do :python debugger_command('step_out')<cr>

" map <Leader>dr :python debugger_run()<cr>
" map <Leader>dq :python debugger_quit()<cr>

map <Leader>dg :python debugger_globals()<cr>
map <Leader>dc :python debugger_context()<cr>
map <Leader>dp :python debugger_property()<cr>

nnoremap <Leader>de :python debugger_watch_input("eval")<cr>A
vnoremap <Leader>de :python debugger_visual_eval()<cr>A
