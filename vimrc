set nocompatible
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

"let pyTool='/usr/bin/pyTool'
"set pyTool

" required for vundle
" filetype 查看文件类型检测共更能有没有打开
" 如果为on,vim实际上执行的是$vimRUNTIME/filetype.vim脚本
" 这个脚本使用自动命令autocmd来判断文件的类型
" 如果无法根据文件名来判断出文件类型，它又会调用$vimRUNTIME/scripts.vim
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundles from GitHub repos:

" Python and PHP Debugger
Bundle 'fisadev/vim-debug.vim'
" Better file browser
Bundle 'scrooloose/nerdtree'
" Code commenter
Bundle 'scrooloose/nerdcommenter'
" Search and read python documentation
Bundle 'fs111/pydoc.vim'
" Class/module browser
Bundle 'majutsushi/tagbar'
" Code and files fuzzy finder
Bundle 'kien/ctrlp.vim'
" PEP8 and python-flakes checker
Bundle 'nvie/vim-flake8'
" Zen coding
Bundle 'mattn/zencoding-vim'
" Git integration
Bundle 'motemen/git-vim'
" Tab list panel
Bundle 'kien/tabman.vim'
" Powerline
Bundle 'Lokaltog/vim-powerline'
" Terminal Vim with 256 colors colorscheme
Bundle 'fisadev/fisa-vim-colorscheme'
" Consoles as buffers
Bundle 'rosenfeld/conque-term'
" Pending tasks list
Bundle 'fisadev/FixedTaskList.vim'
" Surround
Bundle 'tpope/vim-surround'

"Bundles from vim-scripts repos

" Autocompletition
Bundle 'AutoComplPop'
" Python code checker
Bundle 'pyflakes.vim'
" Search results counter
Bundle 'IndexedSearch'
" XML/HTML tags navigation
Bundle 'matchit.zip'
" Gvim colorscheme
Bundle 'Wombat'

"add by cuiweitei at 2012-12-04
"Bundle 'comments.vim'
"Bundle 'NERD_commenter.vim'
Bundle 'DoxygenToolkit.vim'



" Installing plugins the first time
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

" allow plugins by file type
filetype plugin on
filetype indent on

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
"设置语法高亮
syntax on
" tablength exceptions
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" always show status bar
" 显示状态栏
set ls=2

" incremental search
" 增量搜索
set incsearch

" highlighted search results
" 高亮搜索结果
set hlsearch

" line numbers
" 行号设置
set nu

"设置Backspce键
set backspace=indent,eol,start

" toggle Tagbar display
" 函数类型参数以及类映射
map <F4> :TagbarToggle<CR>
" autofocus on Tagbar open
let g:tagbar_autofocus = 1

" NERDTree (better file browser) toggle
" 浏览文件窗口
map <F3> :NERDTreeToggle<CR>

" tab navigation
"
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm<CR>
map tt :tabnew 
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

" automatically close autocompletition window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" old autocomplete keyboard shortcut
imap <C-J> <C-X><C-O>

" show pending tasks list
map <F2> :TaskList<CR>

" removes trailing spaces of python files
" (and restores cursor position)
autocmd BufWritePre *.py mark z | %s/ *$//e | 'z

" save as sudo
ca w!! w !sudo tee "%"

" colors and settings of autocompletition
highlight Pmenu ctermbg=4 guibg=LightGray
" highlight PmenuSel ctermbg=8 guibg=DarkBlue guifg=Red
" highlight PmenuSbar ctermbg=7 guibg=DarkGray
" highlight PmenuThumb guibg=Black
" use global scope search
let OmniCpp_GlobalScopeSearch = 1
" 0 = namespaces disabled
" 1 = search namespaces in the current buffer
" 2 = search namespaces in the current buffer and in included files
let OmniCpp_NamespaceSearch = 2
" 0 = auto
" 1 = always show all members
let OmniCpp_DisplayMode = 1
" 0 = don't show scope in abbreviation
" 1 = show scope in abbreviation and remove the last column
let OmniCpp_ShowScopeInAbbr = 0
" This option allows to display the prototype of a function in the abbreviation part of the popup menu.
" 0 = don't display prototype in abbreviation
" 1 = display prototype in abbreviation
let OmniCpp_ShowPrototypeInAbbr = 1
" This option allows to show/hide the access information ('+', '#', '-') in the popup menu.
" 0 = hide access
" 1 = show access
let OmniCpp_ShowAccess = 1
" This option can be use if you don't want to parse using namespace declarations in included files and want to add 
" namespaces that are always used in your project.
let OmniCpp_DefaultNamespaces = ["std"]
" Complete Behaviour
let OmniCpp_MayCompleteDot = 0
let OmniCpp_MayCompleteArrow = 0
let OmniCpp_MayCompleteScope = 0
" When 'completeopt' does not contain "longest", Vim automatically select the first entry of the popup menu. You can 
" change this behaviour with the OmniCpp_SelectFirstItem option.
let OmniCpp_SelectFirstItem = 0

" debugger keyboard shortcuts
"map <F5> :Dbg over<CR>
"map <F6> :Dbg into<CR>
"map <F7> :Dbg out<CR>
"map <F8> :Dbg here<CR>
"map <F9> :Dbg break<CR>
"map <F10> :Dbg watch<CR>
"map <F11> :Dbg down<CR>
"map <F12> :Dbg up<CR>

" CtrlP (new fuzzy finder)
" 模糊查询
let g:ctrlp_map = ',e'
nmap ,g :CtrlPBufTag<CR>
nmap ,G :CtrlPBufTagAll<CR>
nmap ,f :CtrlPLine<CR>
nmap ,m :CtrlPMRUFiles<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" CtrlP with default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,d ,wg
nmap ,D ,wG
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
" Don't change working directory
let g:ctrlp_working_path_mode = 0
" Ignore files on fuzzy finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }


" simple recursive grep
command! -nargs=1 RecurGrep lvimgrep /<args>/gj ./**/*.* | lopen | set nowrap
command! -nargs=1 RecurGrepFast silent exec 'lgrep! <q-args> ./**/*.*' | lopen
nmap ,R :RecurGrep 
nmap ,r :RecurGrepFast 
nmap ,wR :RecurGrep <cword><CR>
nmap ,wr :RecurGrepFast <cword><CR>

" run pep8+pyflakes validator
autocmd FileType python map <buffer> ,8 :call Flake8()<CR>
" rules to ignore (example: "E501,W293")
let g:flake8_ignore=""

" don't let pyflakes allways override the quickfix list
let g:pyflakes_use_quickfix = 0

" autoclose (
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
" autoclose [
inoremap        [  []<Left>
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
" autoclose {
inoremap        {  {}<Left>
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

" tabman shortcuts
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'

" use 256 colors when possible
if &term =~? 'mlterm\|xterm\|screen-256'
	let &t_Co = 256
    " color
    colorscheme fisa
else
    " color
    colorscheme delek
endif

" colors for gvim
if has('gui_running')
    colorscheme wombat
endif

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" autocompletition of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest

" to use fancy symbols for powerline, uncomment the following line and use a
" patched font (more info on the README.rst)
" let g:Powerline_symbols = 'fancy'

"iab #// #!/bin/env/python <CR>
"添加文件注释FOR PYTHON 
function AddTitle()
    call setline(1,"#!/usr/bin/python")
    call append(1,"#-*- coding:utf-8 -*-")
    call append(2,"#****************************************************")
    call append(3,"#         Author: nile cui - nile.cui@gmail.com")
    call append(4,"#  " . "Last modified: " . strftime("%Y-%m-%d %H:%M"))
    call append(5,"#       Filename: " . expand("%"))
    call append(6,"#    Description: ")
    call append(7,"#****************************************************")
endf

"头文件注释快捷键添加
"map <F12> :call AddTitle()<CR>
map zsf :call AddTitle()<CR>

"更新头文件注释内修改时间
"/# *"Last modified: /查找#开头，后面更上一些空格，然后是Last modified:的行
"s@.....@@表示替换
"第一个@...@中间的内容该表示原来的时间
"第二个@...@是新的当前时间，由于这个是动态的需要调用函数,用\=来告诉s命令
"\=后面的代码是表达式
"map <F11> :/# *Last modified:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M")@<CR> 
map zst :/# *Last modified:/s@:.*$@\=strftime(": %Y-%m-%d %H:%M")@<CR> 

"取消zsf映射，看看还有没有效果
"unmap zsf

map <F12> <leader>ci
map <F11> <leader>cu


"let loaded_nerd_comments=1


let g:DoxygenToolkit_briefTag_pre="@Synopsis  " 
let g:DoxygenToolkit_paramTag_pre="@Param " 
let g:DoxygenToolkit_returnTag="@Returns   " 
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------" 
let g:DoxygenToolkit_blockFooter="--------------------------------------------------------------------------" 
let g:DoxygenToolkit_authorName="nile cui,nile.cui@gmail.com" 
"let g:DoxygenToolkit_licenseTag="My own license"    <-- !!! Does not end with "\<enter>"
let s:licenseTag="Copyright(C)"
let s:licenseTag=s:licenseTag."For free"
let s:licenseTag=s:licenseTag."All right reserved"
let g:DoxygenToolkit_licenseTag=s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
