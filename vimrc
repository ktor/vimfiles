set nocompatible               " choose no compatibility with legacy vi
filetype off                   " required!
let mapleader="\<Space>"       " must be set before mappings

" Paths
set rtp+=~/vimfiles/bundle/Vundle.vim/
set rtp+=~/vimfiles/ktor-snippets/
let path='~/vimfiles/bundle'

" -----------------------------------------------------------------------------------------
" -----------------------------------------------------------------------------------------
"                                  Plugins management
" -----------------------------------------------------------------------------------------
" -----------------------------------------------------------------------------------------

" Plugins management initialization
call vundle#begin(path)
Plugin 'gmarik/Vundle.vim' " required!

" -----------------------------------------------------------------------------------------
"                                  Plugins - workflow features
" -----------------------------------------------------------------------------------------

" Sensible vim settings from tpope
Plugin 'tpope/vim-sensible'

" Save and restore open buffers/tabs
Plugin 'xolox/vim-misc' " dependency of vim-session
Plugin 'xolox/vim-session'
let g:session_autosave = 'yes'
let g:session_autoload = 'no'

" -----------------------------------------------------------------------------------------
"                                  Plugins - movement
" -----------------------------------------------------------------------------------------
" Move to a specific
Plugin 'yangmillstheory/vim-snipe'
" vim-snipe movements
map <leader><leader>F <Plug>(snipe-F)
map <leader><leader>f <Plug>(snipe-f)
map <leader><leader>T <Plug>(snipe-T)
map <leader><leader>t <Plug>(snipe-t)

map <leader><leader>w <Plug>(snipe-w)
map <leader><leader>W <Plug>(snipe-W)
map <leader><leader>e <Plug>(snipe-e)
map <leader><leader>E <Plug>(snipe-E)
map <leader><leader>b <Plug>(snipe-b)
map <leader><leader>B <Plug>(snipe-B)
map <leader><leader>ge <Plug>(snipe-ge)
map <leader><leader>gE <Plug>(snipe-gE)

nmap <leader><leader>r <Plug>(snipe-f-r)
nmap <leader><leader>R <Plug>(snipe-F-r)

nmap <leader><leader>x <Plug>(snipe-f-x)
nmap <leader><leader>X <Plug>(snipe-F-x)

nmap <leader><leader>] <Plug>(snipe-f-xp)
nmap <leader><leader>[ <Plug>(snipe-f-xp)

" -----------------------------------------------------------------------------------------
"                                  Plugins - visual features
" -----------------------------------------------------------------------------------------

" Stats
Plugin 'wakatime/vim-wakatime'

" Ctrl c c to copy text from left pane vim to right pane in tmux
Plugin 'jpalardy/vim-slime'
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}

" Outline support
Plugin 'Tagbar'

" Visually displaying indent levels
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors = 1
let g:indent_guides_enable_on_vim_startup = 1

" Very nice status line
Plugin 'bling/vim-airline'
" will automatically populate the g:airline_symbols dictionary with the
" powerline symbols
let g:airline_powerline_fonts = 1
" let g:airline_theme='light'
let g:airline_theme = 'pencil'

" Distraction free vim writing
" Usage: :Goyo
Plugin 'junegunn/goyo.vim'

" Themes and fonts
Plugin 'powerline/fonts'
Plugin 'croaky/vim-colors-github'
Plugin 'altercation/vim-colors-solarized'
Plugin 'reedes/vim-colors-pencil'
let g:pencil_terminal_italics = 1
let g:pencil_gutter_color = 1
let g:pencil_neutral_headings = 1
let g:pencil_higher_contrast_ui = 0
let g:pencil_spell_undercurl = 1

" Undotree https://github.com/mbbill/undotree
Plugin 'mbbill/undotree'

" Git support
Plugin 'tpope/vim-fugitive'

" "Gutter" (sign column on the left) support
Plugin 'airblade/vim-gitgutter'

" Fuzzy search and open files in repository
" Usage:
"  Press <c-p> to pop up search window
"  Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
"  Press <c-f> and <c-b> to cycle between modes.
" Plugin 'kien/ctrlp.vim.git'
" let g:ctrlp_max_files = 0
" let g:ctrlp_max_depth = 40
" 
" let g:ctrlp_cmd = 'CtrlPMixed'
" 
" if executable('rg')
"   " Use ripgrep
"   let g:EasyGrepCommand=1
"   set grepprg=rg\ --vimgrep\ -i
"   " Use ag in CtrlP for listing files. Lightning fast, respects .gitignore
"   " and .agignore.
"   let g:ctrlp_user_command = ['.git','rg --color never --files %s']
" else
"   "ctrl+p ignore files in .gitignore
"   let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
" endif

" Fuzzy file finder
Plugin 'junegunn/fzf.vim'
nnoremap <C-p> :Files<Cr>
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" BufExplorer Help
" Usage: <leader>be
Plugin 'bufexplorer.zip'

" File explorer window
Plugin 'scrooloose/nerdtree.git'
" <leader>r - show tree
" <leader>f - reveal current file in tree
map <leader>n :NERDTreeToggle<CR>
map <leader>f :NERDTreeFind<CR>
map <leader>t :TagbarToggle<CR>

" -----------------------------------------------------------------------------------------
"                                  Plugins - languages and frameworks
" -----------------------------------------------------------------------------------------
" Nix support
Plugin 'LnL7/vim-nix'

" Ledger support
" Plugin 'ledger/vim-ledger'

" JavaScript support
Plugin 'pangloss/vim-javascript'
" Plugin 'othree/javascript-libraries-syntax.vim'

" AngularJS support
" Plugin 'matthewsimo/angular-vim-snippets'
" Plugin 'burnettk/vim-angular'

" Jasmine suppport
" Plugin 'claco/jasmine.vim'

" Universal language client support
Plugin 'autozimu/LanguageClient-neovim'
set rtp+=~/vimfiles/LanguageClient-neovim
let g:LanguageClient_serverCommands = { 'haskell': ['hie-wrapper','-d','-l','hie-server.log','--lsp'] }
let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nmap <leader>lk :call LanguageClient#textDocument_hover()<CR>
nmap <leader>lg :call LanguageClient#textDocument_definition()<CR>
nmap <leader>lr :call LanguageClient#textDocument_rename()<CR>
nmap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
nmap <leader>lb :call LanguageClient#textDocument_references()<CR>
nmap <leader>la :call LanguageClient#textDocument_codeAction()<CR>
nmap <leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

" Typescript
" Plugin 'Quramy/tsuquyomi' " typescript plugin
" let g:tsuquyomi_disable_quickfix = 1
" let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
Plugin 'leafgarland/typescript-vim' " typescript syntax highlight
Plugin 'Quramy/vim-js-pretty-template' " provides syntax highlight for content in Template Strings
" Plugin 'mhartington/vim-typings' " provides .d.ts management for typings users.

" Elm support
Plugin 'elmcast/elm-vim' " elm plugin
" elm - starts with <leader>e
let g:elm_format_autosave = 1
" nmap <leader>em :ElmMake<CR>
" nmap <leader>ef :ElmFormat<CR>
" nmap <leader>ed :ElmShowDocs<CR>
" nnoremap <leader>el :ElmEvalLine<CR>
" vnoremap <leader>es :<C-u>ElmEvalSelection<CR>
" nnoremap <leader>em :ElmMakeCurrentFile<CR>


" Logstash configuration support
Plugin 'logstash.vim'

" SCSS support
Plugin 'cakebaker/scss-syntax.vim'

" -----------------------------------------------------------------------------------------
"                                  Plugins - editing
" -----------------------------------------------------------------------------------------

Plugin 'editorconfig/editorconfig-vim'

" TComment Help
" Usage: gc in visual mode - toggle comment on selected code block
Plugin 'tomtom/tcomment_vim.git'

" automatic closing of quotes, parenthesis, brackets, etc.
Plugin 'Raimondi/delimitMate'

" Quickly create and modify quotes,parentesis etc.
"
" tpope surround cheatsheet
"   normal mode:
"     ys to create surround
"     cs to change surround
"     ds to delete surround
"   visual mode:
"     S  to create surround
Plugin 'tpope/vim-surround.git'

" CamelCaseMotion Help
"  <leader>w <leader>b and <leader>e
Plugin 'camelcasemotion'

" Similar to sublime text multiline editing
Plugin 'terryma/vim-multiple-cursors'

" Grep support (https://github.com/dkprice/vim-easygrep)
" Plugin 'dkprice/vim-easygrep'

" Ripgrep support
Plugin 'jesseleite/vim-agriculture'
nmap <Leader>/ <Plug>RgRawSearch
vmap <Leader>/ <Plug>RgRawVisualSelection
nmap <Leader>* <Plug>RgRawWordUnderCursor

" Create parent directories on file write
Plugin 'DataWraith/auto_mkdir'

" Rename in place support
" Usage: :saveas new_filename
Plugin 'Rename'

" Code snippets support
" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'
" Plugin 'honza/vim-snippets'
" imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
" smap <C-J> <Plug>snipMateNextOrTrigger

" Auto formatting support
" Usage: <leader>a
Plugin 'Chiel92/vim-autoformat'
" autoformatter as in Intellij IDEA
map <leader>a :Autoformat<CR>

" CSV support
Plugin 'chrisbra/csv.vim'

" Syntax checking support
Plugin 'scrooloose/syntastic'
" This does what it says on the tin. It will check your file on open too,
" not just on save.
" You might not want this, so just leave it out if you don't.
let g:syntastic_check_on_open=0
" let g:syntastic_html_tidy_exec='c:\tidy2\tidy.exe'
let g:syntastic_html_tidy_exec='tidy'
let g:syntastic_haml_checkers = ['haml_lint']
let g:syntastic_haskell_checkers = ['hlint']
let g:syntastic_java_checkers = ['']
let g:syntastic_sh_checkers = ['']


Plugin 'Lokaltog/vim-distinguished'

" vim-scripts repos
Plugin 'L9'

Plugin 'vm.vim'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
"call vundle#config#require(g:bundles)

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" -----------------------------------------------------------------------------------------
" -----------------------------------------------------------------------------------------
"                                  General Vim settings
" -----------------------------------------------------------------------------------------
" -----------------------------------------------------------------------------------------

" Theme settings
set background=light
colorscheme pencil

syntax enable

"" Gui language
language mes en_US.UTF-8
set langmenu=en_US.UTF-8

set guifont=Anonymice\ Powerline:h13
set linespace=5

nnoremap Q <nop>

set vb t_vb= " don't flash
set cursorline " highlight the line of the cursor
set scrolloff=3 " have some context around the current line always on screen
set noswapfile
" set big history
set history=10000
" set whitespace characters
set list

" This will check the current folder for tags file and keep going one directory up all the way to the root folder.
set tags=tags;/
set foldlevelstart=20


" map default register to system clipboard on windows
set clipboard=unnamed
set clipboard+=unnamedplus

set splitright
set splitbelow

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir

" Auto-reload buffers when file changed on disk
set autoread

" Working with editors/IDEs supporting “safe write” (https://webpack.github.io/docs/webpack-dev-server.html)
set backupcopy=yes

"" File encoding
set nobomb " Some applications use the BOM to recognize the encoding of the file.
set encoding=utf-8 " Sets the character encoding used inside Vim.
set fileencoding=utf-8 " Sets the character encoding for the file of this buffer.
set fileencodings=utf8,ucs-bom,prc,latin1,default

"" Default indentation rules
set expandtab
set shiftwidth=2
set softtabstop=2
set wrap                      " wrap lines
"set nonumber

" toggle hybrid line numbers
set number! relativenumber!
set nu! rnu!
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"" Searching
set hlsearch
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set gdefault                    " have :s///g flag by default on

" -----------------------------------------------------------------------------------------
"                                  General Vim settings - macros and mappings
" -----------------------------------------------------------------------------------------

" Macro used in auto command for markdown files
function! s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=79
endfunction

" Automatic commands based on filetype or extension
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  " Some file types use real tabs
  au FileType {make,gitconfig} set noexpandtab
  " Make sure all markdown files have the correct filetype set and setup wrapping
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | setlocal filetype=markdown | call s:setupWrapping()
  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json setf javascript
  " https://github.com/sstephenson/bats
  au BufNewFile,BufRead *.bats setf sh
  " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python setl softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79 foldmethod=syntax
  " make Ruby files follow standard indenting
  au FileType ruby setl softtabstop=2 tabstop=2 shiftwidth=2 textwidth=79 foldmethod=syntax
  " make JavaScript files follow standard indenting
  au FileType JavaScript setl softtabstop=2 tabstop=2 shiftwidth=2 textwidth=79 foldmethod=syntax
  " HTML file indentation
  au FileType HTML setl softtabstop=4 tabstop=4 shiftwidth=4 foldmethod=syntax
  " make XML files fold
  let g:xml_syntax_folding=1
  au FileType xml setlocal foldmethod=syntax
  " make Java files fold
  au FileType java setlocal softtabstop=2 tabstop=2 shiftwidth=2 textwidth=100 foldmethod=syntax
  " make CSS files fold
  autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}
  " set ledger filetype
  autocmd BufRead,BufNewFile *.journal setlocal filetype=ledger
  " set css filetype
  autocmd BufRead,BufNewFile *.css setlocal filetype=css
  " set scss file type
  autocmd BufRead,BufNewFile *.scss setlocal filetype=scss
  " mark Jekyll YAML frontmatter as comment
  au BufNewFile,BufRead *.{md,markdown,html,xml} sy match Comment /\%^---\_.\{-}---$/
  " jboss configuration file validation
  autocmd BufNewFile,BufRead standalone.xml call s:xml_validate()
  function! s:xml_validate()
    let g:syntastic_xml_xmllint_args = "--schema c:\\EAP-6.3\\jboss-eap-6.3\\docs\\schema\\jboss-as-config_1_6.xsd"
  endfun
  " magic markers: enable using `H/S/J/C/V to jump back to
  " last HTML, stylesheet, JS, [Ruby,Java] or Velocity code buffer
  au BufLeave *.{erb,html,jsp,jspf,xhtml} exe "normal! mH"
  au BufLeave *.{css,scss,sass} exe "normal! mS"
  au BufLeave *.{js,coffee} exe "normal! mJ"
  au BufLeave *.{rb,java} exe "normal! mC"
  au BufLeave *.{vm} exe "normal! mV"
  au BufLeave *.{xml,properties} exe "normal! mX"
augroup END

" reload vimrc after saving
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" copy all matched hits
function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/ge
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

" Save file as admin
" Usage: :w!!
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" beautifiers, used mainly for code copy pasted in new buffer
" beautify xml
nmap <leader>bx :set filetype=xml<CR>:%!xmllint --format -<CR>
" beautify json
nmap <leader>bj :set filetype=json<CR>:%!python -m json.tool<CR>
" beautify css
nmap <leader>bc :set filetype=css<CR>:%!python -m css.tool<CR>
" beautify html
nmap <leader>bh :set filetype=html<CR>:%!tidy -q -i --show-errors 0 --indent yes<CR>

" Convert slashes to backslashes for Windows.
if has('win32')
  nmap <leader>cs :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
  nmap <leader>cl :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>

  " This will copy the path in 8.3 short format, for DOS and Windows 9x
  nmap <leader>c8 :let @*=substitute(expand("%:p:8"), "/", "\\", "g")<CR>
else
  nmap <leader>cs :let @*=expand("%")<CR>
  nmap <leader>cl :let @*=expand("%:p")<CR>
endif

" paste lines from unnamed register and fix indentation
nmap <leader>v "+p

" new line below/over
nmap <leader>o o<Esc>
nmap <leader>O O<Esc>

" next / previous error
nmap <leader>cp :cp<CR>
nmap <leader>cn :cn<CR>

" windows movements
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
map <A-h> <C-W>h
map <A-j> <C-W>j
map <A-k> <C-W>k
map <A-l> <C-W>l
nmap <C-C> <C-W>c
nmap <C-N> <C-W>n
nmap <C-S> <Esc>:w<CR>

" up and down in command line mode
cmap <C-j> <Down>
cmap <C-k> <Up>

" -----------------------------------------------------------------------------------------
"                                  General Vim settings - GUI specific
" -----------------------------------------------------------------------------------------

" limits GUI settins to
" 'g'   Grey menu items: Make menu items that are not active grey.
" 't'   Include tearoff menu items.
" 'm'   Menu bar is present.
set guioptions=gt

" resize font with Ctrl-Up and Ctrl-Down
nnoremap <C-Up> :silent! let &guifont = substitute(
      \ &guifont,
      \ ':h\zs\d\+',
      \ '\=eval(submatch(0)+1)',
      \ '')<CR>
nnoremap <C-Down> :silent! let &guifont = substitute(
      \ &guifont,
      \ ':h\zs\d\+',
      \ '\=eval(submatch(0)-1)',
      \ '')<CR>

" -----------------------------------------------------------------------------------------
"                                  General Vim settings - Microsoft Windows specific
" -----------------------------------------------------------------------------------------

" gvim map F11 to full screen toggle
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>

