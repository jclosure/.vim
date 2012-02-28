"set nocompatible              " Use vim defaults
"set ls=2                      " Always show status line
set updatetime=50             "update every n millis
set number                    " Turn on line numbers
set showcmd                   " Show incomplete commands
set scrolloff=3               " Keep 3 lines when scrolling
set ruler                     " Show the cursor position all the time
set title                     " Show title in console title bar
set hid                       " Change buffer without saving
set showmatch                 " Show matching bracets
 
set ts=2                      " Numbers of spaces of tab character
set sw=2                      " Numbers of spaces to (auto)indent
set et                        " Tabs are converted to spaces, use only when required
set sts=2                     " Soft tab stop
set smartindent               " Smart indent
set autoindent
set nocindent
set wrap
 
set hlsearch                  " Highlight searches
set incsearch                 " Do incremental searching
 
if has("autocmd")
au FileType cpp,c,java,sh,pl,php,python,ruby,eruby,javascript set autoindent
au FileType cpp,c,java,sh,pl,php,py,rb,erb,js set smartindent
au FileType cpp,c,java,sh,pl,php,js set cindent
au BufRead *.py set cinwords=if,elif,else,for,while,try,except,finally,def,class
au BufRead *.rb set cinwords=if,elsif,else,unless,for,while,begin,rescue,def,class,module
au BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
au BufRead *.rb set smartindent cinwords=if,elsif,else,unless,for,while,begin,rescue,def,class,module
endif
 
syntax on
"set background=dark
"hi Normal ctermfg=grey ctermbg=darkgrey
"hi PreProc ctermfg=grey
hi Statement ctermfg=darkYellow
hi Type ctermfg=blue
hi Function ctermfg=blue
hi Identifier ctermfg=darkBlue
hi Special ctermfg=darkCyan
hi Constant ctermfg=darkCyan
hi Comment ctermfg=darkGreen
au BufRead,BufNewFile *.rb hi rubySymbol ctermfg=green

highlight Normal guifg=White guibg=Black
highlight Cursor guifg=Black guibg=Yellow
highlight Keyword guifg=#FF6600
highlight Define guifg=#FF6600
highlight Comment guifg=#9933CC
highlight Type guifg=White gui=NONE
highlight rubySymbol guifg=#339999 gui=NONE
highlight Identifier guifg=White gui=NONE
highlight rubyStringDelimiter guifg=#66FF00
highlight rubyInterpolation guifg=White
highlight rubyPseudoVariable guifg=#339999
highlight Constant guifg=#FFEE98
highlight Function guifg=#FFCC00 gui=NONE
highlight Include guifg=#FFCC00 gui=NONE
highlight Statement guifg=#FF6600 gui=NONE
highlight String guifg=#66FF00
highlight Search guibg=White

highlight Pmenu ctermfg=1 ctermbg=4 guibg=grey30

inoremap <tab> <c-n>

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType eruby set omnifunc=rubycomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

let g:rubycomplete_buffer_loading = 1 
let g:rubycomplete_classes_in_global = 1



set background=dark  "makes it easier to read with black background
colorscheme ir_black "set theme in ./vim/colors folder



" NERDTree config
let g:NERDTreeWinPos = "right" "set to appear on right
autocmd VimEnter * NERDTree    "autostart nerdtree
autocmd VimEnter * wincmd p    "places cursor in main win
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\env','\.vim$', '\~$', '\.pyc$', '\.swp$', '\.egg-info$', '^dist$', '^build$']
"let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeHightlightCursorline=1


"auto start taglist
let g:Tlist_Process_File_Always = 1
let g:Tlist_Auto_Open = 1
let g:Tlist_Auto_Update = 1
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'  " Proper Ctags location - installed with homebrew: 'brew install ctags-exuberant'
let Tlist_Exit_OnlyWindow = 1
"let Tlist_WinWidth = 30

"leave no open buffers - exp 
set nohidden

"enable backup 
set backup

"set backup and tmp dirs (note: create them for vim)
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

"set autochdir           "automatically chdir to file dir
set cursorline          "highlight line w/ cursor
"hi CursorLine term=none cterm=none ctermbg=3

set gcr=a:hor1              "use a horizontal 1px 
"blinking
set gcr=a:blinkon500-blinkoff500-blinkwait500


set gcr=n:blinkon0          "causes no blink and block in normal mode
"set gcr=a:blinkon0          "causes no blink and block in normal mode

"remapped toggle keys
nmap <silent> <F9> :TlistToggle<CR>
nmap <silent> <F10> :NERDTreeToggle<CR>

" improves redrawing for newer computers
set tf
set nolazyredraw        " turn off lazy redraw
set nohlsearch          " highlight no search results
set wildmenu
set spelllang=pl,en   " set spelling lang
set clipboard=unnamed   " yank and copy to X clipboard


"                     "
" searching & history "
"                     "
"set hlsearch          " highlight all search results
set incsearch         " increment search
set ignorecase        " case-insensitive search; opposite noignorecase
set smartcase         " uppercase causes case-sensitive search
set wrapscan          " searches wrap back to the top of file

set nobackup          " don't create backup files
set noswapfile        " don't create swap file

set history=50        " keep 50 lines of command line history
set incsearch         " do incremental searching

"disable bell
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=


"CLEAN CLOSE SOLUTION IN WINDOWED MODE
function! CleanClose(tosave)
if (a:tosave == 1)
    w!
endif
let todelbufNr = bufnr("%")
let newbufNr = bufnr("#")
if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
    exe "b".newbufNr
else
    bnext
endif

if (bufnr("%") == todelbufNr)
    new
endif
exe "bd".todelbufNr
endfunction

"advance close without closing multiwindow current window
map fc :call CleanClose(1)<CR>        "use fc in normal mode to save and close
map fq :call CleanClose(0)<CR>        "use fq in normal mode to close no save



func! CompileRunGcc()
  exec "w"
  exec "!if [ -f %:r ] ; then rm %:r ; fi  && gcc % -o %:r && if [ -f %:r ] ; then % ; else  growlnotify -H localhost -m \"unsuccessful\" ; fi ;   "
  exec "i"
endfunc

func! CompileGcc()
  exec "w"
  exec "!if [ -f %:r ] ; then rm %:r ; fi  && gcc % -o %:r && if [ -f %:r ] ; then  growlnotify -i -H localhost -m \"%:r was created.\" ; fi ;  "  
  exec "i"
endfunc


"use gcc as compiler
"nmap <F7> :call CompileRunGcc()<CR>
"nmap <F8> : call CompileGcc()<CR>

"use the SingleCompile plugin
nmap <F7> :SCCompile<cr>
nmap <F8> :SCCompileRun<cr> 
"nmap <F6> :SCViewResult<cr> 

"FOR MINIBUFEXPLORER
"let g:miniBufExplMapWindowNavVim = 1 
"let g:miniBufExplMapWindowNavArrows = 1 
"let g:miniBufExplMapCTabSwitchBufs = 1 
"let g:miniBufExplModSelTarget = 1 

"FOR TABBAR
noremap <f1> :bprev<CR>
noremap <f2> :bnext<CR>

"JSBEAUTIFY
nmap <leader>b :JSBeautify<cr>
