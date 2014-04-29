
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
set backspace=indent,eol,start "Backspaceを調整

let $LANG='ja'

" タブ表示幅
set tabstop=4
" タブ挿入幅
set shiftwidth=4
" タブをスペースに展開しない
set noexpandtab
" タブキーで挿入されるタブ幅
set softtabstop=4

" 行番号表示
set number

" 自動インデント
set autoindent smartindent

" 最後まで検索したら最初に戻る
set wrapscan
" 検索文字をハイライト
set hlsearch

" カーソル行と列をハイライト
set cursorline
set cursorcolumn

" コマンドラインの行数
set cmdheight=2

" swapファイル作らない
set noswapfile

" ヤンクするとクリップボードにも入る(*レジスタにも書き込む)
set clipboard+=unnamed

set laststatus=2
set t_Co=256
syntax on


set nocompatible
filetype plugin indent off

" vimrc開く
nnoremap <silent> <Space>ev :<C-u>tabedit $MYVIMRC<CR>
" vimrc適用
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC<CR>


" =================================================
" NeoBundle
" =================================================

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'itchyny/lightline.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'AndrewRadev/linediff.vim'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/startmenu-vim'
NeoBundle 'mattn/excelview-vim'

" colorscheme
NeoBundle 'tomasr/molokai'
NeoBundle 'cocopon/iceberg.vim'

filetype plugin indent on

colorscheme molokai

" =================================================
" molokai
" =================================================
let g:molokai_original=1


"=================================================
" NERDTree
" =================================================
nnoremap <F2> :NERDTreeToggle<CR>
" 最後のウィンドウがNERDTreeだけならvim閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ブックマーク表示
let g:NERDTreeShowBookmarks=1
" 開く場所
let g:NERDTreeWinPos="left"
" 表示する幅
let g:NERDTreeWinSize=40
" ツリー表示いい感じにする+|'
let g:NERDTreeDirArrows=0
" 行番号表示しない
let g:NERDTreeShowLineNumbers=0
" ヘルプのショートカットとかメニューに表示しない
let g:NERDTreeMinimalUI=1

" =================================================
" lightline
" =================================================
let g:lightline = {
\  'colorscheme': 'wombat',
\  'component': {
\    'readonly': '%{&readonly?"x":""}',
\  },
\  'separator': { 'left': '>', 'right': '<' },
\  'subseparator': { 'left': '>', 'right': '<' }
\ }


" =================================================
" vim-over
" =================================================
" :s<Space> でvim-over使用して%sが入力された状態になる
cnoreabb <silent><expr>s getcmdtype()==':' && getcmdline()=~'^s' ? 'OverCommandLine<CR><C-u>%s/<C-r>=get([], getchar(0), '')<CR>' : 's'

" =================================================
" switch
" =================================================
let g:switch_custom_definitions = [
\	['true', 'false'],
\	['if', 'else if', 'else'],
\	['try', 'catch', 'finally'],
\	{
\         '\(\k\+\)'    : '''\1''',
\       '''\(.\{-}\)''' :  '"\1"',
\        '"\(.\{-}\)"'  :   '\1',
\	},
\ ]

nnoremap + :<C-u>Switch<CR>

" =================================================
" splitjoin
" =================================================
nnoremap <Leader>j :<C-u>SplitjoinJoin<CR>
nnoremap <Leader>s :<C-u>SplitjoinSplit<CR>

" =================================================
" vim-indent-guides
" =================================================
" vim起動時に自動でオンにしない
" 1にすると起動するがexpandtabでないとだめっぽい
let g:indent_guides_enable_on_vim_startup=0
" ガイドをはじめるインデント量
let g:indent_guides_start_level=2
" 自動カラー無効
let g:indent_guides_auto_colors=0
" ガイドの幅
let g:indent_guides_guide_size=1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=gray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=darkgray

" =================================================
" matchit.zip
" =================================================
" 大文字と小文字区別しない
let b:match_ignorecase=1
let b:match_words="(:),{:},[:]"

" =================================================
" open-browser
" =================================================
let g:netrw_nogx=1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)




