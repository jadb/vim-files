" Disable Vi compatibility
set nocompatible

" Include pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" GUI configuration {{{

if has('gui_running')
  " Custom font
  set guifont=Source\ Code\ Pro:h13
  " Disable toolbar.
  set guioptions=-T
endif

" }}}

" IDE configuration {{{

" Define leader
let mapleader=','

" Enable syntax highlighting
syntax enable

" Enable mouse.
set mouse=a
set mousehide

" Color scheme.
set background=dark
colorscheme solarized

" Set character encoding
set encoding=utf-8

" Show line numbers and rulers
set number
set ruler

" Use 256 colors
set t_Co=256

" Whitespace
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list listchars=tab:▸\ ,eol:¬,trail:·
set noeol
set autoindent

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Abbrev. of messages (avoids 'hit enter')
set shortmess+=filmnrxoOtT

" Window settings.
set wrap
set lbr
set textwidth=0
set cursorline
set splitright
set splitbelow

" Don't redraw when macros are executing.
set lazyredraw

" Use modeline overrides
set modeline
set modelines=10

" Status bar.
set laststatus=2

" Use the system clipbard
set clipboard=unnamed

" Tab completion for files and other command line features.
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=.git,node_modules/,vendor/gems/

" Spell checking, configure and turn off.
set spell spelllang=en_ca
set nospell

" Disable swap files (generally things are in VCS).
set noswapfile

" Disable file backups.
set nobackup
set nowritebackup

" Persistent undos
if !&diff
  set undodir=~/.vim/backup
  set undofile
endif

" }}}

" Search configuration {{{

set hlsearch
set incsearch
set ignorecase
set smartcase
set gdefault
nnoremap / /\v
vnoremap / /\v
set grepprg=ack\ --column
set grepformat=%f:%l:%c:%m

" Clear search highlighting.
map <Leader><Space> :nohl<CR>

" }}}

" Autocommands {{{

" Save on blur
au FocusLost * :wa
au CursorHold,CursorHoldI * silent! wa

" Remember cursor location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
   \| exe "normal g'\"" | endif
endif

" Force markdown, see http://github.com/tpope/vim-markdown
au BufNewFile,BufReadPost *.md set filetype=markdown

" }}}

" Keybindings {{{

" Inserts the path of current buffer into a command
" Command mode: CTRL+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Remap j/k for long lines
nmap j gj
nmap k gk

" Remaps split window j/k/h/l
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Adjusts viewports/splits to same size
map <Leader>= <C-w>=
imap <Leader>= <Esc> <C-w>=

" }}}

" Filetypes {{{

" Enable indentation by plugins.
filetype plugin indent on

" Makefile uses real tabs.
au FileType make setl noexpandtab

" Consider all these ruby files.
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,Vagrantfile} set ft=ruby

" Consider all these as javascript files.
au BufRead,BufNewFile {*.json,*.es6} set ft=javascript

" PHP
au FileType php setl softtabstop=4 shiftwidth=4 tabstop=4 expandtab colorcolumn=120 textwidth=120

" Javascript
au FileType javascript setl softtabstop=2 shiftwidth=2 tabstop=2 expandtab colorcolumn=120 textwidth=120

" Coffeescript
au FileType coffee setl softtabstop=2 shiftwidth=2 tabstop=2 expandtab colorcolumn=80 textwidth=80

" Ruby, SCSS, SASS.
au FileType {eruby,ruby,sass,scss} setl softtabstop=2 shiftwidth=2 tabstop=2 expandtab colorcolumn=80

" }}}

" Plugins {{{

" CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
	\ 'dir': '\.git$' }
if (has('win16') || has('win32') || has('win64'))
	let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
elseif executable('ag')
	let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
elseif executable('ack-grep')
	let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
elseif executable('ack')
	let s:ctrlp_fallback = 'ack %s --nocolor -f'
else
	let s:ctrlp_fallback = 'find %s -type f'
endif

" NERDTree
let NERDTreeIgnore=['\~$']
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
map <C-e> :NERDTreeToggle<CR>

" }}}

