set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Fuzzy search
Plugin 'ctrlpvim/ctrlp.vim'

" Silver searcher (makes fuzzy search even faster)
Plugin 'mileszs/ack.vim'

" NERD Tree (file explorer)
Plugin 'scrooloose/nerdtree' " NERD Tree

" Highlight trailing whitespace
Plugin 'bronson/vim-trailing-whitespace'

" Seamless Vim/Tmux navigation
Plugin 'christoomey/vim-tmux-navigator'

" Dim inactive panes in Vim
Plugin 'blueyed/vim-diminactive'
" Make dimming inactive panes in Vim possible while in tmux
Plugin 'tmux-plugins/vim-tmux-focus-events'

" Custom command palette
Plugin 'dbeecham/ctrlp-commandpalette.vim'

" Clang completion
Plugin 'Rip-Rip/clang_complete'

" Rust
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Bindings
    " With a map leader it's possible to do extra key combinations
    " like <leader>w saves the current file
    let mapleader = ","
    let g:mapleader = ","

    let maplocalleader = "\\"
    let g:maplocalleader = "\\"

    " Configure backspace so it acts as it should act
    set backspace=eol,start,indent
    set whichwrap+=<,>,h,l

    " Wrapped lines goes down/up to next row, rather than next line in file
    noremap j gj
    noremap k gk

" Basics
    " Some of these will need to be adjusted per programming language
    set autoindent smartindent backspace=2 encoding=utf-8 hlsearch incsearch
    set nobackup nocompatible noswapfile number shiftwidth=4
    set smarttab tabstop=4 expandtab
    syntax on

" Reasonable completion
" This is more or less copied from some place on the internet, I don't really
" remember from where. Although, I have adjusted it a bit to my taste. Don't
" ask how because I don't remember.
  set completeopt=longest,menuone
  set completeopt-=preview                                    " don't show the scratch preview window

  "inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  "inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  "  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

  "inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  "  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

  "function CleverCompletion()
  "  if &omnifunc != ''
  "     return 2
  "  elseif &completefunc != ''
  "      return 1
  "  else
  "      return 0
  "  endif
  "endfunction

  "" open omni completion menu closing previous if open and opening new
  "" menu without changing the text
  "inoremap <expr> <C-Space>
  "  \ (pumvisible() ?
  "  \   (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i')
  "  \ : '') .
  "  \ (CleverCompletion() == 2 ?
  "  \   '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
  "  \ : (CleverCompletion() == 1 ?
  "  \       '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
  "  \     : '<C-n><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'))

  inoremap <C-@> <C-x><C-o>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance
    " 256 colours terminal support
    set t_Co=256
    colorscheme molokai

    " Pink comments (comments are important, don't overuse them)
    hi Comment ctermfg=200

    " Highlight current line
    set cursorline

    " Show matching brackets when text indicator is over them
    set showmatch

    " How many tenths of a second to blink when matching brackets
    set mat=2


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
    " Highlight search results
    set hlsearch

    " Makes search act like search in modern browsers
    set incsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
    " Persistent undo
    if has('persistent_undo')
        set undodir=~/.vim-backups
        set undofile
    endif

    " vim -p limit
    set tabpagemax=100

    " Don't redraw while executing macros (good performance config)
    set lazyredraw

    " If a window is being splitted (for example, for jedi to display a
    " docstring), make it appear below or on the right
    set splitbelow
    set splitright

    " No annoying sound on errors
    set noerrorbells
    set novisualbell
    set t_vb=
    set tm=500

    " Allow buffer switching without saving
    set hidden

    " Clipboard shared with the rest of the OS
    set clipboard=unnamed,unnamedplus

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
    " NERDTree
    let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$', '__pycache__']

    " CtrlP
    let g:ctrlp_custom_ignore = {
        \ 'dir': '\v(CMakeFiles|_build|bin)$',
        \ 'file': '\v\.pyc$'
        \ }
    let g:ctlp_max_files = 0
    let g:ctrlp_working_path_mode = 'ra'

    let g:commandPalette = {
        \ 'Save as root': 'w ! sudo tee % > /dev/null',
        \ 'Strip trailing whitespace': 'call StripTrailingWhitespace()',
        \ 'Clang complete: open declaration in preview window': 'call g:ClangGotoDeclarationPreview()',
        \ 'Clang complete: go to declaration': 'call g:ClangGotoDeclaration()'
        \ }

    let g:ctrlp_commandpalette_autoload_commands = 0

    " The Silver Searcher
      " Use for grepping
      let g:ackprg = 'ag --vimgrep'

      " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
      let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

      " ag is fast enough that CtrlP doesn't need to cache
      let g:ctrlp_use_caching = 0

    " Dim inactive
    let g:diminactive_enable_focus = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
    " Strip whitespace {
    function! StripTrailingWhitespace()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction
    " }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C++
au FileType cpp set tabstop=2 shiftwidth=2 expandtab foldmethod=indent

let g:clang_library_path='/usr/lib/llvm-4.0/lib/libclang.so.1'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rust
au FileType rust set tabstop=4 shiftwidth=4 expandtab foldmethod=indent
let g:rustfmt_autosave = 1
let g:racer_experimental_completer = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" IDE-like key bindings
    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Find merge conflict markers
    map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

    " Quickfix window (useful e.g. for navigating grep (ag) results
    nmap <F7> :cprevious<cr>
    nmap <F8> :cnext<cr>

    " Reload file
    nmap <F5> :e<cr>
    imap <F5> <ESC>l:e<cr>i

    " Automatically go to the end of pasted text
    vnoremap <silent> y y`]
    vnoremap <silent> p p`]
    nnoremap <silent> p p`]

    " NERDTree toggle
    map <leader>nn :NERDTreeToggle<cr>

    " Custom CtrlP (Command palette)
    nnoremap <leader>t :CtrlPCommandPalette<cr>

    " Search for the current selection
    vnoremap <leader>gg y:Ack "<c-r>""

    " Search for word under cursor
    noremap <leader>gw :Ack <cword><CR>

    " Search for the current selection in the current directory subtree
    vnoremap <leader>gc y:Ack "<c-r>"" %:h/**/*

    " CtrlP is opened using c-f
    let g:ctrlp_map = '<c-f>'
