set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'preservim/nerdtree'
" nerdtree plugins
" Shows Git status flags for files and folders in NERDTree
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Adds filetype-specific icons to NERDTree files and folders
Plugin 'ryanoasis/vim-devicons'
" Adds syntax highlighting to NERDTree based on filetype
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" 1) Highlights open files in a different color. 2) Closes a buffer directly from NERDTree.
Plugin 'PhilRunninger/nerdtree-buffer-ops'
" Enables NERDTree to open, delete, move, or copy multiple Visually-selected files at once
Plugin 'PhilRunninger/nerdtree-visual-selection'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
"
"


set number			"显示行号
" ngg/nG 跳转到第n行(无需回车)
" :n	 跳转到第n行(需回车)
" vim +n filename 打开文件并跳转到第n行
"
" gg 跳转到首行
" G  跳转到末行
"

set smartindent
set cindent			" c/c++风格自动缩进
set autoindent		" 普通文件类型的自动缩进

set tabstop=4		" tab宽度
set shiftwidth=4	" 自动缩进尺寸

set smarttab		" 按一下backspace可以删除4个空格
set softtabstop=4

set noexpandtab		"不要用空格替代制表符

set backspace=indent,eol,start		"使backspace正常处理indent,eol,start等

"set encoding=utf-8	" 设置文件编码

set nobackup
"set noswapfile

set showcmd			" 状态栏显示正在输入的命令

syntax enable
syntax on			"自动语法高亮

set showmatch		"高亮显示匹配的括号

set cursorline		"突出显示当前行

"set ignorecase		"搜索忽略大小写
set hlsearch
set incsearch

set ruler			"显示标尺

set laststatus=2	"1-启动显示状态行 2-总是显示状态行
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

set noeb			"去掉输入错误提示音


"filetype on				"侦测文件类型
"filetype indent on			" 基于文件类型的缩进
"filetype plugin on			" 基于文件类型的插件
filetype plugin indent on	" 自动识别文件类型,启用基于文件类型的插件,启动基于文件类型的自动缩进

set completeopt=longest,menu	" 让补全行为与一般IDE一致


set mouse=a			"使用鼠标
set selection=exclusive
set selectmode=mouse,key


" 自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction


" 新建.c .h .sh .java文件 自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call InsertHeader()"
" 函数SetTitle:自动插入文件头
func InsertHeader()
    ".sh文件
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: ")
        call append(line(".")+2, "\# mail: ")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: ")
        call append(line(".")+2, "    > Mail:  ")
        call append(line(".")+3, "    > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include <iostream>")
        call append(line(".")+7, "")
		call append(line(".")+8, "int main()")
        call append(line(".")+9, "{")
        call append(line(".")+10, "")
        call append(line(".")+11, "    return 0;")
		call append(line(".")+12, "}")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include <stdio.h>")
		call append(line(".")+7, "#include <string.h>")
        call append(line(".")+8, "")
		call append(line(".")+9, "int main(int argc,char *argv[])")
        call append(line(".")+10, "{")
        call append(line(".")+11, "")
        call append(line(".")+12, "    return 0;")
		call append(line(".")+13, "}")
    endif
    "自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc

" YouCompleteMe 配置
set runtimepath+=~/.vim/bundle/YouCompleteMe
let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

let g:ycm_confirm_extra_conf=0	" 关闭加载.ycm_extra_conf.py提示

autocmd InsertLeave * if pumvisible() == 0|pclose|endif		" 离开插入模式自动关闭预览
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"		" 回车选中当前项


" goto之后 Ctrl+o返回
nnoremap <leader>gi :YcmCompleter GoToInclude<CR>				" \gi goto头文件
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>			" \gc goto光标下标识符的声明
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>			" \gf goto光标下标识符的定义
nnoremap <leader><C-g> :YcmCompleter GoToDefinitionElseDeclaration<CR>	
nnoremap <leader>gt :YcmCompleter GoTo<CR>						" \gt
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>			" \gr

let g:ycm_autoclose_preview_window_after_completion=1	" 选中补全选项后自动关闭预览窗口

let g:ycm_min_num_identifier_candidate_chars=2			" 补全库函数,否则只弹出输入过的内容
let g:ycm_semantic_triggers={
	\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
	\ 'cs,lua,javascript': ['re!\w{2}'],
	\ }													" 输入两个字母,即可弹出语义补全

let g:ycm_collect_identifiers_from_tags_files=1			" 开启YCM基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2				" 键入第二个字符开始罗列匹配项
let g:ycm_cache_omnifunc=0								" 禁止缓存匹配项,每次重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1				" 语法关键字补全

let g:ycm_max_num_identifier_candidates=10		" 设置标示符补全的最大候选数量,0表示没有限制
let g:ycm_max_num_candidates=50					" 设置语义补全的最大候选数量,0表示没有限制

let g:ycm_complete_in_strings=1		" 输入注释补全
let g:ycm_complete_in_comments=1	" 输入字符串补全
let g:ycm_collect_identifiers_from_comments_and_strings=1	" 注释和字符串的文字收入补全

set completeopt=longest,menu
let g:ycm_add_preview_to_completeopt=0		" 关闭函数原型提示

let g:ycm_show_diagnostics_ui=0		" 关闭诊断信息



