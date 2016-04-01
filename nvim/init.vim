" -- vim-plug  --------------------------------------------------------------
" Use vim-plug to manage plugins
call plug#begin('~/.config/nvim/plugged')

" Recommended to install
Plug 'Shougo/vimproc', { 'do': 'make' }

" My Plugins

" Themes
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'jdkanani/vim-material-theme'
Plug 'tomasr/molokai'
Plug 'whatyouhide/vim-gotham'
Plug 'chriskempson/base16-vim'
Plug 'effkay/argonaut.vim'
Plug 'mkarmona/colorsbox'
Plug 'notpratheek/vim-luna'

" Indispensable Plugins
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --tern-completer' }
" Plug 'benekastah/neomake'
Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sjl/gundo.vim'
Plug 'majutsushi/tagbar'
Plug 'epeli/slimux'
Plug 'rking/ag.vim'
Plug 'bling/vim-airline'

" Useful plugins from Tim Pope
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fireplace'

" Python Plugins
" Plug 'pfdevilliers/Pretty-Vim-Python'
Plug 'jmcantrell/vim-virtualenv'
Plug 'hdima/python-syntax'

" Haskell Plugins
Plug 'dag/vim2hs'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'

" Javascript Plugins
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim' " For all JS libraries
Plug 'mxw/vim-jsx' " For ReactJS

" Ruby Plugins
" Plug 'vim-ruby/vim-ruby' " Doesn't work with Neovim yet

" Version control related
Plug 'ludovicchabant/vim-lawrencium'
Plug 'mhinz/vim-signify'

" Various Language Plugings
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'ap/vim-css-color'
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
" Plug 'luochen1990/rainbow'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Keithbsmiley/swift.vim'
" Plug 'scrooloose/nerdtree'
" Plug 'gidj/vim-csyn'
" Plug 'marijnh/tern_for_vim'

" All of your Plugins must be added before the following line
call plug#end()            " required
"-- End vim-plug   --------------------------------------------------------

"-- Filetype Options ----------------------------------------------------
syntax on
filetype on
filetype plugin on
filetype indent on
" let mapleader="," " Change the leader to the comma character

" Function to strip whitespaces on write, while retaining position in the file
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

if has("autocmd")
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
    " Javascript, JSX
    autocmd FileType javascript.jsx set ts=4 sts=4 sw=4 et
    " Python files
    autocmd Filetype python setlocal ts=4 sts=4 sw=4 et
    " C files
    autocmd Filetype c,h setlocal foldmethod=syntax ts=2 sts=2 sw=2 expandtab
    " make files
    autocmd FileType make setlocal noexpandtab
    " Scheme- and Lisp-style files
    autocmd Filetype lisp,scheme setlocal lisp "foldmethod=syntax
    " Ruby
    autocmd FileType ruby,eruby setlocal ts=2 sts=2 sw=2 expandtab
    " Haskell
    autocmd Filetype haskell setlocal omnifunc=necoghc#omnifunc foldlevelstart=20
    " autocmd BufEnter *.hs compiler ghc
    " HTML files
    "autocmd Filetype html,css setlocal ts=2 sts=2 sw=2 expandtab
    " autocmd Filetype jinja setlocal syntax on

    "autocmd FileType * set tabstop=2|set shiftwidth=2|set noexpandtab
    " autocmd Filetype python set foldmethod=indent
endif
"-- End Filetype Options ------------------------------------------------

"-- EClim ---------------------------------------------------------------
" let g:EclimCompletionMethod = 'omnifunc'
" let g:EclimPythonValidate = 0 " Disable validation of python files so syntastic takes over

let g:airline_powerline_fonts=1
let g:airline#extensions#branch#use_vcscommand=1
let g:airline_theme='gruvbox'

let python_highlight_all = 1

" Theme settings
:let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark " Set the background
let g:gruvbox_improved_warnings=1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set backspace=indent,eol,start  " Let backspace cross over end of line
set modeline
set tabstop=4 expandtab shiftwidth=4 softtabstop=4 " Default to 4-space tabs, written in spaces

set splitright " Vertical split to the right
set splitbelow " Horizontal split below

set hlsearch " Hightlight search items
set incsearch " Hightlight search items as they are searched for
set showmatch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set number " Activate line numbering on the left side of the screen
highlight LineNr ctermfg=DarkGrey

set updatetime=1000 " This has syntastic update every second instead of every two
" set synmaxcol=120 " This stops syntax highlighting from trying after column 120
set cursorline " Turn on highlighting of active line:
"set relativenumber

set mouse=a " Turn on mouse mode, for terminals that can use it

set listchars=tab:▸\ ,eol:¬  " Use the same symbols as TextMate for tabstops and EOLs
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

"-- Powerline -----------------------------------------------------------
" Removes delay when exiting Insert Mode
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

set laststatus=2 " Activate persistent status line:
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
" let g:Powerline_symbols = 'fancy'
"-- End Powerline--------------------------------------------------------

"-- Suround -------------------------------------------------------------
"For Django
let b:surround_{char2nr("v")} = "{{ \r }}"
let b:surround_{char2nr("{")} = "{{ \r }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"
"-- End Suround ---------------------------------------------------------

"-- Signify -------------------------------------------------------------
let g:signify_vcs_list = ['hg', 'git']
"-- End Signify----------------------------------------------------------

"-- NeoMake -------------------------------------------------------------
" let g:neomake_error_sign = {
"             \ 'text': '>',
"             \ }
" " hi MyWarningMsg ctermbg=3 ctermfg=0
" let g:neomake_warning_sign = {
"             \ 'text': '⚠',
"             \ }

" autocm! BufWritePost,BufEnter * Neomake
"-- End NeoMake ----------------------------------------------------------
"-- Syntastic -----------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_open=1 " Check on loading the buffer
let g:syntastic_check_on_wq=0 " Don't check on closing the buffer

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby', 'python', 'javascript', 'jinja'],
                           \ 'passive_filetypes': ['puppet', 'java'] }
let g:syntastic_c_compiler = 'clang'
let g:syntastic_c_compiler_options = '-std=c11'
let g:loaded_syntastic_c_gcc_checker = 1

let g:syntastic_enable_signs=1
"let g:syntastic_auto_jump=1
let g:syntastic_python_checkers=['pyflakes']
" let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol= '>' " 'X'  '✗'
let g:syntastic_warning_symbol='⚠'
"-- End Syntastic -------------------------------------------------------

"-- YouCompleteMe -------------------------------------------------------
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_allow_changing_updatetime = 0 " This lets the 1 second option above stand
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_server_log_level = "error"
let g:ycm_semantic_triggers = {'haskell' : ['.']}
" Recommended for Django:
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
" let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
""-- End YouCompleteMe ---------------------------------------------------

"-- Rainbow Parentheses -------------------------------------------------
let g:rainbow_active = 1
let g:rainbow_operators = 1
"-- End Rainbow Parentheses ---------------------------------------------

"-- Gundo Options -------------------------------------------------------
nnoremap <F5> :GundoToggle<CR>
"-- End Gundo Options ---------------------------------------------------

"-- Tabar Options -------------------------------------------------------
nnoremap <F8> :TagbarToggle<CR>
"-- End Tabar Options ---------------------------------------------------

"-- Haskellmode-Vim Options ---------------------------------------------
:let g:haddock_browser="/Applications/Google Chrome.app"
"-- End Haskellmode-Vim Options -----------------------------------------
"
"-- Keymapping ----------------------------------------------------------
" This makes the space bar toggle folding on and off.
noremap <Space> za
vnoremap . :norm.<CR>
"-- End Keymapping ------------------------------------------------------

"-- Slimux --------------------------------------------------------------
" let g:slimux_select_from_current_window=0
let g:slimux_exclude_vim_pane=0
map <C-c><C-c> :SlimuxREPLSendLine<CR>
vmap <C-c><C-c> :SlimuxREPLSendSelection<CR>
"-- End Slimux ----------------------------------------------------------

"-- CtrlP ---------------------------------------------------------------
"-- End CtrlP -----------------------------------------------------------

"" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>
