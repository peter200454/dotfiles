let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo 'Installing Vundle ...'
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/Vundle.vim
endif
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"vim plugin
Plugin 'Townk/vim-autoclose'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'tmhedberg/matchit'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bronson/vim-trailing-whitespace'

call vundle#end()

syntax on
set t_Co=256
set encoding=utf8
set fileencoding=utf8
set fileencodings=utf8,cp950,latin1
set hls
set nu
set ru
set secure
set expandtab
set sw=4
set softtabstop=4
set termencoding=utf8
set background=dark
set modeline
set incsearch
set autoindent
set smartindent
set filetype=html
set smartindent
set showmatch
set clipboard=unnamed

filetype indent on
filetype plugin indent on

"set syntastic init
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" :SyntasticCheck phpmd
let g:syntastic_aggregate_errors = 1
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']

"set time
nnoremap <silent> <F2> :call SetTime()<CR>
function SetTime()
    execute '1s/.*/<?php/'
    call append(1, "$time=microtime(true);")
    call append(2, "$time=microtime(true)-$time;")
    call append(3, 'echo "費時:$time";')
endfunction
