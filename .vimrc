"""""""""""""""""""""""""""""""""""
" NeoBundle
"""""""""""""""""""""""""""""""""""
if has('vim_starting')
    set nocompatible               " be iMproved
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle/'))

filetype plugin indent on     " required!

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'jpalardy/vim-slime'

" for ruby syntax
NeoBundle 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_quiet_messages = {'level': 'warnings'}

NeoBundle 'tpope/vim-rails', { 'autoload' : { 'filetypes' : ['haml', 'ruby', 'eruby'] }}
NeoBundleLazy 'alpaca-tc/vim-endwise.git'

NeoBundleLazy 'edsono/vim-matchit', { 'autoload' : {
      \ 'filetypes': 'ruby',
      \ 'mappings' : ['nx', '%'] }}

NeoBundleLazy 'basyura/unite-rails', {
      \ 'depends' : 'Shougo/unite.vim',
      \ 'autoload' : {
      \   'unite_sources' : [
      \     'rails/bundle', 'rails/bundled_gem', 'rails/config',
      \     'rails/controller', 'rails/db', 'rails/destroy', 'rails/features',
      \     'rails/gem', 'rails/gemfile', 'rails/generate', 'rails/git', 'rails/helper',
      \     'rails/heroku', 'rails/initializer', 'rails/javascript', 'rails/lib', 'rails/log',
      \     'rails/mailer', 'rails/model', 'rails/rake', 'rails/route', 'rails/schema', 'rails/spec',
      \     'rails/stylesheet', 'rails/view'
      \   ]
      \ }}

NeoBundleLazy 'alpaca-tc/neorspec.vim', {
      \ 'depends' : ['alpaca-tc/vim-rails', 'tpope/vim-dispatch'],
      \ 'autoload' : {
      \   'commands' : ['RSpec', 'RSpecAll', 'RSpecCurrent', 'RSpecNearest', 'RSpecRetry']
      \ }}

NeoBundleLazy 'alpaca-tc/alpaca_tags', {
      \ 'depends': 'Shougo/vimproc',
      \ 'autoload' : {
      \   'commands': ['TagsUpdate', 'TagsSet', 'TagsBundle']
      \ }}

NeoBundleLazy 'tsukkee/unite-tag', {
      \ 'depends' : ['Shougo/unite.vim'],
      \ 'autoload' : {
      \   'unite_sources' : ['tag', 'tag/file', 'tag/include']
      \ }}

NeoBundle 'alpaca-tc/alpaca_tags'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'bbatsov/rubocop'
NeoBundle 'tpope/vim-endwise'

"""""""""""""""""""""""""""""""""""
" その他
"""""""""""""""""""""""""""""""""""
syntax on

" save key position
autocmd BufWinLeave ?* silent mkview
autocmd BufWinEnter ?* silent loadview

" yank tmp
map <silent> sy :call YanktmpYank()<cr>
map <silent> sp :call YanktmpPaste_p()<cr>
map <silent> sP :call YanktmpPaste_P()<cr>
let g:yanktmp_file = '~/yanktmp'

" backspace対応
set backspace=indent,eol,start

" ソースコード上のメソッド宣言、変数宣言の一覧を表示
set tags=tags

" ポップアップメニューのカラーを設定
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PmenuSbar ctermbg=4

" タブスペースの設定
set shiftwidth=2
set ts=2
set sw=2
set tabstop=2
set expandtab

" シンタックスの色づけ
if &t_Co > 1
    syntax enable
endif

highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL

"新しい行を作ったときに高度な自動インデントを行う
set smartindent

" 検索ハイライト
set hlsearch
highlight Search         term=bold,reverse cterm=bold,reverse gui=bold,reverse
set wrapscan

" ショートカット
map L :nohlsearch <CR>

set number

autocmd BufNewFile,BufRead *.cap          setlocal ft=ruby  fenc=utf-8
