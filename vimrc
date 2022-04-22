source $VIMRUNTIME/vimrc_example.vim
syntax on
 set backspace=indent,eol,start
 set bg=dark
 set relativenumber
 set number
 filetype indent plugin on
 set path+=**
 set wildmenu
 set history=600
 set showcmd
 set rtp+=/usr/lib/python3.9/site-packages/powerline/bindings/vim/
 set laststatus=2
 set t_Co=256
 set nocp
 set tabstop=2 softtabstop=2
 set shiftwidth=2
 set expandtab smartindent
 set autoindent
 set nohlsearch
 set hidden
 set noerrorbells
 set nowrap
 set incsearch
 set scrolloff=5
 set signcolumn=yes
 set ruler
 set spell spelllang=pl,en_us
 set splitbelow

autocmd FileType netrw setl bufhidden=delete " or use :qa!
nnoremap ,sh :-1read $HOME/.vim/sh<CR>1j"read file and add to open file
nnoremap ,perl :-1read $HOME/.vim/perl.pl<CR>6j"read file and add to open file
nnoremap 8 :let @/ = ""<CR>"clean hilight from search
"CTRL+J nowa linia, lamanie lini.
nnoremap <NL> i<CR><ESC>

"netrw
let g:netrw_liststyle = 3 "tree style
let g:netrw_browse_split = 4 "Browse in previous window
let g:netrw_altv = 0 "
let g:netrw_winsize = 20 "Size of netrw window
let g:netrw_keepdir = 0

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

