set encoding=utf-8

" nocompatible - break away from old vi compatibility
set nocp

" syntax highlighting
syntax on

" make backspace work like most other apps
set bs=indent,eol,start

" Turn off cursro blinking
set gcr=n:blinkon0

" line numbers
set number

" Set tab indentation for 2 columns instead of default 4
set smartindent
set softtabstop=2 " Sets the number of columns for a TAB.
set shiftwidth=2  " shift >> << by two spaces
set tabstop=2     " The width of a TAB \t is set to 4.
set expandtab     " Expand TABs to spaces.
filetype plugin indent on

" Split vertically to right
set splitright

" ignore case while search
set ic

" ; instead of : - :w -> ;w. saves milliseconds on each operation
nnoremap ; :

" text improvements
set nowrap
autocmd BufWritePre * :%s/\s\+$//e
