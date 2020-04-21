set nocompatible 		" be iMproved,required
filetype off			" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are example of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'Vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'suan/vim-instant-markdown'
Plugin 'lilydjwg/fcitx.vim'

" All of your Plugins must be added before the following line
call vundle#end()		" required
filetype plugin indent on	" required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList		- list configured plugin
" :PluginInstall	- install plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo	- searche for foo; append `!` to refresh local cache
" :PluginClean		- confirm removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put you non-Plugin stuff after this line
"
"
"
set background=dark
colorscheme solarized

set number
set ruler
set cursorline
"set cursorcolumn
set hlsearch

set wildmenu
set backspace=2

set laststatus=2
set nowrap

syntax enable
syntax on

filetype indent on

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" indent guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

set foldmethod=syntax
set nofoldenable

" switch *.h to *.cpp
nmap <silent> <Leader>sw :FSHere<cr>

" YCM
let g:ycm_key_list_select_completion=['<Down>']
let g:ycm_key_list_previous_completion=['<Up>']
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
set completeopt-=preview
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_collect_identifiers_from_comments_and_strings=0
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
nnoremap <Leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" tagbar
let tagbar_left=1
nnoremap <Leader>t :TagbarToggle<CR>
let tagbar_width=32
let g:tagbar_compact=1

" NERDTree
nmap <Leader>f :NERDTreeToggle<CR>
let NERDTreeWinSize=32
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1

