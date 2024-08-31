"setable multi-color
set t_Co=256

"load color-scheme
set background=dark
:colorscheme hybrid

"show title
"set title

"no backup
set noswapfile
set nobackup

"use mouse-wheel
"set mouse=a
"set ttymouse=xterm2

"show statusbar always
set laststatus=2

"挿入モードの時のみ、カーソル行をハイライトする
set nocursorline
autocmd InsertEnter,InsertLeave * set cursorline!

"set color on current-line
highlight CursorLine cterm=NONE ctermfg=NONE ctermbg=235

"statusbar's color change
"highlight StatusLine cterm=NONE ctermfg=NONE ctermbg=240

"linenum's color
highlight LineNr cterm=NONE ctermfg=238
highlight CursorLineNr cterm=NONE ctermfg=12 ctermbg=235

"背景色指定
:highlight Normal ctermbg=0

"行番号表示
set nu

"行を跨いで移動可能に
set whichwrap=b,s,h,l,<,>,[,] 

"タブ幅
set tabstop=4

"折り返し無効
set nowrap

"検索結果ハイライトをESC連打で消す
set hlsearch
noremap <Esc><Esc> :nohlsearch<CR><Esc>

"マウス有効化
set mouse=a
set ttymouse=xterm2

"コロン,セミコロン入れ替え
"noremap ; :
"noremap : ;

"(for windows)set insert to delete-key
"noremap <del> <ins>

