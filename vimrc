set nocompatible                " choose no compatibility with legacy vi
filetype off                   " required!

set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-surround.git'
Plugin 'tpope/vim-sensible'
Plugin 'kien/ctrlp.vim.git'
Plugin 'scrooloose/nerdtree.git'
Plugin 'tomtom/tcomment_vim.git'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'grep.vim'

" code snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

Plugin 'bling/vim-airline'
" will automatically populate the g:airline_symbols dictionary with the
" powerline symbols
let g:airline_powerline_fonts = 1
Plugin 'powerline/fonts'

Plugin 'Chiel92/vim-autoformat'
Plugin 'chrisbra/csv.vim'

Plugin 'scrooloose/syntastic'
" This does what it says on the tin. It will check your file on open too,
" not just on save.
" You might not want this, so just leave it out if you don't.
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_exec='c:\tidy2\tidy.exe'

Plugin 'Valloric/YouCompleteMe'
" These are the tweaks I apply to YCM's config, you don't need them but they
" might help.
" YCM gives you popups and splits by default that some people might not like,
" so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

Plugin 'marijnh/tern_for_vim'

Plugin 'Lokaltog/vim-distinguished'

" vim-scripts repos
Plugin 'L9'
Plugin 'vm.vim'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
"
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
"" Gui language
language mes en
set langmenu=en_US.UTF-8

" set guifont=Bitstream\ Vera\ Sans\ Mono:h11
set guifont=Anonymice\ Powerline:h13
" set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h13
" set guifont=Droid\ Sans\ Mono\ for\ Powerline:h12
" set guifont=Source\ Code\ Pro\ Medium:h13
" set guifont=Source\ Code\ Pro\ Light:h13
" set guifont=Source\ Code\ Pro\ ExtraLight:h13
colo distinguished
set number " show line numbers
nnoremap Q <nop>
set vb t_vb= " don't flash
set cursorline " highlight the line of the cursor
set scrolloff=3 " have some context around the current line always on screen
set list " Show invisible characters
set noswapfile

set tags=tags;/ " This will check the current folder for tags file and keep going one directory up all the way to the root folder.

let mapleader=","

" yank/paste to/from system clipboard
map <leader>y "*y
map <leader>p "*p
" new line below/over
nmap <leader>o o<Esc>
nmap <leader>O O<Esc>
" paste lines from unnamed register and fix indentation
nmap <leader>m gt
nmap <leader>n gT
nmap <leader>v "+p
map <leader>e :NERDTreeToggle<CR>

" autoformatter as in Intellij IDEA
map <leader>a :Autoformat<CR>

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

" Mapping ESC in insert mode and command mode to double i
" imap ii <C-[>
" cmap ii <C-[>
nmap ; :

" up and down in command line mode
cmap <C-j> <Down>
cmap <C-k> <Up>

" gvim map F11 to full screen toggle
" map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
" if has('gui_running') && has('libcall')
"     let g:MyVimLib = "gvimfullscreen.dll"
"     function ToggleFullScreen()
"         call libcallnr(g:MyVimLib, "ToggleFullScreen", 0)
"     endfunction
"
"     "Alt+Enter
"     map <A-Enter> <Esc>:call ToggleFullScreen()<CR>
"
"     let g:VimAlpha = 240
"     function! SetAlpha(alpha)
"         let g:VimAlpha = g:VimAlpha + a:alpha
"         if g:VimAlpha < 180
"             let g:VimAlpha = 180
"         endif
"         if g:VimAlpha > 255
"             let g:VimAlpha = 255
"         endif
"         call libcall(g:MyVimLib, 'SetAlpha', g:VimAlpha)
"     endfunction
"
"     "Shift+Y
"     nmap <s-y> <Esc>:call SetAlpha(3)<CR>
"     "Shift+T
"     nmap <s-t> <Esc>:call SetAlpha(-3)<CR>
"
"     let g:VimTopMost = 0
"     function! SwitchVimTopMostMode()
"         if g:VimTopMost == 0
"             let g:VimTopMost = 1
"         else
"             let g:VimTopMost = 0
"         endif
"         call libcall(g:MyVimLib, 'EnableTopMost', g:VimTopMost)
"     endfunction
"
"     "Shift+R
"     nmap <s-r> <Esc>:call SwitchVimTopMostMode()<CR>
" endif

set splitright
set splitbelow

" disable cursor keys in normal mode
map <Left> :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up> :echo "no!"<cr>
map <Down> :echo "no!"<cr>
imap <Left> <nop>
imap <Right> <nop>
imap <Up> <nop>
imap <Down> <nop>

" String to put at the start of lines that have been wrapped.
set showbreak=>\ 

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

" Auto-reload buffers when file changed on disk
set autoread

"" File encoding
set bomb " Some applications use the BOM to recognize the encoding of the file.
set encoding=utf-8 " Sets the character encoding used inside Vim.
set fileencoding=utf-8 " Sets the character encoding for the file of this buffer.
set fileencodings=ucs-bom,utf8,prc,latin1,default

"" Default indentation rules
set expandtab
set shiftwidth=2
set softtabstop=2
set wrap                      " wrap lines

"" Searching
set hlsearch
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set gdefault                    " have :s///g flag by default on

function! s:setupWrapping()
    set wrap
    set wrapmargin=2
    set textwidth=79
endfunction

augroup vimrcEx
    " Clear all autocmds in the group
    autocmd!
    " Avoid showing trailing whitespace when in insert mode
    au InsertEnter * :set listchars-=trail:•
    au InsertLeave * :set listchars+=trail:•
    " Some file types use real tabs
    au FileType {make,gitconfig} set noexpandtab
    " Make sure all markdown files have the correct filetype set and setup wrapping
    au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | setlocal filetype=markdown | call s:setupWrapping()
    " Treat JSON files like JavaScript
    au BufNewFile,BufRead *.json setf javascript
    " https://github.com/sstephenson/bats
    au BufNewFile,BufRead *.bats setf sh
    " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
    au FileType python setl softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
    " make Ruby files follow standard indenting
    au FileType ruby setl softtabstop=2 tabstop=2 shiftwidth=2 textwidth=79
    " make JavaScript files follow standard indenting
    au FileType JavaScript setl softtabstop=2 tabstop=2 shiftwidth=2 textwidth=79
    " HTML file indentation
    au FileType HTML setl softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
    " make XML files fold
    let g:xml_syntax_folding=1
    au FileType xml setlocal foldmethod=syntax
    " make CSS files fold
    autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,} filetype=css
    " mark Jekyll YAML frontmatter as comment
    au BufNewFile,BufRead *.{md,markdown,html,xml} sy match Comment /\%^---\_.\{-}---$/
    " magic markers: enable using `H/S/J/C/V to jump back to
    " last HTML, stylesheet, JS, [Ruby,Java] or Velocity code buffer
    au BufLeave *.{erb,html,jsp,jspf,xhtml} exe "normal! mH"
    au BufLeave *.{css,scss,sass} exe "normal! mS"
    au BufLeave *.{js,coffee} exe "normal! mJ"
    au BufLeave *.{rb,java} exe "normal! mC"
    au BufLeave *.{vm} exe "normal! mV"
    au BufLeave *.{xml,properties} exe "normal! mX"
augroup END

" set ssop-=options    " do not store global and local values in a session
" set ssop-=folds      " do not store folds

if has("statusline") && !&cp
    set laststatus=2 " always show the status bar
    set statusline=%<%1*\ %f\ %* " filename
    set statusline+=%2*%m%r%* " modified, readonly
    set statusline+=\ %3*%y%* " filetype
    set statusline+=%5*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
    set statusline+=%5*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
    set statusline+=%8*\ %{&ff}\                              "FileFormat (dos/unix..)
    set statusline+=\ %4*%{fugitive#head()}%0*
    set statusline+=%=                                        " left-right separation point
    set statusline+=\ %5*%l%*/%L[%p%%]                        " current line/total lines
    set statusline+=\ %5*%v%*[0x%B]                           " current column [hex char]
endif

" limits GUI settins to
" 'g'	Grey menu items: Make menu items that are not active grey.
" 't'	Include tearoff menu items.
" 'm'	Menu bar is present.
set guioptions=gt

"" TODO review color settings
"hi StatusLine term=inverse,bold cterm=NONE ctermbg=24 ctermfg=189
"hi StatusLineNC term=inverse,bold cterm=NONE ctermbg=24 ctermfg=153
"hi hl-SpecialKey guifg=#112605 guibg=#aefe7B

" TODO review color settings in status line
"hi User1 guifg=#ffdad8  guibg=#880c0e
"hi User2 guifg=#000000  guibg=#F4905C
"hi User3 guifg=#292b00  guibg=#f4f597
"hi User4 guifg=#112605  guibg=#aefe7B
"hi User5 guifg=#051d00  guibg=#7dcc7d
"hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
"hi User8 guifg=#ffffff  guibg=#5b7fbb
"hi User9 guifg=#ffffff  guibg=#810085
"hi User0 guifg=#ffffff  guibg=#094afe

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
