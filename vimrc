set nocompatible              " be iMproved, required
filetype on " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/snipMate'
Plugin 'vim-scripts/taglist.vim'
"? 开启帮助提示
Plugin 'vim-scripts/The-NERD-tree'
"补全括号和引号
Plugin 'Raimondi/delimitMate'
"usage ysiw 单词包裹 yss整行包裹
"cs'" 是将单引号变成双引号, cs"( 是将双引号变成圆括号
"cst<p> 直接转换
"ds " 删除成对的 双引号
Plugin 'tpope/vim-surround'
"O垂直打开,p水平打开,t做为新tab
Plugin 'vim-scripts/mru.vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'klen/python-mode'
Plugin 'rkulla/pydiction'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
" The default mapping to toggle the plugin is <Leader>ig
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'vim-scripts/netrw.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


if has("win32")
	let g:OS#name = "win"
	let g:OS#win = 1
	let g:OS#mac = 0
	let g:OS#unix = 0
elseif has("mac")
	let g:OS#name = "mac"
	let g:OS#mac = 1
	let g:OS#win = 0
	let g:OS#unix = 0
	set fileformat=unix
	set fileformats=unix,dos,mac
elseif has("unix")
	let g:OS#name = "unix"
	let g:OS#unix = 1
	let g:OS#win = 0
	let g:OS#mac = 0
endif
if has("gui_running")
	let g:OS#gui = 1
	au GUIEnter * winpos 0 0
	set lines=999 columns=9
else
	let g:OS#gui = 0
	au GUIEnter * winpos 0 0
endif


set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set langmenu=zh_CN.utf-8
language messages zh_CN.UTF-8
filetype indent plugin on
filetype indent on
syntax on
filetype on
" theme, skin, color
if g:OS#gui
	" set default(normal) window size.
	set columns=75
	set lines=100
endif
colo desert


if has('multi_byte_ime')
	highlight Cursor guibg=#F0E68C guifg=#708090
	highlight CursorIM guibg=Purple guifg=NONE
endif
if g:OS#win
	set guifont=Courier_New:h15:cANSI
elseif g:OS#mac
	set guifont=Ayuthaya:h15
elseif g:OS#unix
endif

set nobackup
if g:OS#win
	set directory=$VIM\tmp
else
	set directory=.,$TEMP
endif

if has("persistent_undo")
	set undofile
	set undolevels=1000
	if g:OS#win
		set undodir=$VIM\undodir
		au BufWritePre undodir/* setlocal noundofile
	else
		set undodir=~/.undodir
		au BufWritePre ~/.undodir/* setlocal noundofile
	endif
endif

set softtabstop=4
set tabstop=4       " show tab indent word space.
set shiftwidth=4    " tab length
set modeline
set linebreak       " break full word.
set autoindent      " new line indent same this line.
set smartindent
set cindent
set ignorecase
set smartcase
set number

if g:OS#gui
	set autochdir
endif

set ambiwidth=double
set history=500

if g:OS#gui
	set guitablabel=%M.%t
endif


set laststatus=2
set stl=\ %F%m%r%h\ [%{&fileformat},%{&fileencoding}]

vmap <tab> >gv
vmap <s-tab> <gv

let g:use_bash="zsh"

if g:OS#win
	let g:ctags_path=$VIM.'\vimfiles\plugin\ctags.exe'
	let Tlist_Ctags_Cmd=$VIM.'\vimfiles\plugin\ctags.exe'
	let g:tagbar_ctags_bin=$VIM.'\vimfiles\plugin\ctags.exe'
elseif g:OS#mac
	let g:ctags_path='/usr/bin/ctags'
	let list_Ctags_Cmd='/usr/bin/ctags'
	let g:tagbar_ctags_bin='/usr/bin/ctags'
else
endif
let g:ctags_statusline=1
let g:ctags_args=1
let g:Tlist_Use_Right_Window=1
let g:Tlist_Show_One_File = 1
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_WinWidth=40
nmap <leader><F12> :TlistToggle<CR>

if g:OS#mac
	imap <D-1> <Esc>:tabfirst<cr>
	nmap <D-1> :tabfirst<cr>
	imap <D-2> <Esc>2gt
	nmap <D-2> 2gt
	imap <D-3> <Esc>3gt
	nmap <D-3> 3gt
	imap <D-4> <Esc>4gt
	nmap <D-4> 4gt
	imap <D-5> <Esc>5gt
	nmap <D-5> 5gt
	imap <D-6> <Esc>6gt
	nmap <D-6> 6gt
	imap <D-7> <Esc>7gt
	nmap <D-7> 7gt
	imap <D-8> <Esc>8gt
	nmap <D-8> 8gt
	imap <D-9> <Esc>9gt
	nmap <D-9> 9gt
	imap <D-0> <Esc>:tablast<cr>
	nmap <D-0> :tablast<cr>
else
	imap <M-1> <Esc>:tabfirst<cr>
	nmap <M-1> :tabfirst<cr>
	imap <M-2> <Esc>2gt
	nmap <M-2> 2gt
	imap <M-3> <Esc>3gt
	nmap <M-3> 3gt
	imap <M-4> <Esc>4gt
	nmap <M-4> 4gt
	imap <M-5> <Esc>5gt
	nmap <M-5> 5gt
	imap <M-6> <Esc>6gt
	nmap <M-6> 6gt
	imap <M-7> <Esc>7gt
	nmap <M-7> 7gt
	imap <M-8> <Esc>8gt
	nmap <M-8> 8gt
	imap <M-9> <Esc>9gt
	nmap <M-9> 9gt
	imap <M-0> <Esc>:tablast<cr>
	nmap <M-0> :tablast<cr>
endif

" ybx ----------------setting--------------------
" disable right scroll
"set guioptions-=r
" 高亮显示搜索的内容
set hlsearch
" 设置命令行的高度
" set cmdheight=3
set statusline+=:\%c

set ambiwidth=double
set showcmd
" 自动载入VIM配置文件
autocmd! bufwritepost vimrc source $MYVIMRC
set cursorline " 高亮光标所在的行


set noswapfile
set vb

"set fdm=manual
""set foldenable              " 开始折叠
"set foldmethod=syntax       " 设置语法折叠
""set foldcolumn=0            " 设置折叠区域的宽度
"setlocal foldlevel=10        " 设置折叠层数为
""set foldlevelstart=99       " 打开文件是默认不折叠代码
"set foldclose=all          " 设置为自动关闭折叠
set foldmethod=indent "set default foldmethod
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

set tags=tags;
set autochdir"
set list listchars=tab:>-,trail:- "tab 显示

function! MySetExecutableIfScript(line1, current_file)
	if a:line1 =~ '^#!\(/usr\)*/bin/'
		let chmod_command = "silent !chmod ugo+x " . a:current_file
		execute chmod_command
	endif
endfunction
autocmd BufWritePost * call MySetExecutableIfScript(getline(1), expand("%:p"))

"xdebug settings
let g:dbgPavimPort = 9999
let g:dbgPavimBreakAtEntry = 0
"Remote debugging
"let g:dbgPavimPathMap = [['/Users/yangbingxi/www','/home/wcybxzj/www'],]

"pydiction
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'

"set cc=80
"set cuc

"-----------------------------------------------------------------
" plugin - DoxygenToolkit.vim  由注释生成文档，并且能够快速生成函数标准注释
"-----------------------------------------------------------------
let g:DoxygenToolkit_compactDoc = "yes"
let g:DoxygenToolkit_returnTag="@return "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_blockHeader=""
let g:DoxygenToolkit_blockFooter=""
let g:DoxygenToolkit_authorName="yangbx@chuchujie.com"

if(has("win32") || has("win95") || has("win64") || has("win16"))
    let g:iswindows=1
else
    let g:iswindows=0
endif

function FuncUtf8Unix()
	:set fenc=utf-8
	:set fileformat=unix
endfunction

nmap <leader>pt :!php -l %<CR>
nmap <leader>py :!python %<CR>
map  <leader>- :set co=90<CR>:set lines=350<CR>
map  <leader>= :set co=298<CR>:set lines=250<CR>
map  <leader>] :set co=168<CR>:set lines=17<CR>

map <C-i> :call FuncUtf8Unix()<CR>
imap <C-y>  :call Func()<CR>
nmap <C-t> :tabnew<cr>
nmap <C-tab> :tabnext<cr>
imap <C-S-tab> :tabprevious<cr>
map <C-n> :NERDTreeToggle<CR>
map <C-k> :%s/\s\+$//<CR>
map <C-h> :%s/^\+\s//<CR>
map <C-l> :%g/^$/d<CR>
map <C-e> :lclose<CR>

"in linux not necessary use tabn tabp 来实现切换tab
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 9gt
map <leader>0 :tablast<CR>
map <leader>n :tabn<CR>
map <leader>m :tabp<CR>
