"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL SECTION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set UFT-8 encoding
set enc=utf-8
set fenc=utf-8
set tenc=utf-8
try
    lang es_MX
catch
endtry

" disable vi compatibility
set nocompatible
set ignorecase
set incsearch
set nobackup
set history=700
set autoread " Set to auto read when a file is changed from the outside
highlight BadWhitespace ctermbg=red guibg=red
"If I type /The it searchs "The", if I type /the it searchs "The, the, etc"
set smartcase
"determines the minimum number of screen lines that you would like above and
"below the cursor.
set scrolloff=7
set wildmenu "Turn on WiLd menu
set wildmode=longest:full
set hid "Change buffer - without saving
set cmdheight=2 "The commandbar height
" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set nolazyredraw "Don't redraw while executing macros 
set magic "Set magic on, for regular expressions
set mat=2 "How many tenths of a second to blink
" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
syntax enable "Enable syntax hl
" Set font according to system
set gfn=Monospace\ 10
set shell=/bin/bash

if has("gui_running")
  set guioptions-=T
  set t_Co=256
  set background=dark
  colorscheme mustang
  set nonu
else
  colorscheme wombat
  set background=dark

  set nonu
endif
set wrap "Wrapped display
set formatoptions-=t "ensure no wrap around using textwidth
set textwidth=80 " (tw) number of columns before an automatic line break is inserted
set expandtab " expand tabs to spaces
set shiftwidth=4 " indentation step
set softtabstop=4 " TAB key step
set tabstop=4 " width of TAB character
set autoindent
set cindent
set smartindent
set number
set ruler "show the current row and column at the bottom right of the screen
set showcmd " Show (partial) command in status line
set autochdir "Auto change directory to last open file
set linebreak " (lbr) wrap long lines at a space instead of in the middle of a word
set nolist " Remove no to show spaces and End Of Line
set shiftround " Shift to the next round tab stop
set noerrorbells
set showmatch
set hlsearch " hls:  highlight search patterns

" enable filetype detection:
filetype on
filetype plugin on
filetype indent on
autocmd FileType make set noexpandtab shiftwidth=8
set ofu=syntaxcomplete#Complete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C SECTION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au BufRead,BufNewFile *.c,*.cc,*.cpp,*.h set autoindent " use indentation of previous line
au BufRead,BufNewFile *.c,*.cc,*.cpp,*.h set cindent " use C/C++ indentation

au BufRead,BufNewFile *.c,*.cc,*.cpp,*.h set expandtab " expand tabs to spaces
au BufRead,BufNewFile *.c,*.cc,*.cpp,*.h set tabstop=4 " tab width is 4 spaces
au BufRead,BufNewFile *.c,*.cc,*.cpp,*.h set shiftwidth=4 " indent also with 4 spaces

au BufRead,BufNewFile *.c,*.cc,*.cpp,*.h syntax on

au BufRead,BufNewFile *.c,*.cc,*.cpp,*.h set foldmethod=syntax

" set intelligent comments
au BufRead,BufNewFile *.c,*.cc,*.cpp,*.h set comments=sl:/*,mb:\ *,elx:\ */

" display tabs at the beginning of a line as bad
au BufRead,BufNewFile *.c,*.cc,*.cpp,*.h match BadWhitespace /^\t\+/
" make set grepprg=grep\ -nH\ $*
" trailing whitespace be flagged as bad
au BufRead,BufNewFile *.c,*.cc,*.cpp,*.h match BadWhitespace /\s\+$/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Latex SECTION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
set iskeyword+=:

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spellchecking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if v:version >= 700
    "Sets in-line spellchecking
    set spell
 
    " Set local language 
    "setlocal spell spelllang=en_us
    setlocal spell spelllang=es
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F8> :set invpaste paste?<CR>
set pastetoggle=<F8>
set showmode

set tags+=~/.vim/tags/cpp
" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
nnoremap <F5> :make<CR>

" Set NERDTree
map <F3> :NERDTreeToggle<CR>

" Compile latex with F2
map <silent> <F2> :!latexmk -pdf -pv % 2>/dev/null<CR><CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

