set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'VundleVim/Vundle.vim.git'

" Fun
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/Colour-Sampler-Pack.git'

Plugin 'gitv'
Plugin 'fugitive.vim'

" project
Plugin 'tpope/vim-vinegar.git'
Plugin 'ctrlp.vim'
Plugin 'mileszs/ack.vim.git'
Plugin 'yuratomo/w3m.vim.git'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-dispatch.git'

" quick motion && edit
Plugin 'unimpaired.vim'
Plugin 'delimitMate.vim'
Plugin 'surround.vim'
Plugin 'repeat.vim'
Plugin 'matchit.zip'
Plugin 'tomtom/tcomment_vim.git'
Plugin 'SirVer/ultisnips.git'
Plugin 'honza/vim-snippets'
Plugin 'mattn/emmet-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'neomake/neomake'

" Code tools
" Plugin 'Syntastic'
Plugin 'Chiel92/vim-autoformat'

" Plugin 'xuhdev/SingleCompile'
" Plugin 'cscope.vim'
" Plugin 'https://github.com/sontek/rope-vim.git'
" Plugin 'unite.vim'
" Plugin 'neocomplcache'
" Plugin 'Shougo/vimproc.vim'
" Plugin 'dsawardekar/portkey.git'
" Plugin 'DfrankUtil'
" Plugin 'vimprj'
" Plugin 'Tagbar'
" Plugin 'EasyMotion'
" Plugin 'indexer.tar.gz'
" Plugin 'dbext.vim'
"
" Plugin 'ruby.vim'
" Plugin 'ftpluginruby.vim'
" Plugin 'ruby-matchit'
" Plugin 'tpope/vim-rails'

" Python

" Php bundles
"" Bundle 'phpcomplete.vim'
"" Bundle 'phpfolding.vim'
" Plugin 'techlivezheng/tagbar-phpctags.git'
" Plugin 'shawncplus/phpcomplete.vim.git'
" Plugin 'joonty/vim-phpqa.git'
" Plugin '2072/PHP-Indenting-for-VIm.git'
" Plugin 'marijnh/tern_for_vim.git'



" .NET world
if has("win32") || has("win16") || has("win64")
    Plugin 'aspnetide.vim'
else
    Plugin 'vim-scripts/gmcs.vim.git'
end
Plugin 'csharp.vim'
Plugin 'cs.vim'
Plugin 'ASPJScript'
Plugin 'aspnet.vim'
Plugin 'aspnetcs'
Plugin 'adamclerk/vim-razor.git'

" https://github.com/nosami/Omnisharp

" html
Plugin 'othree/html5.vim'
Plugin 'mustache/vim-mustache-handlebars'

" js
Plugin 'isRuslan/vim-es6'
Plugin 'Enhanced-Javascript-syntax'
Plugin 'jason0x43/vim-js-indent'
Plugin 'https://github.com/leafgarland/typescript-vim'
Plugin 'dsawardekar/ember.vim'
Plugin 'Quramy/tsuquyomi'

" Css
" Bundle 'csslint.vim'
Plugin 'hail2u/vim-css3-syntax.git'
Plugin 'skammer/vim-css-color.git'
Plugin 'ChrisYip/Better-CSS-Syntax-for-Vim.git'
Plugin 'groenewege/vim-less.git'

call vundle#end()

filetype plugin indent on
syntax on

" let g:tagbar_type_markdown = {
"     \ 'ctagstype' : 'markdown',
"     \ 'kinds' : [
"         \ 'h:Heading_L1',
"         \ 'i:Heading_L2',
"         \ 'k:Heading_L3'
"     \ ]
" \ }

" let g:vdebug_keymap = {
" \    "run" : "<F5>",
" \    "run_to_cursor" : "<Leader>dc",
" \    "step_over" : "<Leader>dn",
" \    "step_into" : "<Leader>di",
" \    "step_out" : "<Leader>do",
" \    "close" : "<F6>",
" \    "detach" : "<F7>",
" \    "set_breakpoint" : "<Leader>db",
" \    "get_context" : "<Leader>dg",
" \}

" nmap <Leader>e :VimFiler<CR>
" nmap <Leader>es :VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>
" nmap <Leader>ef :VimFilerBufferDir -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>
nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader>t :Unite tab<CR>
" nmap <Leader>o :TagbarToggle<CR>

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


map <Leader>nc :call RandomColorScheme()<cr>

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
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set wildmenu
set relativenumber
set number
set cursorline
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
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType php let php_sql_query=1
autocmd FileType php let php_htmlInStrings=1
autocmd FileType php let php_noShortTags=1

autocmd! BufWritePost,BufEnter * Neomake

" let g:vimfiler_as_default_explorer=1

" let g:dbext_default_profile_mysql_local = 'type=MYSQL:user=root:passwd=1:extra=-t'
let g:dbext_default_profile_postgres_local = 'type=PGSQL:user=postgres:passwd=1:extra=-t'
let g:dbext_eventbox_profile_postgres_local = 'type=PGSQL:dbname=eventbox:user=eventbox:passwd=1:port=5432:extra=-t'

" vdebug
let g:watch_window_style="compact"

let g:ctrlp_max_files = 40000
let g:ctrlp_lazy_update = 1

let g:ackprg="ack-grep -H --nocolor --nogroup --column"

let ropevim_vim_completion=1
let ropevim_extended_complete=1
let ropevim_enable_autoimport=1

let g:phpqa_codesniffer_autorun = 0
let g:phpqa_messdetector_autorun = 0
let g:phpqa_messdetector_ruleset = "~/phpmd.xml"

let g:syntastic_phpcs_conf = " --standard=Zend "

let g:xml_syntax_folding=1
let g:vimprj_changeCurDirIfVimprjFound=0

let g:syntastic_javascript_checkers = ['eslint']

set t_Co=256
" set tags+=~/.rvm/gems/ruby-2.1.1/gems/tags
" colorscheme vividchalk

if has('gui_running')
    colorscheme intelij
    " molokai freya silent
else
    " colorscheme desert
    colorscheme navajo
    colorscheme Mustang
    colorscheme molokai
    colorscheme jellybeans
    let g:airline_theme='understated'
endif

function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

function RandomColorScheme()
    let mycolors = split(globpath(&rtp,"**/colors/*.vim"),"\n")
    exe 'so ' . mycolors[localtime() % len(mycolors)]
    unlet mycolors
endfunction

