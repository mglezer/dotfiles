set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Solarized plugin for colorscheme
Plugin 'git://github.com/altercation/vim-colors-solarized.git'
Plugin 'git://github.com/kien/ctrlp.vim.git'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'airblade/vim-gitgutter'
Plugin 'git://github.com/terryma/vim-multiple-cursors.git'
Plugin 'junegunn/vim-easy-align'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Put your non-Plugin stuff after this line

syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

:set incsearch
:set hlsearch

:set number
highlight clear SignColumn "set the git gutter to be the same color as the line number column

:set ic "case insensitive searches

"enable tab autocompletion
set wildmode=longest,list,full
set wildmenu

" opens search results in a window w/ links and highlight the matches
command! -nargs=+ Grep execute 'silent grep! -I -r -n --exclude *.{json,pyc} . -e <args>' | copen | execute 'silent /<args>'
" shift-control-* Greps for the word under the cursor
:nmap <leader>g :Grep <c-r>=expand("<cword>")<cr><cr>

let mapleader=","
let g:ctrlp_match_window = 'results:100' " overcome limit imposed by max height in ctrlp
"

let g:gitgutter_realtime=750

" The Silver Searcher
if executable('ag')
  " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)
