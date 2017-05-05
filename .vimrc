set nocompatible              " be iMproved, required

" Configuration options for vim-ros
let g:ros_use_python_version=2
let g:ros_catkin_make_options="-DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so"


" ~~~ Vundle packages ~~~
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Tagbar
Plugin 'Tagbar'
"Plugin 'Conque-Shell'
Plugin 'vim-scripts/Conque-GDB'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'taketwo/vim-ros'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'bogado/file-line'
Plugin 'ivanov/vim-ipython'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Update the swap file every 2s to avoid crashes.
set updatetime=200

" Color scheme using solarized
set background=dark
colorscheme solarized

" Show the status line even when only one buffer is displayed.
set laststatus=2

" Recursively search for a Makefile in parent directories when using the :make
" command.
set makeprg=makeDirTemp=$(pwd);\ while\ [\ -d\ \"$makeDirTemp\"\ -a\ !\ -e\ \"$makeDirTemp/Makefile\"\ ];\ do\ makeDirTemp=${makeDirTemp\\\%/*};\ done;\ if\ [\ -e\ \"$makeDirTemp/Makefile\"\ ];\ then\ makeCmdTemp=\"make\ -C\ $makeDirTemp\";\ else\ makeCmdTemp=\'echo\ \"No\ Makefile\ found\ !\"\';\ fi;\ eval\ $makeCmdTemp

" When switching to a buffer, reuse any open window pointing to this buffer or
" split the current buffer.
set switchbuf=useopen,split

set spell spelllang=en_gb

nnoremap <silent> <F8> :TagbarOpen j<CR>
"autocmd BufEnter * nested :call tagbar#autoopen(1)

" YouCompleteMe shortcuts and configuration
nnoremap <leader>ti :YcmCompleter GoTo<CR>
nnoremap <leader>fi :YcmCompleter FixIt<CR>

let g:ycm_add_preview_to_completeopt = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_always_populate_location_list = 1

" ctags for C/C++ files
"-%autocmd BufEnter *.c,*.cpp,*.h silent! !ctags -R &
"-%autocmd BufWritePost *.c,*.cpp,*.h silent! !ctags -R &

" Enable the mouse
set mouse=a
set ttymouse=urxvt

" More basic stuff
syntax on
set number
set hidden

" Default encoding
set encoding=utf-8
set fileencoding=utf-8

" Reasonable tab configuration
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

autocmd FileType make setlocal noexpandtab
autocmd FileType markdown setlocal noexpandtab

" Easy buffer switching
" http://vim.wikia.com/wiki/Easier_buffer_switching
function! BufSel(pattern)
  let bufcount = bufnr("$")
  let currbufnr = 1
  let nummatches = 0
  let firstmatchingbufnr = 0
  while currbufnr <= bufcount
    if(bufexists(currbufnr))
      let currbufname = bufname(currbufnr)
      if(match(currbufname, a:pattern) > -1)
        echo currbufnr . ": ". bufname(currbufnr)
        let nummatches += 1
        let firstmatchingbufnr = currbufnr
      endif
    endif
    let currbufnr = currbufnr + 1
  endwhile
  if(nummatches == 1)
    execute ":buffer ". firstmatchingbufnr
  elseif(nummatches > 1)
    let desiredbufnr = input("Enter buffer number: ")
    if(strlen(desiredbufnr) != 0)
      execute ":buffer ". desiredbufnr
    endif
  else
    echo "No matching buffers"
  endif
endfunction

"Bind the BufSel() function to a user-command
command! -nargs=1 Bs :call BufSel("<args>")

""
"" mapping du clavier bépo->qwerty en mode normal
""

""
"" mapping du clavier bépo->qwerty en mode normal
""
 
" configuration des lettres
 
noremap b q
noremap é w
noremap p e
noremap o r
noremap è t
noremap ^ y
noremap v u
noremap d i
noremap l o
noremap j p
noremap z [
noremap w ]
noremap a a
noremap u s
noremap i d
noremap e f
noremap \ \
noremap g ,
noremap c h
noremap t j
noremap s k
noremap r l
noremap n ;
noremap m '
noremap ê <
noremap à z
noremap àà zz
noremap y x
noremap x c
noremap . v
noremap k b
noremap ' n
noremap q m
noremap g ,
noremap , g
noremap ,, gg
noremap h .
noremap f /
noremap B Q
noremap É W
noremap P E
noremap O R
noremap È T
noremap ! Y
noremap V U
noremap D I
noremap L O
noremap J P
noremap Z {
noremap W }
noremap A A
noremap U S
noremap I D
noremap E F
noremap ; G
noremap C H
noremap T J
noremap S K
noremap R L
noremap N :
noremap M "
noremap Ç \|
noremap Ê >
noremap À Z
noremap ÀÀ ZZ
noremap Y X
noremap X C
noremap : V
noremap K B
noremap ? N
noremap Q M
noremap G <
noremap H >
noremap F ?
 
" configuration du copié sur le ç car y est sur la touche composé ^
 
noremap ç y
 
" configuration des nombres
 
noremap $ `
noremap " 1
noremap « 2
noremap » 3
noremap ( 4
noremap ) 5
noremap @ 6
noremap + 7
noremap - 8
noremap / 9
noremap * 0
noremap = -
noremap % =
noremap # ~
noremap 1 !
noremap 2 @
noremap 3 #
noremap 4 $
noremap 5 %
noremap 6 ^
noremap 7 &
noremap 8 *
noremap 9 (
noremap 0 )
noremap ° _
noremap ` +

if has("autocmd")
augroup netrw_dvorak_fix
    autocmd!
    autocmd FileType netrw call Fix_netrw_maps_for_dvorak()
augroup END
function! Fix_netrw_maps_for_dvorak()
    noremap <buffer> t j
    noremap <buffer> s k
    noremap <buffer> k s
endfunction
endif

