" vim: foldmethod=marker
" Make Vim more useful
" set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/

" Vundle plugins {{{1
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Functionality {{{2
Plugin 'editorconfig/editorconfig-vim'

Plugin 'tpope/vim-git'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-signify'
Plugin 'bling/vim-airline'

Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'Valloric/YouCompleteMe'

Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" Dynamic eslint exec path
Plugin 'mtscout6/syntastic-local-eslint.vim'

Plugin 'tpope/vim-dispatch'

" Languages {{{2
Plugin 'sheerun/vim-polyglot' "Bunch of lang files
Plugin 'othree/html5.vim'
Plugin 'slim-template/vim-slim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-haml'
Plugin 'digitaltoad/vim-jade'

Plugin 'vim-ruby/vim-ruby'

Plugin 'JulesWang/css.vim'
"Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'wavded/vim-stylus'
Bundle 'genoma/vim-less'

Plugin 'kchmck/vim-coffee-script'
"Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'


Plugin 'tpope/vim-markdown'

Plugin 'othree/javascript-libraries-syntax.vim'

Plugin 'mattn/emmet-vim'

Plugin 'mxw/vim-jsx'
Plugin 'derekwyatt/vim-scala'

Plugin 'fleischie/vim-styled-components'


" Nice fonts things
Plugin 'ryanoasis/vim-devicons'

" Themes {{{2
Plugin 'freeo/vim-kalisi'
Plugin 'altercation/vim-colors-solarized'
Plugin 'cocopon/iceberg.vim'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'mhartington/oceanic-next'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Default settings {{{1
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
if $TMUX == ''
    set clipboard+=unnamed
endif
" Enhance command-line completion
set wildmenu
" Ignore some OSX/Linux files
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*
set wildignore+=*.png,*.jpg,*.o,*.so,*.swp,*.zip,*.tar,*/node_modules/*
" Ignore some Windows files
" set wildignore+=*\\tmp\\*,*.exe
" set wildignore+=*.exe
" Allow cursor keys in insert mode
" set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
"set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
set undodir=~/.vim/undo
endif

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number

" Make tabs as wide as four spaces
set tabstop=4
" Number of spaces used on autoindent
set shiftwidth=4
set smarttab
" tabs to spaces -- because of the python guys
set expandtab
" autoindent on
set autoindent
" Smartindetn on
set smartindent
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
"set mouse-=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
    set relativenumber
    au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3


" GuiFont for devicons
" set guifont=<FONT_NAME>:h<FONT_SIZE>
" Linux
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
" macOS
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11

" Folding -------------------------------------------------------------------------------- {{{1

" set folding
set foldmethod=indent
"set foldnestmax=3
"set nofoldenable
set foldcolumn=3
set foldlevelstart=99

" Space to toggle folds
nnoremap <Space> za
vnoremap <Space> za

" }}}


" Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Enable syntax highlighting
syntax on

" Enable file type detection
filetype plugin indent on

" Set theme:
" For nvim
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme OceanicNext
" let g:airline_theme='oceanicnext'

" Highlight current line
set cursorline
highlight CursorLine ctermbg=235
" highight 81 column
set colorcolumn=81
highlight ColorColumn ctermbg=234


" NetRW/NerdTree settings
""""""""""""""""
" Map NerdTree toggle to netrw (Explore)
" map <Leader>n :Explore<CR>
map <Leader>n :NERDTreeToggle<CR>

let g:netrw_banner=0    " Hide the top banner
" let g:netrw_browse_split=4
" let g:netrw_altv=1      " Open left hand side
" let g:netrw_liststyle= 3 " Tree view

" NERDTress File highlighting
" function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    " exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    " exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
" endfunction

" Javascript
" call NERDTreeHighlightFile('js', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('jsx', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')

" Styles
" call NERDTreeHighlightFile('styl', 'blue', 'none', '#563d7c', '#151515')
" call NERDTreeHighlightFile('css', 'blue', 'none', '#563d7c', '#151515')
" call NERDTreeHighlightFile('less', 'blue', 'none', '#563d7c', '#151515')
" HTML / markup
" call NERDTreeHighlightFile('html', 'Magenta', 'none', '#e44b23', '#151515')
" Other
" call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
" call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')


" NerdCommenter
let NERDSpaceDelims = 1
let NERDRemoveExtraSpaces = 1


" CtrlP Settings  {{{1
""""""""""""""""""
" Ctrlp key binding
map <C-t> :CtrlP<CR>

" Ignore some files and folders
let g:ctrl_p_custom_ignore = {
    \ 'dir' : '\v[\/](node_modules|target|dist)|(\.(git|hg|svn))$',
    \ 'file' : '\v\.(exe|so|dll|class|png|jpg|gif)$',
\}

" CtrlP buffer search
nmap <Leader>bb :CtrlPBuffer<cr>
" }}}

" Key mapping for Ack
map <C-F> :Ack<CR>

" Key mapping for TagBar
"nmap <F8> :TagbarToggle<CR>
set tags=tags;

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-a>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

" let g:UltiSnipsSnippetsDir=

set laststatus=2

" Airline settings (statusbar)
let g:airline_powerline_fonts = 1

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")

        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction

"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        endif
    endif
    return b:statusline_tab_warning
endfunction

"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")

        if !&modifiable
            let b:statusline_long_line_warning = ''
            return b:statusline_long_line_warning
        endif

        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)
    let line_lens = map(getline(1,'$'), 'len(substitute(v:val, "\\t", spaces, "g"))')
    return filter(line_lens, 'v:val > threshold')
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction

" Syntastic settings {{{1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠ "

" JS Checking
let g:syntastic_javascript_checkers = ['eslint']
"autocmd FileType javascript let b:syntastic_checkers = glob('.eslintr*') != '' ? ['eslint'] : ['standard']

" HTML Checking
let g:syntastic_html_tidy_exec = 'tidy5'

" Java
" let g:syntastic_java_javac_autoload_maven_classpath = 1


" AG search
let g:ackprg = 'ag --nogroup --nocolor --column'
" }}}