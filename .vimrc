call pathogen#infect()

if has('gui_running')
	colorscheme eclipse "lucius
else 
	colorscheme darkZ
endif

set nocompatible 

" Ack
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Fugitive status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Command-T
let g:CommandTMaxCachedDirectories = 3

" Syntastic settings
let g:syntastic_phpcs_conf = " --standard=Zend "

" dbext profiles
let g:dbext_default_profile_mysql_local = 'type=MYSQL:user=root:passwd=1:dbname=palladium:extra=-t'

" Sidebars mappings
nmap <Leader>e :NERDTreeToggle<CR>:NERDTreeMirror<CR>
nmap <Leader>ep :NERDTree  
nmap <Leader>o :TagbarToggle<CR>:NERDTreeMirror<CR>

" customize cursor lines
hi CursorLine   cterm=NONE ctermbg=none guibg=black 
hi CursorColumn cterm=NONE ctermbg=darkgray guibg=darkgray
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
nnoremap <Leader>vr :so ~/.vimrc<CR>

set clipboard=unnamedplus
set relativenumber 
set cursorline

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


autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType php let php_sql_query=1
autocmd FileType php let php_htmlInStrings=1
autocmd FileType php let php_noShortTags=1

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
map <F9> :DbgStepInto<CR>
map <F10> :DbgStepOver<CR>
map <S-F9> :DbgStepOut<CR>
map <F5> :DbgRun<CR>
map <S-F5> :DbgDetach<CR>
map <F8> :DbgToggleBreakpoint<CR>

