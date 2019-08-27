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

"load partial
nnoremap <silent> <F7> :call EventInit()<CR>
function EventInit()
    execute '1s/.*/<?php/'
    call append(1, "require_once(__DIR__ . '/init.php');")
    call append(2, "?><!DOCTYPE html>")
    let sline = search("<link")
    call append(sline - 1, "<?= $view->partial('fbmeta.phtml', $view) ?>")
    let titletag = search('<title>')
    execute titletag . 's/\>.*\</><?= $eventTitle ?><\/'

    let sline = search("main.js")
    call append(sline, "<?= $view->partial('head.phtml', $view) ?>")
    let sline = search("<body")
    call append(sline, "<?= $view->partial('fbroot.phtml', $view) ?>")
    call append(sline + 1, "<?= $view->partial('header.phtml', $view) ?>")
    let sline = search("</body>")
    call append(sline - 1, "<?= $view->partial('ga.phtml', $view) ?>")
endfunction

"set time
nnoremap <silent> <F2> :call SetTime()<CR>
function SetTime()
    execute '1s/.*/<?php/'
    call append(1, "$time=microtime(true);")
    call append(2, "$time=microtime(true)-$time;")
    call append(3, 'echo "費時:$time";')
endfunction
