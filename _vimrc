source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

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
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"color
colorscheme gruvbox

"let
let g:airline_powerline_fonts = 1
let wiki_1 = {}
let wiki_1.path = '$HOME/Dropbox/Dokumente/Wiki'
let wiki_1.index = 'PersonalWiki'
let g:vimwiki_list = [wiki_1]

"pathogen plugin loader
execute pathogen#infect()

"settings:
set nu
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar
set vb
set laststatus=2
set nocompatible
set syntax=on
set encoding=utf-8
set guifont=Meslo\ LG\ L\ DZ\ for\ Powerline:h10
set tw=80 "restrict text width to 80 characters

"filetypes
:filetype plugin on
"let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
"let g:pandoc#filetypes#pandoc_markdown = 0

"mapping
let mapleader = ","


