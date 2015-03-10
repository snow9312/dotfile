set nocompatible        " Must be first line
filetype off "require by Vundle

"--------------------------------------------------------------------------
" Vundle & Plugins settings
"--------------------------------------------------------------------------

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"" Color scheme
Plugin 'chriskempson/base16-vim'

"slimv
"Plugin 'kovisoft/slimv' 
" git wrapper
"Plugin 'tpope/vim-fugitive'

""" Format
"Plugin 'tpope/vim-surround'
"text filtering and alignment
Plugin 'godlygeek/tabular'

""" Enhanced file formats
"Plugin 'plasticboy/vim-markdown'
"Plugin 'elzr/vim-json'

""" Snippets
" snippet engine
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'

"" Misc
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
"Plugin 'jiangmiao/auto-pairs'
"Plugin 'scrooloose/syntastic'
"Plugin 'majutsushi/tagbar'
"Plugin 'ervandew/supertab'

" all of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"--------------------------------------------------------------------------
" Key Mappings 
"--------------------------------------------------------------------------

" modifer key
let mapleader = " "

" Toggle search highlighting
noremap <leader>/ :nohls<cr><c-l>

" insert newline in nornal mode <NL> = <C-J>
nnoremap <NL> i<CR><ESC>

" Code folding options
"nmap <leader>f0 :set foldlevel=0<cr>
"nmap <leader>f1 :set foldlevel=1<cr>
"nmap <leader>f2 :set foldlevel=2<cr>
"nmap <leader>f3 :set foldlevel=3<cr>
"nmap <leader>f4 :set foldlevel=4<cr>
"nmap <leader>f5 :set foldlevel=5<cr>
"nmap <leader>f6 :set foldlevel=6<cr>
"nmap <leader>f7 :set foldlevel=7<cr>
"nmap <leader>f8 :set foldlevel=8<cr>
"nmap <leader>f9 :set foldlevel=9<cr>

"Plugins settings
"--------------------------------------------------------------------------

" omni completion
filetype plugin on
set omnifunc=syntaxcomplete#complete

" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pdf   

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

nnoremap <leader>m :CtrlPMRUFiles<cr>

" slimv
"let g:lisp_rainbow=1

" markdown 
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1 " Highlight YAML frontmatter as used by Jekyll 

" YouCompleteMe
"nnoremap <leader>g :YcmCompleter GoTo<CR>
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"let g:ycm_filetype_blacklist = {
"			\ 'tagbar'    : 1,
"			\ 'qf'        : 1,
"			\ 'notes'     : 1,
"			\ 'markdown'  : 1,
"			\ 'unite'     : 1,
"			\ 'text'      : 1,
"			\ 'vimwiki'   : 1,
"			\ 'gitcommit' : 1,
"\}

" Tags
nnoremap <silent> <Leader>t :TagbarToggle<CR>
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>b :CtrlPBuffer<cr>

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Tabular
nmap <leader>a& :Tabularize /&<CR>
vmap <leader>a& :Tabularize /&<CR>
nmap <leader>a= :Tabularize /=<CR>
vmap <leader>a= :Tabularize /=<CR>
nmap <leader>at :Tabularize /\|<CR>
vmap <leader>at :Tabularize /\|<CR>
vmap <leader>a: :Tabularize /:<CR>
nmap <leader>a:: :Tabularize /:\zs<CR>
vmap <leader>a:: :Tabularize /:\zs<CR>
nmap <leader>a, :Tabularize /,<CR>
vmap <leader>a, :Tabularize /,<CR>

"--------------------------------------------------------------------------
" view  settings
"--------------------------------------------------------------------------
"let base16colorspace=256  " Access colors present in 256 colorspace
set background=dark
"colorscheme 
"colorscheme base16-eighties

" enable syntax hightlighting
syntax on
" enable line numbers
set number
" show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_

if has('statusline')
    set laststatus=2    " always show the status line

    " airline config
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_symbols.branch='⑂'

endif

"set lines=50 " 50 lines of text instead of 24,
"set columns=100

"--------------------------------------------------------------------------
" format settings
"--------------------------------------------------------------------------

set encoding=utf-8 nobomb   " Vim inside encoding (buffer, register...)
set fileencoding=utf-8 nobomb " New file encoding 
" Auto file encoding detection order
set fileencodings=ucs-bom,utf-8,gb2312,gbk,gb18030,big5,euc-jp,euc-kr,latin1 

" common tabs settings
set tabstop=4               " the width of a tab is set to 4.
                            " still it is a \t. it is just that
                            " vim will interpret it to be having
                            " a width of 4.
set softtabstop=4           " sets the number of columns for a tab.
set shiftwidth=4            " indents will have a width of 4.
set expandtab               " expand tabs to spaces.

set autoindent

"enable fold
set foldenable
set foldnestmax=3
set foldmethod=syntax


"--------------------------------------------------------------------------
" GUI settings
"--------------------------------------------------------------------------
if has("gui_running")
    set lines=50 " 50 lines of text instead of 24,
    set columns=100
    set guioptions-=T       " no toolbar
    set guioptions+=m       " Slimv menu
    set go-=r               " no right scrollbar
    set go-=l               " no left scrollbar
    set go-=b               " no bottom scrollbar
    set go-=L               " no scrollbar even if split
    set go-=L               " no scrollbar even if split
    set go-=L               " no scrollbar even if split
    set go-=R               " no scrollbar even if split


    " Make MacVim looks cool
    if has("gui_macvim")
        set guifont=Menlo:h12
    elseif has("gui_gtk2")
    " set guifont=Monospace:h13

    endif
endif


"--------------------------------------------------------------------------
" Functions 
"--------------------------------------------------------------------------

" open markdown file in MacDown.app
function! s:setupMarkup()
    nnoremap <leader>p :silent !open -a MacDown '%:p'<cr>
endfunction

au BufRead,BufNewfile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

"--------------------------------------------------------------------------
" Main settings
"--------------------------------------------------------------------------

"no mouse
"set mouse-=a
set hlsearch                                " Highlight search terms
set ignorecase                              " Case insensitive search
set wildmenu                                " Show list instead of just completing
set wildignore+=*/tmp/*,*.so,*.swp,*.zip    " Ignore file extentions

if exists("+autochdir")
    set autochdir
endif

