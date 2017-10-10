""general
set nocompatible                " choose no compatibility with legacy vi
syntax on                       " enable syntax highlighting
colorscheme koehler             " use this if bandit is not installed
set modeline                    " apply vim settings embedded in file being edited
set visualbell                  " disable audiobell, use screen flash instead

""programming
set number                      " line numbering on left side of screen
set ruler
set showcmd
filetype plugin indent on       " load file type plugins + indentation

""cursor highlighting
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
highlight CursorLine cterm=None ctermbg=darkred ctermfg=white
highlight CursorColumn cterm=None ctermbg=darkred ctermfg=white

""whitespace
set nowrap
set tabstop=4 shiftwidth=4      " a tab is four spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

""searching
set hlsearch                    " search highlighting
set incsearch                   " enable incremental search highlighting
set ignorecase                  " searches are case insensitive
set smartcase                   " ... unless they contain at least one capital letter

""status line
set laststatus=2                " 2nd from bottom, display status line
set statusline=%F\ (line:\ %l,col:\ %c/%v)

""directory navigation
set autochdir

fun! <SID>StripTrailingWhitespace()
    let l = line(".")
    let c = col(".")
    %s/\v\s+$//e
    call cursor(l, c)
endfun

if has("autocmd")
    "makefiles need real tabs
    au FileType make setlocal noexpandtab

    "python PEP8
    au FileType pyx,py setlocal softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
    au FileType python au BufWrite <buffer> :call <SID>StripTrailingWhitespace()

    "c/c++
    au FileType c,h,cpp,hpp setlocal noexpandtab cindent cino=}1s,g0
endif

"netrw file/directory sort order
let g:netrw_sort_sequence="[\/]$,*"

""disable arrow keys
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

