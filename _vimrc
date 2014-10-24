set nocompatible " be iMproved
filetype off

set rtp+=~/_vimfiles/bundle/Vundle.vim/
call vundle#rc()

filetype plugin indent on
syntax on

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Fun
Bundle 'Lokaltog/vim-powerline.git'
Bundle 'vim-scripts/Colour-Sampler-Pack.git'
Bundle 'wwwsearch'
Bundle 'vim-scripts/Decho.git'

" Dbgp debugger
" Bundle 'joonty/vdebug.git'

" git support
Bundle 'gitv'
Bundle 'fugitive.vim'

" rdbms support
Bundle 'dbext.vim'

" unite vim
Bundle 'unite.vim'
Bundle 'Shougo/vimfiler.git'
Bundle 'Shougo/vimproc'
Bundle 'neocomplcache'

Bundle 'tpope/vim-vinegar'
Bundle 'tpope/vim-projectionist'

" Bundle 'scrooloose/nerdtree.git'
" Bundle 'xolox/vim-session.git'
" Bundle 'xolox/vim-misc'

" quick search
Bundle 'ctrlp.vim'
Bundle 'mileszs/ack.vim.git'

" Project switch
" Bundle 'DfrankUtil'
" Bundle 'vimprj'
" Bundle 'cscope.vim'
"Bundle 'indexer.tar.gz'

" quick motion && edit
" Bundle 'EasyMotion'
Bundle 'unimpaired.vim'
Bundle 'delimitMate.vim'
Bundle 'surround.vim'
Bundle 'repeat.vim'
Bundle 'matchit.zip'
Bundle 'tomtom/tcomment_vim.git'
Bundle 'SirVer/ultisnips.git'
Bundle 'mattn/emmet-vim.git'

" Code tools "
Bundle 'Syntastic'
Bundle 'Tagbar'

" Frontend
" Bundle 'csslint.vim'

" Python
" Bundle 'https://github.com/sontek/rope-vim.git'

" Php bundles
" Bundle 'phpcomplete.vim'
" Bundle 'techlivezheng/tagbar-phpctags.git'
" Bundle "shawncplus/phpcomplete.vim.git"
" Bundle 'phpfolding.vim'
" Bundle 'joonty/vim-phpqa.git'
" Bundle '2072/PHP-Indenting-for-VIm.git'

" Ruby
" Bundle 'ruby.vim'
" Bundle 'ftpluginruby.vim'
" Bundle 'ruby-matchit'
" Bundle "tpope/vim-rails"

" Css
Bundle 'hail2u/vim-css3-syntax.git'
Bundle 'skammer/vim-css-color.git'
Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim.git'
Bundle 'groenewege/vim-less.git'

" html
Bundle 'othree/html5.vim'

" js
" Bundle 'Enhanced-Javascript-syntax'
Bundle 'jelera/vim-javascript-syntax'
" Bundle 'marijnh/tern_for_vim'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'vim-scripts/JavaScript-Indent'
Bundle 'honza/vim-snippets'
Bundle 'mustache/vim-mustache-handlebars.git'

" .NET world
Bundle 'aspnetide.vim'
Bundle 'csharp.vim'
Bundle 'nosami/Omnisharp.git'
Bundle 'OrangeT/vim-csharp.git'
Bundle 'cs.vim'
Bundle 'ASPJScript'
Bundle 'aspnet.vim'
Bundle 'aspnetcs'
Bundle 'adamclerk/vim-razor.git'

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

nmap <Leader>e :VimFiler<CR>
nmap <Leader>es :VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>
nmap <Leader>ef :VimFilerBufferDir -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>
nmap <Leader>b :Unite buffer<CR>
nmap <Leader>t :Unite tab<CR>
nmap <Leader>o :TagbarToggle<CR>

map <silent> <Leader>gv :Gitv<cr>
map <silent> <Leader>gs :Gstatus<cr>
map <silent> <Leader>gd :Gdiff<cr>
map <silent> <Leader>gb :Git branch<cr>
map <silent> <Leader>gba :Git branch -a<cr>

nnoremap <Leader>vr :so ~/.vimrc<CR>
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Quick save
map <F2> :w<cr>
imap <F2> <c-o>:w<cr>

" Tabs mappings
map <Leader>te :tabe %:p:h
map <Leader>tq :tabc<cr>

" I say `no`:
set nowrap
set nowritebackup
set noswapfile
set nobackup

" set backupdir=$HOME/.vim/backups
" set directory=$HOME/.vim/temp

" customize cursor lines
hi CursorLine cterm=none ctermbg=none guibg=Black
hi CursorColumn cterm=NONE ctermbg=NONE guibg=NONE

" File settings
set ffs=dos
set enc=utf-8
set fencs=utf-8

" Formating settings
set cindent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab

" Pleasant Features
set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set wildmenu
set relativenumber
set cursorline
set scrolloff=1 " keep 2 lines off the edges of the screen when scrolling
set hidden

" search and wildmenu
set showmatch
set hlsearch
set incsearch
set ignorecase
set lz
set gdefault

if has("autocmd")
  autocmd VimEnter * set vb t_vb= " Stop beeping and flashing!

  augroup FTDetect "{{{2
    " autocmd BufNewFile,BufRead *.aspx set ft=aspnetcs
    autocmd BufNewFile,BufRead *.vb set ft=vbnet
    autocmd BufNewFile,BufRead *.json set ft=javascript
    autocmd BufNewFile,BufRead *.cshtml,*.aspx,*.ascx,*.Master set ft=html
    autocmd BufNewFile,BufRead *.build, *.oproj set ft=xml
    autocmd BufNewFile,BufRead *.txt,README,INSTALL,TODO if &ft == "" | set ft=text | endif
  augroup END "}}}2

  autocmd FileType xml setlocal foldmethod=syntax

  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType php let php_sql_query=1
  autocmd FileType php let php_htmlInStrings=1
  autocmd FileType php let php_noShortTags=1
endif

let g:wwwsearch_command_to_open_uri="start rundll32 url.dll,FileProtocolHandler {uri}"
let g:vimfiler_as_default_explorer=1

let g:dbext_default_profile_mysql_local = 'type=MYSQL:user=root:passwd=1:extra=-t'

" vdebug
let g:watch_window_style="compact"

let g:ctrlp_max_files = 40000
let g:ctrlp_lazy_update = 1

let g:ackprg="ack -H --nocolor --nogroup --column"
" let g:ackprg = 'nak'

let ropevim_vim_completion=1
let ropevim_extended_complete=1
let ropevim_enable_autoimport=1

let g:phpqa_codesniffer_autorun = 0
let g:phpqa_messdetector_autorun = 0
let g:phpqa_messdetector_ruleset = "~/phpmd.xml"

let g:syntastic_phpcs_conf = " --standard=Zend "

let g:xml_syntax_folding=1
let g:vimprj_changeCurDirIfVimprjFound=0

let g:tagbar_ctags_dir="C:\ctags58"
let $PATH = 'C:\Program Files\nodejs;' . $PATH

set t_Co=256
if !has('gui_running')
	colorscheme eclipse
endif

" autoremove trailing spaces
" autocmd BufWritePre * :%s/\s\+$//e

