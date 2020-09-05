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
set virutaledit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時に対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=linst:longest
" 折返し時に行単位での移動をできるようにする
nnoremap j gj
nnoremap k gk
" シンタックスハイライトの有効化
syntax enable