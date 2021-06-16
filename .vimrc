" Specify a directory for plugins
" Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'dpelle/vim-LanguageTool'
Plug 'dracula/vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'maralla/completor.vim'
Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'rhysd/devdocs.vim'
Plug 'ruanyl/vim-fixmyjs'
Plug 'sahibalejandro/vim-php'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'dense-analysis/ale'
Plug 'shawncplus/phpcomplete.vim'
Plug 'sirver/ultisnips'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tlib_vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'

call plug#end()


"------ Console UI & Text display ------"

set nocompatible                        " be improved, required
set encoding=utf-8                      " character encoding used inside vim
set fileencoding=utf-8                  " conversion will be done when writing the file
set cmdheight=1                         " explicitly set the height of the command line
set showcmd                             " shows command in status line.
set number                              " number, relativenumber
set ruler                               " show current position at statusbar
set autoread                            " watch for file changes
set noerrorbells                        " don't whine
set lazyredraw                          " don't redraw while in macros
set wrap                                " soft wrap long lines
set report=0                            " report back on all changes
set shortmess=atI                       " shorten messages and don't show intro
set scrolloff=5                         " keep at least 5 lines above/below
set sidescrolloff=5                     " keep at least 5 lines left/right
set undolevels=1000                     " 1000 undos
set updatecount=80                      " switch every 80 chars
set complete=.,w,b,u,t,i                " do lots of scanning on tab completion
set ffs=unix,dos,mac                    " default file types
set ttyfast                             " we have a fast terminal
set history=200
set shell=zsh
nore ; :
set nobackup nowritebackup noswapfile   " turn backup off

"------ Text editing and searching behavior ------"

set clipboard=unnamedplus               " http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set hlsearch                            " highlighting for searched expressions
set incsearch                           " highlight as we search however
set matchtime=5                         " blink matching chars for .x seconds
set mouse=a                             " enable mouse support in console
set ignorecase                          " set case insensitivity
set smartcase                           " unless there's a capital letter
set completeopt=menu,longest,preview    " more autocomplete <Ctrl>-P options
set nostartofline                       " leave my cursor position alone!
set backspace=2                         " equiv to :set backspace=indent,eol,start
set textwidth=80                        " we like 80 columns
set autoread                            " autoread a file when changed from the outside
set magic                               " for regular expressions
set formatoptions=tcrql                 " t - autowrap to textwidth
                                        " c - autowrap comments to textwidth
                                        " r - autoinsert comment leader with <Enter>
                                        " q - allow formatting of comments with :gq
                                        " l - don't format already long lines


"------ Indents and tabs ------"

set autoindent                          " set the cursor at same indent as line above
set smartindent                         " try to be smart about indenting (C-style)
set smarttab                            " tab and backspace are smart
set expandtab                           " expand <Tab>s with spaces; death to tabs!
set shiftwidth=4                        " spaces for each step of (auto)indent
set softtabstop=4                       " set virtual tab stop (compat for 8-wide tabs)
set tabstop=4                           " for proper display of files with tabs
set shiftround                          " always round indents to multiple of shiftwidth
set copyindent                          " use existing indents for new indents
set preserveindent                      " save as much indent structure as possible
filetype plugin on                      " Enable filetype-specific plugins



"------ With a map leader it's possible to do extra key combinations ------"
let mapleader = ","                     " default is backslash
let g:mapleader = ","                   " default is backslash
nmap <leader>s :w!<cr>                  " fast saving
nmap <leader>n :bn!<cr>                 " next buffer
nmap <leader>d :t.!<cr>                 " duplicate line
nmap <leader>n :bn<cr>                  " next buffer
nmap <leader>p :bp<cr>                  " previous buffer
nmap <leader>w :bw<cr>                  " close current buffer
nmap <leader><space> :nohlsearch<cr>    " deselect highlights
nmap <leader>t :TagbarToggle<CR>        " toggle tagbar
map <leader>ev :tabedit! ~/.vimrc<cr>   " fast editing vimrc
autocmd! bufwritepost vimrc source %s   " source vimrc on save

"------ Syntax Highlighting ------"
syntax enable
set grepprg=grep\ -nH\ $*


hi Normal ctermbg=none

"------ Colorscheme for console & gui ------"
if has("gui_running")
colorscheme dracula
set linespace=4
set showtabline=0
set guifont=Fira\ Code\ Regular\ 18
set guioptions-=T
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
hi linenr guibg=bg
hi foldcolumn guibg=bg
hi vertsplit guifg=bg guibg=bg

function Maximize_Window()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction

else
set t_Co=256
endif

"------ Move cursor together with the screen ------"
"noremap <c-j> j<c-e>
"noremap <c-k> k<c-y>
inoremap jj <Esc>


"------ Enable spell check for text files ------"
:map <F5> :setlocal spell! spelllang=en_us<CR>
inoremap <F5> <C-\><C-O>:setlocal spelllang=en_us spell! spell?<CR>

"------ Status line gnarliness ------"
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]


"------ Syntax Auto Complete ------"
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python3     setlocal omnifunc=pythoncomplete#Complete
autocmd FileType php        setlocal omnifunc=phpcomplete_extended#CompletePHP
autocmd FileType java       setlocal omnifunc=javacomplete#Complete


"------ Indentation ------"
autocmd FileType html       set tabstop=2 | set shiftwidth=2 | set expandtab
autocmd FileType jade       set tabstop=2 | set shiftwidth=2 | set expandtab
autocmd FileType css        set tabstop=2 | set shiftwidth=2 | set expandtab
autocmd FileType less       set tabstop=2 | set shiftwidth=2 | set expandtab
autocmd FileType scss       set tabstop=2 | set shiftwidth=2 | set expandtab
autocmd FileType javascript set tabstop=4 | set shiftwidth=4 | set expandtab

" Wildmenu
if has("wildmenu")
    set wildmenu
    set wildmode=list,longest
    inoremap <C-f> <C-x><C-f>
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.psd
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
endif


" Smart way to move among windows
set splitbelow
set splitright

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"------ Restore cursor position to where it was before ------"

augroup JumpCursorOnEdit
au!
autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
" Need to postpone using "zv" until after reading the modelines.
autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END


" Remove the windows ^M - when the encodings gets messed up
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Emmet keymap
let g:user_emmet_leader_key=','

" UltiSnips
let g:UltiSnipsJumpForwardTrigger="<tab>"

" NERDTree
map <leader>/ :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 0


let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '!'
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)


let g:jsx_ext_required = 0 " Allow JSX in JS files


" PHP CS Fixer
"let g:php_cs_fixer_path = "/usr/local/bin/php-cs-fixer"
"let g:php_cs_fixer_level = "all"             " which level ?
"let g:php_cs_fixer_config = "default"        " configuration
"let g:php_cs_fixer_php_path = "php"          " Path to PHP
"let g:php_cs_fixer_enable_default_mapping = 1
"let g:php_cs_fixer_dry_run = 0
"let g:php_cs_fixer_verbose = 0
"let g:php_cs_fixer_fixers_list = "linefeed"   "linefeed, short_tag, indentation"

" Ignore caching and files|directories for ctrlp
let g:ctrlp_custom_ignore = 'bin\|obj\|vendor\|repo\|venv\|node_modules\|.class\|.git\|.sass-cache\|.tmp\|.idea\|target\|.sqlite3\|.pyc\|__pycache__'

if executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
endif


" Mapping K to search under the word quickly
nmap K <Plug>(devdocs-under-cursor)

" Language Tool configuring the location of the jar file
let g:languagetool_jar='/opt/languagetool/languagetool-commandline.jar'

" delimitMate
let delimitMate_expand_cr = 1

" SuperTab context
"let g:SuperTabDefaultCompletionType = 'context'

" disable scratch preview window
"set completeopt-=preview

"let g:completor_complete_options = 'menuone,noselect,preview'

let g:snipMate = { 'snippet_version': 1 }

augroup VIM_PHP
    autocmd!
        autocmd FileType php nnoremap <Leader>u :PHPImportClass<cr>
        autocmd FileType php nnoremap <Leader>e :PHPExpandFQCNAbsolute<cr>
        autocmd FileType php nnoremap <Leader>E :PHPExpandFQCN<cr>
augroup END
