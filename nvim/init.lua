-- dein ------------------------------------- 
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/bin/python'

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim' . shellescape(s:dein_repo_dir))
endif

let s:toml_dir = fnamemodify(expand('<sfile>'), ':h') . '/toml'
let s:toml = s:toml_dir . '/.dein.toml'
let s:toml_lazy = s:toml_dir . '/.dein_lazy.toml'

" runtimepathにdeinを追加
let &runtimepath = s:dein_repo_dir . ',' . &runtimepath

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  " Let dein manage dein
  call dein#load_toml(s:toml, {'lazy':0})
  call dein#load_toml(s:toml_lazy, {'lazy':1})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
-- End dein script ---------------------------


colorscheme molokai

" 不可視文字の表示
set list
" 不可視文字の設定
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" 文字コードをUTF-8に設定する
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動的に読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" 行番号を表示
set number
" 現在の行を強制表示
set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 行末の１文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時に対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" タブストップは4スペース
set tabstop=4

let mapleader = "\<Space>"

call ddu#custom#patch_global({
    \   'ui': 'ff',
    \   'uiParams': {
    \     'ff': {
    \       'split': 'floating',
    \     }
    \   },
    \   'sources': [{'name': 'file_rec', 'params': {}}],
    \   'sourceOptions': {
    \     '_': {
    \       'matchers': ['matcher_substring'],
    \     },
    \   },
    \   'kindOptions': {
    \     'file': {
    \       'defaultAction': 'open',
    \     },
    \   }
    \ })

augroup DduSettings
autocmd!

autocmd FileType ddu-ff call s:ddu_my_settings()
function! s:ddu_my_settings() abort
  nnoremap <buffer><silent> <CR>
        \ <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
  nnoremap <buffer><silent> <Space>
        \ <Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>
  nnoremap <buffer><silent> i
        \ <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
  nnoremap <buffer><silent> q
        \ <Cmd>call ddu#ui#ff#do_action('quit')<CR>
endfunction

autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
  inoremap <buffer><silent> <CR>
  \ <Esc><Cmd>close<CR>
  nnoremap <buffer><silent> <CR>
  \ <Cmd>close<CR>
  nnoremap <buffer><silent> q
  \ <Cmd>close<CR>
endfunction

augroup END

" bufferline
" In your init.lua or init.vim
set termguicolors
lua << EOF
require("bufferline").setup{}
EOF

" --------------------------------------------
" Key Bind
" --------------------------------------------
" init.vim呼び出し
nnoremap :init :edit $MYVIMRC<CR>

" プラグイン
nnoremap :toml :edit $HOME/.config/nvim/toml/.dein.toml<CR>

" 遅延読み込みプラグイン
nnoremap :lazy :edit $HOME/.config/nvim/toml/.dein_lazy.toml<CR>

" init.vim読み込み
nnoremap <Leader>s :source $MYVIMRC<CR>

" ファイル保存
nnoremap <Leader>w :w<CR>

" 終了のショートカット
nnoremap <Leader>q :q<CR>

" バッファの削除
nnoremap <Leader>b :bd<CR>

" defxの表示
nnoremap <Leader>f :Defx<CR>

" dduの表示
nnoremap <Leader>p :call ddu#start()<CR>

" 行頭移動
nnoremap gh ^
" 行末移動
nnoremap gl $
nnoremap j gj
nnoremap k gk

" デフォルトでinnerを指定するように変更
onoremap 9 i(
onoremap ' i'
onoremap " i"
onoremap ` i`
onoremap [ i[
onoremap { i{
