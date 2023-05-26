source $VIMRUNTIME/vimrc_example.vim
syntax on
set backspace=indent,eol,start
filetype indent plugin on
set hidden
set noerrorbells
set nowrap
set scrolloff=5
set nocp
set encoding=utf-8

"new splits
set splitbelow

"Colors
set bg=dark
set t_Co=256

"set lines number and relnumber
set relativenumber
set number

"Set fuzzy find like
set path+=**

"wildmeny and status line like
set wildmenu
set showcmd
set showmode
set laststatus=2
set ruler

"history size
set history=1600

"powerline
set rtp+=/usr/lib/python3.11/site-packages/powerline/bindings/vim/

"Tabs and indent
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab smartindent
set autoindent

"Displeying tabs and trails
exec "set listchars=tab:>-,trail:\uB7"
set list

"search
set nohlsearch
set incsearch

"empty column left from line numbers.
set signcolumn=yes
set spelllang=pl,en_us

"highlight 81 col.
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" or use :qa!
autocmd FileType netrw setl bufhidden=delete
"read file and add to open file
nnoremap ,sh :-1read $HOME/.vim/sh<CR>1j
"read file and add to open file
nnoremap ,perl :-1read $HOME/.vim/perl.pl<CR>6j
"read file and add to open file
nnoremap ,py :-1read $HOME/.vim/python.py<CR>2j
"clean hilight from search
nnoremap 8 :let @/ = ""<CR>
"CTRL+J nowa linia, lamanie lini.
nnoremap <NL> i<CR><ESC>

"automatic compliting
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

"netrw settings with comment
"tree style
let g:netrw_liststyle = 3
"Browse in previous window
let g:netrw_browse_split = 4
"to work properly open vim with +Vex
let g:netrw_altv = 0
"Size of netrw window
let g:netrw_winsize = 20
"0 = browing dir = current dir
let g:netrw_keepdir = 0
"Open previu in Vertical
let g:netrw_preview = 1

"gui
set guifont=courier:h10
colors desert
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

