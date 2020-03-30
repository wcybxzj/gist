set nocompatible              " be iMproved, required
filetype on " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"vim go sinpmate begin
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
"vim go sinpmate end



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
Plugin 'fatih/vim-go'
Plugin 'Shougo/neocomplete'
Plugin 'Lokaltog/vim-powerline'

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


"neocomplete 这样就能在启动 VIM 时自动开启实时补全功能。
let g:neocomplete#enable_at_startup = 1

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

let g:ctags_statusline=1
let g:ctags_args=1
let g:Tlist_Use_Right_Window=1
let g:Tlist_Show_One_File = 1
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_WinWidth=40
nmap <leader><F12> :TlistToggle<CR>

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
set foldlevelstart=99       " 打开文件是默认不折叠代码
set foldclose=all          " 设置为自动关闭折叠
set foldmethod=indent "set default foldmethod
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

set tags=tags,/usr/local/go/src/tags;
set autochdir"
set list listchars=tab:>-,trail:- "tab 显示

function! MySetExecutableIfScript(line1, current_file)
if a:line1 =~ '^#!\(/usr\)*/bin/'
	let chmod_command = "silent !chmod ugo+x " . a:current_file
	execute chmod_command
endif
endfunction
autocmd BufWritePost * call MySetExecutableIfScript(getline(1), expand("%:p"))

function FuncUtf8Unix()
:set fenc=utf-8
:set fileformat=unix
endfunction

let mapleader = ","
nmap <leader>pt :!php -l %<CR>
nmap <leader>py :!python %<CR>
nmap <leader>r  :!go run %<CR>
nmap <leader>:!python %<CR>
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



"=========================vim-go======================================
"防止vim-go ctrl+x+o 代码补全的时候上边出scratch window烦人
set completeopt=menu


"先去执行1.vim_go.sh 下载支持的扩展
" vim-go custom mappings
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
"au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)

" vim-go settings
let g:go_fmt_command = "goimports"


"解决屏幕闪烁问题
set novisualbell
set visualbell t_vb=

"""""""""""""新建文件标题"""""""""""""""

"新建.c,.h,.sh,.java 文件时,自动插入头文件
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"

"定义函数 Setitle, 自动插入头文件
func SetTitle()
    "如果文件类型为.cpp
    if &filetype == 'cpp'
        call setline(1, "#include <iostream>")
        call append(line("."), "#include<string>")
        call append(line(".")+1, "using namespace std;")
        call append(line(".")+2, "")
        call append(line(".")+3, "int main(int argc, char *argv[])")
        call append(line(".")+4, "{")
        call append(line(".")+5, "")
        call append(line(".")+6, "\treturn 0;")
        call append(line(".")+7, "}")
    endif

    "如果文件类型为.c
    if &filetype == 'c'
        call setline(1, "#include <stdio.h>")
        call append(line("."), "#include <stdlib.h>")
        call append(line(".")+1, "#include <string.h>")
        call append(line(".")+2, "#include <unistd.h>")
        call append(line(".")+3, "#include <errno.h>")
        call append(line(".")+4, "#include <pthread.h>")
        call append(line(".")+5, "")

       call append(line(".")+6, "void sys_err(const char *str)")
       call append(line(".")+7, "{")
       call append(line(".")+8, "\tperror(str);")
       call append(line(".")+9, "\texit(1);")
       call append(line(".")+10, "}")

        call append(line(".")+11, "")
        call append(line(".")+12, "int main(int argc, char *argv[])")
        call append(line(".")+13, "{")
        call append(line(".")+14, "")
        call append(line(".")+15, "\treturn 0;")
        call append(line(".")+16, "}")

		"call append(line(".")+11, "void err_thread(int ret, char *str)")
		"call append(line(".")+12, "{")
		"call append(line(".")+13, "\tif (ret != 0) {")
		"call append(line(".")+14, "\t\tfprintf(stderr, \"%s:%s\\n\", str, strerror\(ret));")
		"call append(line(".")+15, "\t\tpthread_exit(NULL);")
		"call append(line(".")+16, "\t}")
		"call append(line(".")+17, "}")

        "call append(line(".")+18, "")
        "call append(line(".")+19, "int main(int argc, char *argv[])")
        "call append(line(".")+20, "{")
        "call append(line(".")+21, "")
        "call append(line(".")+22, "\treturn 0;")
        "call append(line(".")+23, "}")

    endif

    "自动将光标定位到末尾
    autocmd BufNewFile * normal G

endfunc
