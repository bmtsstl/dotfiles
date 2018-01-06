" ----- initialize ------------------------------

" nocompatible
if &compatible
	set nocompatible
endif

" encoding
set termencoding=default
set encoding=utf-8
scriptencoding utf-8

" autocmd
augroup vimrc
	autocmd!
augroup END

" directories
set shellslash
let s:dir_vim      = expand('<sfile>:p:h')
let s:dir_autoload = s:dir_vim.'/autoload'
let s:dir_cache    = s:dir_vim.'/cache'

let s:dir_info   = s:dir_cache
let s:dir_plug   = s:dir_cache.'/plug'
let s:dir_backup = s:dir_cache.'/backup'
let s:dir_swap   = s:dir_cache.'/swap'
let s:dir_undo   = s:dir_cache.'/undo'

" mkdir
function! s:mkdir(dir) abort
	if !isdirectory(a:dir)
		call mkdir(a:dir, 'p', 0700)
	endif
endfunction

call s:mkdir(s:dir_cache)
call s:mkdir(s:dir_autoload)
call s:mkdir(s:dir_plug)
call s:mkdir(s:dir_backup)
call s:mkdir(s:dir_swap)
call s:mkdir(s:dir_undo)

" ----- preferences -----------------------------

" files
execute 'set viminfo+=n'.s:dir_info.'/info'
execute 'set backupdir^='.s:dir_backup
execute 'set directory^='.s:dir_swap
execute 'set undodir^='.s:dir_undo

" gui
set guioptions-=a guioptions-=P guioptions-=A
set guioptions+=c
set guioptions-=e
set guioptions-=i
set guioptions-=m guioptions+=M
set guioptions-=T
set guioptions-=r guioptions-=R
set guioptions-=l guioptions-=L
set guioptions-=b
set guioptions-=F

" file handling
filetype plugin indent on
set fencs-=ucs-bom fencs-=utf-8 fencs^=utf-8 fencs^=ucs-bom
set ffs-=unix ffs^=unix
set autoread

" ui
syntax enable
set number
set tabstop=4
set shiftwidth=4
let g:vim_indent_cont = 4
set pumheight=10
set laststatus=1
set ruler
set cursorline
set wildmenu
set wildchar=<Tab>
set background=dark

" mapping
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ----- plugins ---------------------------------
if isdirectory(s:dir_autoload) && !filereadable(s:dir_autoload.'/plug.vim') && executable('curl')
	silent execute '!curl -fLo '.s:dir_autoload.'/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	redraw!
endif

if isdirectory(s:dir_plug) && filereadable(s:dir_autoload.'/plug.vim') && executable('git')
	" initialize
	call plug#begin(s:dir_plug)
		Plug 'ctrlpvim/ctrlp.vim'
		Plug 'cocopon/vaffle.vim'
		Plug 'tpope/vim-fugitive'
		Plug 'prabirshrestha/asyncomplete.vim'
		Plug 'yami-beta/asyncomplete-omni.vim'
		if has('unix') && executable('sudo') | Plug 'vim-scripts/sudo.vim'         | endif
		if executable('go')                  | Plug 'fatih/vim-go', { 'tag': '*' } | endif
		if has('gui_running')                | Plug 'w0ng/vim-hybrid'              | endif
	call plug#end()

	" functions
	function! s:plugged(name)
		return has_key(g:plugs, a:name)
	endfunction
	function! s:installed(name)
		return has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name]['dir'])
	endfunction

	if s:plugged('ctrlp.vim')
		let g:ctrlp_types = ['fil']
		let g:ctrlp_extensions = ['dir']
	endif

	if s:plugged('vaffle.vim')
		let g:vaffle_force_delete = 1
		let g:vaffle_show_hidden_files = 1
	endif

	if s:plugged('asyncomplete.vim')
		inoremap <expr> <tab> pumvisible() ? "\<C-n>" : "\<Tab>"
		inoremap <expr> <s-tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
		inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
		set completeopt-=preview
	endif

	if s:installed('asyncomplete-omni.vim')
		call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
			\ 'name': 'omni',
			\ 'whitelist': ['*'],
			\ 'blacklist': ['html'],
			\ 'completor': function('asyncomplete#sources#omni#completor')
			\  }))
	endif

	if s:plugged('vim-go')
		let g:go_fmt_autosave = 0
		let g:go_metalinter_autosave = 0
		autocmd vimrc bufwritepost *.go GoImports
		autocmd vimrc bufwritepost *.go GoVet
		autocmd vimrc bufwritepost *.go GoBuild
	endif

	if s:installed('vim-hybrid')
		colorscheme hybrid
	endif
endif

" --- local -------------------------------------
if filereadable(s:dir_vim.'/vimrc.local')
	execute 'source '.s:dir_vim.'/vimrc.local'
endif
