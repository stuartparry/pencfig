""
"" Base Configuration
""

  "" General Support
  ""
  " Basic options
  set nocompatible                  " Explicitly ditch vi compatibility
  set fileformats=unix,mac,dos      " Support all three in this order
  set noerrorbells                  " Don't make a ridiculous noise
  set autochdir                     " Always switch to directory of current file
  " File backup
  set backup                        " Always keep a backup file
  set backupdir=~/._vim_bkup_       " Define backup directory
  set directory=~/._vim_temp_       " Define temporary file location
  " Visual tools
  set showmatch                     " Show matching brackets
  set novisualbell                  " Don't do any annoying flashing
  set hlsearch                      " Keep last search term highlighted
  set matchtime=6                   " Blink matching brackets for this number of 1/10th sec
  set incsearch                     " Perform incremental search of the search term
  set nostartofline                 " Leave my cursor alone
  " Text formatting
  syntax on                         " Always use syntax highlighting
  set shiftwidth=4                  " Four spaces used for each level of indent
  set expandtab                     " No real tabs
  set nowrap                        " Do not wrap lines
  set textwidth=0                   " Disable textwidth (it is annoying when having to deal with long lines)
  set tabstop=8                     "
  set softtabstop=8
  autocmd BufRead,BufNewFile *        " No read tabs -> They are evil, annoying and should be eliminated
  \ set expandtab
  autocmd BufRead,BufNewFile Makefile " ...unless, of course, we happen to be using the Archaic 'Make' and it's evil fillled 'tabfest' that is a Makefile
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
  " Text editing 
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
    colorscheme molokai
    set mousehide                  " Hide cursor while typing
    set go=abegimrLtT              " Set some global GUI options
  else
    if &term == "xterm-color"
      set t_Co=256
      set t_kb
      set t_ut=
      colorscheme xoria256
    elseif &term == "xterm-256color"
      set t_Co=256
      set t_kb=
      set t_ut=
      colorscheme xoria256
    endif
  endif
  
  "" Vim Tags
  ""
  set tags=.tags,.tags; 


""  
"" Plugins
""
  filetype off
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()

  " Vundle manages Vundle
  Bundle 'gmarik/vundle'

  " List of bundles (repos on github):
  Bundle 'vim-scripts/Align'
  Bundle 'vim-scripts/zoom.vim'
"  Bundle 'vim-scripts/bash-support.vim'
  Bundle 'vim-scripts/bufexplorer.zip'
  Bundle 'vim-scripts/bufkill.vim'
  Bundle 'vim-scripts/calendar.vim'
  Bundle 'vim-scripts/compview'
"  Bundle 'vim-scripts/slimv.vim'
  Bundle 'kovisoft/slimv'
  Bundle 'vim-scripts/taglist.vim'
  Bundle 'vim-scripts/TaskList.vim'
  Bundle 'vim-scripts/vimwiki'
  Bundle 'vim-scripts/vcscommand.vim'
  Bundle 'vim-scripts/YankRing.vim'
  Bundle 'eagletmt/ghcmod-vim'
  Bundle 'edsono/vim-matchit'
  Bundle 'Slashbunny/vim-colorsamplerpack'
  filetype plugin indent on         " Load filetype plugins/indent settings

  "" VCSCommand
  ""
  let g:VCSCommandSVNExec = "/usr/bin/svn"

  "" VimWiki Settings
  ""
  let g:vimwiki_list = [ { 'path': '~/.vimwiki/', 'index': 'GlobalTODO' }, { 'path': '~/.vimwiki/', 'index': 'Projects'}, {'path': '~/.vimwiki/', 'index': 'Self'} ]

  "" Slimv
  ""
  let g:slimv_preferred = 'sbcl'
"  let g:slimv_swank_cmd = '! xterm -e clisp -i /home/stuart/.vim/bundle/slimv.vim/.myslime/start-swank.lisp &'
  let g:slimv_swank_cmd = '! urxvt -e sbcl --load /home/stuart/.vim/bundle/slimv.vim/slime/start-swank.lisp &'
"  let g:slimv_swank_cmd = '! urxvt -e sbcl --load /usr/share/common-lisp/source/slime/start-swank.lisp &'
"  let g:slimv_swank_cmd = '! xterm -e sbcl --load /usr/share/common-lisp/source/slime/start-swank.lisp &'


""
"" Autocmds
""
  if !exists("autocommands_loaded")
    let autcommands_loaded = 1
 
    "" General Autocmds
    ""

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  endif

""
"" Aliases/abbreviations/user commands
""
  "cab hon set hlsearch
  "cab hof set nohlsearch
  "iab vimfold <C-R>=strftime("vim:fdm=marker:fdc = 2")
  "iab fixcs <C-R>=strftime("// FIXME: %y%m%d stuart")
  "iab fixch <C-R>=strftime("# FIXME: %y%m%d stuart")
  "iab fixms <C-R>=strftime("FIXME: %y%m%d - stuart")
  "iab fixbl <C-R>=strftime("/*FIXME*/")
  "iab todocs <C-R>=strftime("// TODO: %y%m%d stuart")
  "iab todoch <C-R>=strftime("# TODO: %y%m%d stuart")
  "iab todoms <C-R>=strftime("TODO: %y%m%d - stuart")
  "iab todobl <C-R>=strftime("/*TODO*/")
  "iab addcs <C-R>=strftime("// ADDED: %y%m%d stuart")
  "iab addch <C-R>=strftime("# ADDED: %y%m%d stuart")
  "iab addms <C-R>=strftime("ADDED: %y%m%d - stuart")
  "iab addbl <C-R>=strftime("/*ADDED stuart*/")
  "iab xxxcs <C-R>=strftime("// XXX: %y%m%d stuart")
  "iab xxxech <C-R>=strftime("# XXX: %y%m%d stuart")
  "iab xxxems <C-R>=strftime("XXX: %y%m%d - stuart")
  "iab xxxebl <C-R>=strftime("/*XXX*/")
  "iab passco <C-R>=strftime("PASS - stuart %d%m%y")
  "cab remlab s!$!  // <<SP_REMOVE<<! 
  ""| set hlsearch
  "map <C-F11> :split ~/.vimrc<CR>
  "map <c-F12> :split ~/.vim/user_add/VIM_commands<CR>

