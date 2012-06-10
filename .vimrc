call pathogen#infect()

if has('gui_running')
	colorscheme eclipse 
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
let g:dbext_default_profile_mysql_local = 'type=MYSQL:user=root:passwd=1:extra=-t'

" Sidebars mappings
nmap <Leader>fe :NERDTreeToggle<CR>:NERDTreeMirror<CR>
nmap <Leader>fep :NERDTree 
nmap <Leader>o :TagbarToggle<CR>

" customize cursor lines
hi CursorLine   cterm=NONE ctermbg=none guibg=black 
hi CursorColumn cterm=NONE ctermbg=darkgray guibg=darkgray
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
nnoremap <Leader>vr :so ~/.vimrc<CR>

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

nnoremap <Leader>e :python debugger_watch_input("eval")<cr>A
vnoremap <Leader>e :python debugger_visual_eval()<cr>A
