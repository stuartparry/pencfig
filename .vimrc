""
"" Base Configuration
""

  "" General Support
  ""
  " Basic options
  set nocompatible                  " Explicitly ditch vi compatibility
  set fileformats=unix,mac,dos      " Support all three in this order
  set noerrorbells                  " Don't make a ridiculous noise
  filetype plugin indent on         " Load filetype plugins/indent settings
  set autochdir                     " Always switch to directory of current file
  " File backup
  set backup                        " Always keep a backup file
  set backupdir=~/.vim/bkup         " Define backup directory
  set directory=~/.vim/temp         " Define temporary file location
  " Visual tools
  set showmatch                     " Show matching brackets
  set novisualbell                  " Don't do any annoying flashing
  set hlsearch                      " Keep last search term highlighted
  set matchtime=6                   " Blink matching brackets for this number of 1/10th sec
  set incsearch                     " Perform incremental search of the search term
  set nostartofline                 " Leave my cursor alone
  " Text formatting
  syntax on                         " Always use syntax highlighting
  set tabstop=4                     " Number of spaces to represent tabs
  set softtabstop=4                " Number of spaces used by commands when performing editing operations
  set shiftwidth=4                  " Two spaces used for each level of indent
  set expandtab                     " Do not insert read real tabs
  set nowrap                        " Do not wrap lines
  set textwidth=0                   " Disable textwidth (it is annoying when having to deal with long lines)
  autocmd BufRead,BufNewFile *        " No real tabs -> They are evil, annoying and should be eliminated
  \ set expandtab
  autocmd BufRead,BufNewFile Makefile " Unless, of course, we happen to be using the Archaic 'Make' and it's evil filled tabfest that is a 'Makefile' 
  \ set noexpandtab
  " Font
  set gfn=DejaVu\ Sans\ Mono\ 10
  " Folding
  set foldenable                    " Enable folding
  set foldmethod=marker             " Use intrusive text markers to delimit folds
  set commentstring=%s
  set foldmarker={{{,}}}
  " Buffers
  set hidden                        " Change buffers without saving
  " Text Editing 
  set backspace=indent,eol,start    " Improve backspace functionallity
  
  "" (G)UI
  ""
  set background=dark                                " Always use dark backgrounds by default
  set showcmd                                        " Display incomplete typed commands 
  set history=1000                                   " Keep 1000 lines of comman line history
  set ruler                                          " Always show cursor position
  set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
  set number                                         " Turn on line numbering
  set numberwidth=5                                  " 1 - 99999 lines available per buffer
  set laststatus=2                                   " Show status
  set lazyredraw                                     " Do not refresh while running macros
  set linespace=0                                    " Don't insert extra space between rows
  set scrolloff=1                                    " Keep 1 lines of context
  set sidescrolloff=1                                " Keep 1 columns of context
  set shortmess=aOs                                  " Tidy up message output

  if has ("gui_running")
    set mousehide                  " Hide cursor while typing
    set go=aegi                    " Set some global GUI options
  else
    if &term == "xterm-color"
      set t_Co=256
      set t_kb=
      set t_ut=
      fixdel
      colorscheme xoria256
    elseif &term == "xterm-256color"
      set t_Co=256
      set t_kb=
      set t_ut=
      fixdel
      colorscheme xoria256
    else
      colorscheme elford
    endif
  endif
   
  "" Vim Tags
  ""
  " Location of tags file used by Vim
"  set tags=.tags,./tags;
  set tags=./tags;

"" Abbrieviations/User Commands
""
  cab hon set hlsearch
"  cab hof set nohlsearch
"  iab vimfold <C-R>=strftime("vim:fdm=marker:fdc = 2")
"  iab fixcs <C-R>=strftime("// FIXME: %y%m%d stuart")
"  iab fixch <C-R>=strftime("# FIXME: %y%m%d stuart")
"  iab fixms <C-R>=strftime("FIXME: %y%m%d - stuart")
"  iab fixbl <C-R>=strftime("/*FIXME*/")
"  iab todocs <C-R>=strftime("// TODO: %y%m%d stuart")
"  iab todoch <C-R>=strftime("# TODO: %y%m%d stuart")
"  iab todoms <C-R>=strftime("TODO: %y%m%d - stuart")
"  iab todobl <C-R>=strftime("/*TODO*/")
"  iab addcs <C-R>=strftime("// ADDED: %y%m%d stuart")
"  iab addch <C-R>=strftime("# ADDED: %y%m%d stuart")
"  iab addms <C-R>=strftime("ADDED: %y%m%d - stuart")
"  iab addbl <C-R>=strftime("/*ADDED stuart*/")
"  iab xxxcs <C-R>=strftime("// XXX: %y%m%d stuart")
"  iab xxxech <C-R>=strftime("# XXX: %y%m%d stuart")
"  iab xxxems <C-R>=strftime("XXX: %y%m%d - stuart")
"  iab xxxebl <C-R>=strftime("/*XXX*/")
"  iab passco <C-R>=strftime("PASS - stuart %d%m%y")
"  iab catxtc <C-R>=strftime("/*CATEGORY: XTC*/")
"  iab catadsl <C-R>=strftime("/*CATEGORY: ADSL*/")
"  iab catvdsl <C-R>=strftime("/*CATEGORY: VDSL*/")
"  iab catgfast <C-R>=strftime("/*CATEGORY: GFAST*/")
"  iab catcomm <C-R>=strftime("/*CATEGORY: COMMON*/")
"  cab remlab s!$!  // <<SP_REMOVE<<! 
"  map <C-F11> :split ~/.vimrc<CR>
"  map <c-F12> :split ~/.vim/user_add/VIM_commands<CR>



  ""
  "" Plugin Settings
  ""

  "" MERDTree
  ""
  if maparg("<Leader>nto") =~ 'NERDTree'
    nunmap <Leader>nto
  endif
  if maparg("<Leader>ntt") =~ 'NERDTreeToggle'
    nunmap <Leader>ntt
  endif
  if maparg("<Leader>ntb") =~ 'NERDTreeFromBookMark'
    nunmap <Leader>ntb
  endif
  if maparg("<Leader>ntf") =~ 'NERDTreeFind'
    nunmap <Leader>ntf
  endif
  if maparg("<Leader>ntm") =~ 'NERDTreeMirror'
    nunmap <Leader>ntm
  endif
  if maparg("<Leader>ntc") =~ 'NERDTreeClose'
    nunmap <Leader>ntc
  endif

  nmap <script> <silent> <unique> <Leader>nto :NERDTree<CR>
  nmap <script> <silent> <unique> <Leader>ntt :NERDTreeToggle<CR>
  nmap <script> <silent> <unique> <Leader>ntb :NERDTreeFromBookMark<CR>
  nmap <script> <silent> <unique> <Leader>ntf :NERDTreeFind<CR>
  nmap <script> <silent> <unique> <Leader>ntm :NERDTreeMirror<CR>
  nmap <script> <silent> <unique> <Leader>ntc :NERDTreeClose<CR>

  "" VCSCommand
  ""
  let g:VCSCommandSVNExec = "/tools/bin/svn"

  "" VimWiki Settings
  ""
  let g:vimwiki_list = [ { 'path': '~/.vimwiki/', 'index': 'Main', 'path_html': '~/.vimwiki/html/' },
                       \ { 'path': '~/restricted/.vimwiki/', 'index': 'MainRestricted', 'path_html': '~/restricted/.vimwiki/html/' } ]

""
"" Autocmds
""
  if !exists("autocommands_loaded")
    let autocommands_loaded = 1

    "" General Autocommands
    ""

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

    autocmd Filetype verilog setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

  endif
