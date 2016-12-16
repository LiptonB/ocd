""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc file
"
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'wincent/command-t'
Plugin 'Valloric/YouCompleteMe'
Plugin 'hynek/vim-python-pep8-indent'
call vundle#end()

let mapleader = ","

" ,v opens .vimrc
map <leader>v :tabe ~/.vimrc<CR>
" ,V reloads .vimrc.
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo '~/.vimrc reloaded.'"<CR>

" For when you forget to use sudo to edit a file.
cmap w!! w !sudo tee % >/dev/null

"
" so I can paste with the mouse (hit F2 to toggle)
set pastetoggle=<F2>
"
" auto backups
"set backup
" backup file name extension
"set backupext=.foo
"
" reasonable backspace
set backspace=2
"
" have fifty lines of command-line (etc) history:
set history=50

" bunch of useful options from http://stevelosh.com/blog/2010/09/coming-home-to-vim
set encoding=utf-8
set scrolloff=5
set hidden
set title
set wildmenu
set wildmode=list:longest
" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc

set ttyfast
set ruler
set laststatus=2
set report=0  " : commands always print changed line count.
set shortmess+=a  " Use [+]/[RO]/[w] for modified/readonly/written.
set vb
set t_vb=  " Disable all bells. No ringing or flashing.
set confirm  " Y-N-C prompt if closing with unsaved changes.
if version >= 730
    set relativenumber
    set undofile
endif

set nostartofline  " Avoid moving cursor to BOL when jumping around.
set virtualedit=block  " Let cursor move past the last char in <C-v> mode.
set showmatch  " Briefly jump to a paren once it's balanced.
set matchtime=2  " (for only .2 seconds).
set matchpairs+=<:>  " Show matching <> (html mainly) as well.

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd
"
" use indents of 4 spaces, and have them copied down lines:
set shiftwidth=2
set tabstop=2
set softtabstop=2
set shiftround
set expandtab
set autoindent

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase
set nohlsearch
set incsearch

" Insert completion. Don't select first item, follow typing in autocomplete.
set completeopt=menuone,longest,preview
set pumheight=6  " Keep a small completion window

set norelativenumber

" Displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
"set list
nmap <C-L><C-L> :set invlist<CR>
"
" enable filetype detection:
filetype on
filetype indent on
filetype plugin on
syntax on
"
" in human-language files, automatically format everything at 72 chars:
autocmd FileType mail,human set formatoptions+=t textwidth=72

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent

" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro
"
" for Perl programming, have things in braces indenting themselves:
autocmd FileType perl set smartindent

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

" for both CSS and HTML, use genuine tab characters for indentation, to make
" files a few bytes smaller:
autocmd FileType html,css set noexpandtab tabstop=2

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8

autocmd FileType rst,tex set textwidth=80 cc=+1

" ctrl-jklm to navigate split windows.
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

nnoremap j gj
nnoremap k gk

" nnoremap <Leader>t :CommandT<CR>
nnoremap <Leader>e :tabnew<CR>
nnoremap <Leader>n :tabnext<CR>
nnoremap <Leader>p :tabp<CR>
set guifont=Inconsolata\ Medium\ 10

" Toggle line numbers.
nmap <C-N><C-N> :set invnumber <CR>

" Highlight extra whitespace at the end of lines. 
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

""" Local configuration.

if filereadable(expand("~/.vimrc-local"))
    source ~/.vimrc-local
endif
