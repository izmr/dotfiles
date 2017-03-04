" setting pathogen.vim
call pathogen#infect()
syntax enable
filetype plugin indent on

" タブスペースの設定
set shiftwidth=4
set ts=4
set sw=4
set tabstop=4
set expandtab

if &t_Co > 1
  syntax enable
endif

"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"検索をファイルの先頭へループしない
"set nowrapscan
" 検索ハイライト
set hlsearch
highlight Search         term=bold,reverse cterm=bold,reverse gui=bold,reverse
map L :nohlsearch <CR>

" tファイルをハイライト
autocmd BufNewFile,BufRead *.t      set filetype=perl

"行番号を表示する
set number

" 改行コードの自動認識
"set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif
