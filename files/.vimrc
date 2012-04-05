""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc file
"
call pathogen#infect()
call pathogen#helptags()
let mapleader = ","
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
" no autowrap of lines
set wrapmargin=0
"
" have fifty lines of command-line (etc) history:
set history=50
"
" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full
"
" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd
"
" use indents of 4 spaces, and have them copied down lines:
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set expandtab
set autoindent
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

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase
set nohlsearch
set incsearch

" use <F6> to cycle through split windows (and <Shift>+<F6> to cycle backwards,
" where possible):
nnoremap <F6> <C-W>w
nnoremap <S-F6> <C-W>W

" python run with F9
map <f9> :w<CR>:!python %<CR>

" nnoremap <Leader>t :CommandT<CR>
nnoremap <Leader>e :tabnew<CR>
nnoremap <Leader>n :tabnext<CR>
nnoremap <Leader>p :tabp<CR>
set guifont=Inconsolata\ Medium\ 10

