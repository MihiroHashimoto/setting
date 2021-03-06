" ↓update dein↓
" call dein#update()

" === sheerun/vim-polyglot ===
" ~/.vimrc, declare this variable before polyglot is loaded
let g:polyglot_disabled = ['markdown']

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif
" Required:
set runtimepath+=/Users/mihiro.h/.vim/dein/repos/github.com/Shougo/dein.vim
" Required:
if dein#load_state('/Users/mihiro.h/.vim/dein')
  call dein#begin('/Users/mihiro.h/.vim/dein')
  " Let dein manage dein
  " Required:
  call dein#add('/Users/mihiro.h/.vim/dein/repos/github.com/Shougo/dein.vim')
  " color scheme
  call dein#add('morhetz/gruvbox')
  " dirctory tree
  call dein#add('scrooloose/nerdtree')
  " sublime search
  call dein#add('ctrlpvim/ctrlp.vim')
  " easymotion
  call dein#add('easymotion/vim-easymotion')
  " commentout
  " call dein#add('scrooloose/nerdcommenter')
  " auto close tag
  call dein#add('Townk/vim-autoclose')
  " emmet-vim
  call dein#add('mattn/emmet-vim')
  " trailing-whitespace
  call dein#add('bronson/vim-trailing-whitespace')
  " text move, duplication
  call dein#add('t9md/vim-textmanip')
  " vim-css-color
  call dein#add('ap/vim-css-color')
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
  " git(for displaying branch name in status line)
  call dein#add('tpope/vim-fugitive')
  " git conflict markers
  call dein#add('rhysd/conflict-marker.vim')
  " status line
  call dein#add('vim-airline/vim-airline')
  " airline-theme
  call dein#add('vim-airline/vim-airline-themes')
  " editor config
  call dein#add('editorconfig/editorconfig-vim')
  " markdown
  " call dein#add('plasticboy/vim-markdown')
  " call dein#add('previm/previm')
  " call dein#add('tyru/open-browser.vim' )
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

"End dein Scripts-------------------------

if has('autocmd') " ignore this section if your vim does not support autocommands
  " auto reload .vimrc
  augroup reload_vimrc
    autocmd!
    autocmd! BufWritePost $MYVIMRC,$MYGVIMRC nested source %
  augroup END
  " highlight
  " autocmd ColorScheme * highlight Visual ctermfg=81 ctermbg=24
  " autocmd ColorScheme * highlight Directory ctermfg=81
  " autocmd ColorScheme * highlight Identifier ctermfg=135
  " autocmd ColorScheme * highlight Function ctermfg=161
  " autocmd ColorScheme * highlight Type ctermfg=231
    " autocmd ColorScheme * highlight Identifier ctermfg=231
    " autocmd ColorScheme * highlight Comment ctermfg=245
    " autocmd ColorScheme * highlight Normal ctermfg=255
    " autocmd ColorScheme * highlight Statement ctermfg=161
    " autocmd ColorScheme * highlight Underlined ctermfg=15
    " autocmd ColorScheme * highlight String ctermfg=121
    " autocmd ColorScheme * highlight Number ctermfg=135
    " autocmd ColorScheme * highlight Exception ctermfg=81
    " autocmd ColorScheme * highlight Title ctermfg=229
    " autocmd ColorScheme * highlight StorageClass ctermfg=45
    " autocmd ColorScheme * highlight Include ctermfg=161
    " autocmd ColorScheme * highlight MatchParen ctermfg=161 ctermbg=231
    " autocmd ColorScheme * highlight Search ctermfg=81 ctermbg=24
    autocmd ColorScheme * highlight Search ctermfg=167 ctermbg=236
    " autocmd ColorScheme * highlight Search ctermfg=214 ctermbg=236
    " autocmd ColorScheme * highlight SpecialKey ctermfg=231
    " autocmd ColorScheme * highlight Search ctermfg=7 ctermbg=0

    autocmd VimEnter,WinEnter,BufNewFile,BufRead,BufEnter,TabEnter * IndentLinesReset

    " Insert template when BufNewFile if not exists the file.
    autocmd BufRead *.vue if getfsize(expand('%'))==0|0r ~/.vim/templates/index.vue|endif
    autocmd BufRead *.html if getfsize(expand('%'))==0|0r ~/.vim/templates/index.html|endif
    autocmd BufNewFile *.vue 0r $HOME/.vim/templates/index.vue
    autocmd BufNewFile *.html 0r $HOME/.vim/templates/index.html
endif

" All the languages Kite supports
let g:kite_supported_languages = ['*']
set completeopt=menuone,noselect

" config
" LeaderをSpaceキーにする
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap j gj
nnoremap k gk
nnoremap <C-l> zz
nnoremap <S-*> g*

" QuickFix
nnoremap cl :ccl<CR>
nnoremap cn :cn<CR>
nnoremap cN :cN<CR>

filetype on
filetype plugin indent on
set iskeyword-=.
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
" 補完表示時のEnterで改行をしない
inoremap <expr><CR>  pumvisible() ? '<C-y>' : '<CR>'
" 正規表現は「バックトラックエンジン」のみを用いて処理（今回はsyntax highlightのため）
set regexpengine=1

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
" 80文字の境界線
set colorcolumn=80
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
" colorscheme molokai
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
"
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
" 補完プレビューウィンドウを非表示にする
" set completeopt=menuone
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
let g:NERDTreeWinSize=20
let g:NERDTreeIgnore = ['^node_modules$', '^.git$', '^.DS_Store$', '.css.map$']

" === scrooloose/nerdcommenter ===
"
" insert space after comment charactor
" let g:NERDSpaceDelims=1
" nmap <C-_> <Plug>NERDCommenterToggle
" vmap <C-_> <Plug>NERDCommenterToggle
" " for Vue
" let g:ft = ''
" function! NERDCommenter_before()
"   if &ft == 'vue'
"     let g:ft = 'vue'
"     let stack = synstack(line('.'), col('.'))
"     if len(stack) > 0
"       let syn = synIDattr((stack)[0], 'name')
"       if len(syn) > 0
"         exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
"       endif
"     endif
"   endif
" endfunction
" function! NERDCommenter_after()
"   if g:ft == 'vue'
"     setf vue
"     let g:ft = ''
"   endif
" endfunction

" === emmet ===
"
autocmd FileType html,css,scss,sass,vue imap <buffer><expr><tab>
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
\  'variables': {
\    'lang': "ja"
\  },
\  'html': {
\    'indentation': '  ',
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\        ."<html lang=\"${lang}\">\n"
\        ."<head>\n"
\        ."\t<meta charset=\"${charset}\">\n"
\        ."\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n"
\        ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n"
\        ."\t<title></title>\n"
\        ."</head>\n"
\        ."<body>\n\t${child}|\n</body>\n"
\        ."</html>"
\    }
\  },
\  'vue': {
\    'indentation': '  ',
\    'snippets': {
\      'vue': ""
\        ."<template lang=\"pug\"></template>\n"
\        ."\n"
\        ."<script>\n"
\        ."export default {\n"
\        ."\tname: ''\n"
\        ."}\n"
\        ."</script>\n"
\        ."\n"
\        ."<style lang=\"scss\" scoped></style>"
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
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)

" === ctrlpvim/ctrlp.vim ===
"
" https://github.com/ctrlpvim/ctrlp.vim
" :help ctrlp-input-formats
" wildignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" CtrlPBuffer
if !has('gui_running')
  map VimCtrlPBuffer <D-b><CR>
endif
map <D-b> :CtrlPBuffer

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
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" let g:ale_sign_error = '🚨'
" let g:ale_sign_warning = '⚠️'
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
" 行末のスペースを削除(markdownファイル以外)
fun! StripTrailingWhitespace()
    " Don't strip on these filetypes
    if &ft =~ 'markdown'
        return
    endif
    %s/\s\+$//e
endfun

autocmd BufWritePre * call StripTrailingWhitespace()

" === vim-airline ===
"
" https://github.com/vim-airline/vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
let g:airline_section_c = '%t'
let g:airline_section_x = '%{&filetype}'
let g:airline_section_z = '%3l:%2v %{airline#extensions#ale#get_warning()} %{airline#extensions#ale#get_error()}'
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 1

" === gruvbox ===
"
" https://github.com/morhetz/gruvbox
colorscheme gruvbox
set background=dark
set t_Co=256
let g:ligthline = { 'colorscheme': 'gruvbox' }
let g:gruvbox_contrast_dark = 'soft'

" === markdown ===

command! Shiba :silent call system('shiba ' . expand('%') . ' &>/dev/null 2>&1 &') | redraw!
autocmd BufRead,BufNewFile *.md  set filetype=markdown
" nnoremap <silent> <C-m> :PrevimOpen<CR>
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
" let g:vim_markdown_folding_disabled=1
" let g:previm_enable_realtime=1
"
" === complete me ===
"
" https://github.com/ackyshake/VimCompletesMe
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_autoclose_preview_window_after_insertion = 1
set splitbelow
