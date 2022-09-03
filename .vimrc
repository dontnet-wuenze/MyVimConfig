 "----------------- Configuration file for vim-----------------------
 set modelines=0     " CVE-2007-2438
 
 " Normally we use vim-extensions. If you want true vi-compatibility
 " remove change the following statements
 set nocompatible    " Use Vim defaults instead of 100% vi compatibility
 set backspace=2     " more powerful backspacing
 
 " Don't write backup file if vim is being called by "crontab -e"
 au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
 " Don't write backup file if vim is being called by "chpass"
 au BufWrite /private/etc/pw.* set nowritebackup nobackup
 
 let skip_defaults_vim=1
 " 设置外观 -------------------------------------
 set number                      "显示行号
 set showtabline=0               "隐藏顶部标签栏"
 set guioptions-=r               "隐藏右侧滚动条"
 set guioptions-=L               "隐藏左侧滚动条"
 set guioptions-=b               "隐藏底部滚动条"
 "set cursorline                  "突出显示当前行"
 "set cursorcolumn                "突出显示当前列"
 set langmenu=zh_CN.UTF-8        "显示中文菜单
 " 变成辅助 -------------------------------------
 syntax on                       "开启语法高亮
 "set nowrap                      设置代码不折行"
 set fileformat=unix             "设置以unix的格式保存文件"
 set cindent                     "设置C样式的缩进格式"
 set tabstop=4                   "一个 tab 显示出来是多少个空格，默认 8
 set shiftwidth=4                "每一级缩进是多少个空格
 set backspace+=indent,eol,start "set backspace&可以对其重置
 set showmatch                   "显示匹配的括号"
 set scrolloff=5                 "距离顶部和底部5行"
 set laststatus=2                "命令行为两行"
 " 其他杂项 -------------------------------------
 set mouse=a                     "启用鼠标"
 set selection=exclusive
 set selectmode=mouse,key
 set matchtime=5
 set ignorecase                  "忽略大小写"
 set incsearch
 set hlsearch                    "高亮搜索项"
 set noexpandtab                 "不允许扩展table"
 set whichwrap=b,s,h,l,[,],<,>
 set autoread

call plug#begin()
"Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/tagbar'
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'rakr/vim-one'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'ycm-core/YouCompleteMe'
Plug 'ryanoasis/vim-devicons'
call plug#end()

" solarized 样式设置
"syntax enable
"set background=light
"colorscheme solarized

" molokai 样式设置
"colorscheme molokai
"let g:rehash256 = 1
"let g:molokai_original = 1
"highlight NonText guibg=#060606
"highlight Folded  guibg=#0A0A0A guifg=#9090D0
"highlight Visual  ctermbg=81 
"set t_Co=256
"set background=dark

" vim randow 括号
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\	}
\}


" vim-one 样式设置
colorscheme one
set background=dark " for the dark version
" set background=light " for the light version
let g:one_allow_italics = 1
"let g:airline_theme='one'

" ale 语法检查设置
" 显示状态栏+不需要高亮
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0

" 错误和警告标志
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'

" 文件保存时，显示警告
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

" 使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}

" vim-airline
" @airline
set t_Co=256      "在windows中用xshell连接打开vim可以显示色彩
let g:airline#extensions#tabline#enabled = 1   " 是否打开tabline
"这个是安装字体后 必须设置此项" 
set laststatus=2  "永远显示状态栏
let g:airline_theme='one' "选择主题
let g:airline#extensions#tabline#enabled=1    "Smarter tab line: 显示窗口tab和buffer
"let g:airline#extensions#tabline#left_sep = ' '  "separater
"let g:airline#extensions#tabline#left_alt_sep = '|'  "separater
"let g:airline#extensions#tabline#formatter = 'default'  "formater
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" ycm
"往前跳和往后跳的快捷键为Ctrl+O以及Ctrl+I
let g:ycm_key_list_select_completion=['<c-n>', '<DOWN>']
let g:ycm_key_list_previous_completion=['<c-p>', '<UP>']

set completeopt=menu  "关闭preview window
"let g:ycm_add_preview_to_completeopt =0
"let g:ycm_autoclose_preview_window_after_completion=1
"let g:ycm_autoclose_preview_window_after_insertion=1
"let g:ycm_always_populate_location_list = 0
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=1 " 从第1个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1 " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR> "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
"inoremap <leader><leader> <C-x><C-o>
let g:ycm_complete_in_comments = 1 "在注释输入中也能补全
let g:ycm_complete_in_strings = 1 "在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0 "注释和字符串中的文字也会被收入补全
let g:ycm_max_num_identifier_candidates = 50
let g:ycm_auto_trigger = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>'
"sub commands
"YcmCompleter RefactorRename :重命名
"YcmCompleter GoToSymbol  

nnoremap <leader>go :YcmCompleter GoTo<CR> "跳转
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR> "跳转到定义或声明
nnoremap <leader>gt :YcmCompleter GetType<CR> "get类型
nnoremap gi :YcmCompleter GoToInclude<CR>   "跳转到include、声明或定义(向回跳转：Ctrl+o)
nnoremap gm :YcmCompleter GoToImprecise<CR> "跳转到实现
nnoremap gr :YcmCompleter GoToReferences<CR> "跳转到引用
nnoremap fi :YcmCompleter FixIt<CR> "根据Ycm的建议修复错误
nnoremap <F5> :YcmDiags<CR>  "F4进行诊断并显示诊断列表
nnoremap <F6> :YcmForceCompileAndDiagnostics<CR> "重新编译和诊断

"nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR> "跳转到声明
"nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>  "跳转到定义
"highlight Pmenu ctermfg=4 ctermbg=0 guifg=#ffffff guibg=#000000  "提示不再是粉红色(pink)
highlight Pmenu ctermfg=10 ctermbg=8 guifg=#ffffff guibg=#000000  "提示不再是粉红色(pink)
highlight PmenuSel ctermfg=14 ctermbg=8 guifg=#ffffff guibg=#000000  "提示不再是粉红色(pink)
