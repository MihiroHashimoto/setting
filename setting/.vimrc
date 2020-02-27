" ↓update dein↓
" call dein#update()

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/mihiro/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/mihiro/.cache/dein')
  call dein#begin('/Users/mihiro/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/mihiro/.cache/dein/repos/github.com/Shougo/dein.vim')
  " dirctory tree
  call dein#add('scrooloose/nerdtree')
  " sublime search
  call dein#add('ctrlpvim/ctrlp.vim')
  " easymotion
  call dein#add('easymotion/vim-easymotion')
  " display close tag
  call dein#add('gregsexton/MatchTag')
  " commentout
  call dein#add('scrooloose/nerdcommenter')
  " emmet-vim
  call dein#add('mattn/emmet-vim')
  " trailing-whitespace
  call dein#add('bronson/vim-trailing-whitespace')
  " auto close tag
  call dein#add('Townk/vim-autoclose')
  " text move, duplication
  call dein#add('t9md/vim-textmanip')
  " colorHeighlight
  call dein#add('gko/vim-coloresque')
  " コード補完
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neosnippet-snippets')
  " indent
  call dein#add('Yggdroot/indentLine')
  " vim surround
  call dein#add('tpope/vim-surround')
  " syntax highlight
  call dein#add('sheerun/vim-polyglot')
  " syntax checking
  call dein#add('w0rp/ale')
  " stylus
  call dein#add('wavded/vim-stylus')
  " jsdoc
  call dein#add('heavenshell/vim-jsdoc')
  " git conflict markers
  call dein#add('rhysd/conflict-marker.vim')
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
" syntax enable

" If you want to install not installed plugins on startup.
" if dein#check_install()
"   call dein#install()
" endif
" syntax enable

" If you want to install not installed plugins on startup.
" if dein#check_install()
"   call dein#install()
" endif

"End dein Scripts-------------------------

if has('autocmd') " ignore this section if your vim does not support autocommands
    " auto reload .vimrc
    augroup reload_vimrc
        autocmd!
        autocmd! BufWritePost $MYVIMRC,$MYGVIMRC nested source %
    augroup END
    " highlight
    autocmd ColorScheme * highlight Visual ctermfg=81 ctermbg=24
    autocmd ColorScheme * highlight Directory ctermfg=81
    autocmd ColorScheme * highlight Identifier ctermfg=135
    autocmd ColorScheme * highlight Function ctermfg=161
    autocmd ColorScheme * highlight Type ctermfg=231
    " autocmd ColorScheme * highlight Identifier ctermfg=231
    autocmd ColorScheme * highlight Comment ctermfg=245
    autocmd ColorScheme * highlight Normal ctermfg=255
    autocmd ColorScheme * highlight Statement ctermfg=161
    autocmd ColorScheme * highlight Underlined ctermfg=15
    autocmd ColorScheme * highlight String ctermfg=121
    autocmd ColorScheme * highlight Number ctermfg=135
    autocmd ColorScheme * highlight Exception ctermfg=81
    autocmd ColorScheme * highlight Title ctermfg=229
    autocmd ColorScheme * highlight StorageClass ctermfg=45
    autocmd ColorScheme * highlight Include ctermfg=161
    autocmd ColorScheme * highlight MatchParen ctermfg=161 ctermbg=NONE
    " autocmd ColorScheme * highlight MatchParen ctermfg=161 ctermbg=231
    autocmd ColorScheme * highlight Search ctermfg=81 ctermbg=24
    autocmd ColorScheme * highlight SpecialKey ctermfg=231

    autocmd VimEnter,WinEnter,BufNewFile,BufRead,BufEnter,TabEnter * IndentLinesReset
endif

" config
" LeaderをSpaceキーにする
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
filetype on
filetype plugin indent on
" 文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" 行番号を表示
set number
" ビープ音を可視化
set visualbell
" vim で改行での自動コメントアウトを無効にする
set formatoptions-=ro
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

nnoremap <C-l> zz

inoremap <silent> <C-Space> <ESC>

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" insertmodeで移動
imap <C-k> <Up>
imap <C-j> <Down>
imap <C-b> <Left>
imap <C-f> <Right>
" virtualモードの時にスターで選択位置のコードを検索するようにする"
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

" undoファイルを1箇所に保存
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

" syntax
syntax on
set background=dark
set t_Co=256
colorscheme molokai
"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

" yank
set clipboard=unnamed

" paste
" ペースト設定
" if &term =~ "xterm"
    " let &t_ti .= "\e[?2004h"
    " let &t_te .= "\e[?2004l"
    " let &pastetoggle = "\e[201~"

    " function XTermPasteBegin(ret)
        " set paste
        " return a:ret
    " endfunction

    " noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    " inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    " cnoremap <special> <Esc>[200~ <nop>
    " cnoremap <special> <Esc>[201~ <nop>
" endif

" Tab
set list
set listchars=tab:\▸\-
" set listchars=tab:\▸\-,space:.
hi SpecialKey ctermbg=NONE ctermfg=100
" 常にタブラインを表示
set showtabline=2
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
set softtabstop=2
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に前の行の構文をチェックし次の行のインデントを増減する
set smartindent
" 左のタブに移動
nnoremap gb gT
" バッファを新規タブで開く
command! -nargs=1 B call TabSb(<f-args>)
function! TabSb(number)
  exe ":tab sb" . a:number
endfunction

" === indentLine ===
" https://github.com/Yggdroot/indentLine
let g:indentLine_color_term = 245
let g:indentLine_char_list = ['|']

" === t9md/vim-textmanip ===
"
" https://github.com/t9md/vim-textmanip
xmap <Space>d <Plug>(textmanip-duplicate-down)
nmap <Space>d <Plug>(textmanip-duplicate-down)
xmap <Space>D <Plug>(textmanip-duplicate-up)
nmap <Space>D <Plug>(textmanip-duplicate-up)

xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)

" === scrooloose/nerdtree ===
"
" https://github.com/preservim/nerdtree
" short cut key
if !has('gui_running')
  map VimNerdTree <S-D-e>
endif
map <S-D-e> :NERDTreeToggle<CR>
" How can I open a NERDTree automatically when vim starts up if no files were specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" NERDTreeを現在開いているタブファイルパスと同期する
autocmd BufEnter * lcd %:p:h
" ドットファイルを可視化
let g:NERDTreeShowHidden=1

" === scrooloose/nerdcommenter ===
"
" insert space after comment charactor
let g:NERDSpaceDelims=1
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle
" for Vue
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

" === emmet ===
"
autocmd FileType html,css,scss,sass imap <buffer><expr><tab>
    \ emmet#isExpandable() ? "\<plug>(emmet-expand-abbr)" :
    \ "\<tab>"
" lang ja
let g:user_emmet_settings = {
    \ 'variables': {
    \   'lang' : 'ja'
    \ }
    \}
" snippets 展開方法(html:5)
let g:user_emmet_settings = {
\  'variables' : {
\    'lang' : "ja"
\  },
\  'html' : {
\    'indentation' : '  ',
\    'snippets' : {
\      'html:5': "<!DOCTYPE html>\n"
\        ."<html lang=\"${lang}\">\n"
\        ."<head>\n"
\        ."\t<meta charset=\"${charset}\">\n"
\        ."\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n"
\        ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n"
\        ."\t<title></title>\n"
\        ."</head>\n"
\        ."<body>\n\t${child}|\n</body>\n"
\        ."</html>",
\    }
\  }
\}

" === easymotion/vim-easymotion ===
"
" https://github.com/easymotion/vim-easymotion
" Default bindings
map <Leader> <Plug>(easymotion-prefix)
" Gif config
" nmap s <Plug>(easymotion-s2)
" nmap t <Plug>(easymotion-t2)
" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" === ctrlpvim/ctrlp.vim ===
"
" https://github.com/ctrlpvim/ctrlp.vim
" :help ctrlp-input-formats
" wildignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" 自動的にquickfix-windowを開く
autocmd QuickFixCmdPost *grep* cwindow

" neocomplete
" complete
" 起動時に有効
let g:neocomplete#enable_at_startup = 1
"” ポップアップメニューで表示される候補の数
let g:neocomplete#max_list = 10
"“キーワードの長さ、デフォルトで80
let g:neocomplete#max_keyword_width = 80
let g:neocomplete#enable_ignore_case = 1

" === ale ===
"
" https://github.com/dense-analysis/ale
" 保存時のみ実行する
let g:ale_lint_on_text_changed = 0
" 表示に関する設定
let g:ale_sign_error = '🚨'
let g:ale_sign_warning = '⚠️'
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass
" Ctrl + kで次の指摘へ、Ctrl + jで前の指摘へ移動
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" === trailing-whitespace ===
"
autocmd BufWritePre * :FixWhitespace

