" Maintainer:
"   Arick Vigas
"   iarick.vigasi@gmail.com
"
" Reference: Initially based on Swaroop's CH vimrc
"
" Version:
"   0.1 - November 24, 2016
"
" License: www.opensource.org/licenses/bsd-license.php
"
" Sections:
"   -> VUNDLE
"   -> General
"   -> Status Line
"   -> GUI
"

" Set leader to space
let mapleader="\<Space>"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VUNDLE CONFIGURATION
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

filetype plugin indent on     " обязательно!

Plugin 'flazz/vim-colorschemes'
Plugin 'crucerucalin/peaksea.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'scrooloose/syntastic'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'marijnh/tern_for_vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kshenoy/vim-signature'
Plugin 'ervandew/supertab'
Plugin 'valloric/youcompleteme'
Plugin 'alvan/vim-closetag'
Plugin 'Shougo/vimproc.vim'
Plugin 'quramy/tsuquyomi'
Plugin 'rdnetto/YCM-Generator'

" Syntastic con
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" YouCompleteme
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GENERAL
"
" Use Vim settings, rather then Vi settings
set nocompatible

" Enable syntax highlight
syntax on

" Automatically indent when adding a curly bracket, etc.
set smartindent
set ai " Auto indent

" Tabs to group of 4 spaces ( Python convention )
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

" Fix for typesciprt files
au BufNewFile,BufRead *.ts set filetype=typescript


" Set leader to space
let mapleader="\<Space>"

" NerdTree hotkey
nnoremap <Leader>nt :NERDTree<CR>

" Tsu hotkeys (TypeScript)
nnoremap <Leader>u :TsuImport<CR>

" nnoremap to Leader
nnoremap <Leader>q :q<CR>            " map to quit window

" Ctrl-Space for omnicompletion
imap <c-space> <c-x><c-o>

" Maps for windows
nnoremap <Leader>h <c-w><c-h>       
nnoremap <Leader>j <c-w><c-j>       
nnoremap <Leader>k <c-w><c-k>       
nnoremap <Leader>l <c-w><c-l>       

" Tern key config
let tern_map_keys=1                 " Enable keys
let tern_map_prefix="<Leader>"      " Set prefix to Leader

" Male backspace work like most other apps
set backspace=indent,eol,start

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=999

" Use UTF-8.
set encoding=utf-8

" colorscheme
" colorscheme peaksea
" set background=dark
set background=dark
colorscheme solarized

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off
set nobackup
set nowb
set noswapfile

" Height of the command bar
set cmdheight=2

" Show line number, cursor position.
set ruler

" Show line numbers
set number

" Display incomplete commands.
set showcmd

" To save ctrl-s
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

" Search as you type
set incsearch

" Highlight search
set hlsearch
" Clear highligh on ctrl - L
nnoremap <silent> <C-L> :let @/=""<CR><C-L>

" Ignore case when searching
set ignorecase

" Show autocomplete menus.
set wildmenu

" Show editing mode
set showmode

" Error bells are displayed visually.
set visualbell

" For regular expressions turn magic on
set magic

" how matching brackets when text indicator is over them
set showmatch

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
 set guioptions-=r
 set guioptions-=R
 set guioptions-=l
 set guioptions-=L


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni completions 
set omnifunc=csscomplete#CompleteCSS

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
set laststatus=2
set statusline=\ %F%m%r%h\ %w\ \ \ Line:\ %l\ \ Column:\ %c
" set statusline=
" set statusline+=%f\                             " Path to file
" set statusline+=%h%m%r%w                        " Status flags
" set statusline+=\[%{strlen(&ft)?&ft:'none'}]    " File type
" set statusline+=%=                              " Right align remainder
" set statusline+=0x%-8B                          " Character value
" set statusline+=%-14(%l,%c%V%)                  " line, character
" set statusline+=%<%P                            " File Position

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
"
" Set fonts
if has("mac") || has("macunix")
    set gfn=Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set gfn=Hack:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
    set gfn=Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
    set gfn=Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
    set gfn=Monospace\ 11
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
" "    means that you can undo even when you close a buffer/VIM
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" try
"     set undodir=~/.vim_runtime/temp_dirs/undodir
"         set undofile
"         catch
"         endtry
"
"
" Diff
function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
