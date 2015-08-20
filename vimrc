set nocompatible

set encoding=utf-8

filetype plugin on

let mapleader = ","
inoremap <C-C> <Esc>

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" defaults *******************************************************************
let ctags_cmd='/usr/local/bin/ctags'

"set number

" Invisible characters *******************************************************
set listchars=trail:.,tab:>-,eol:$
set nolist
:noremap <Leader>i :set list!<CR> " Toggle invisible chars

" Tabs ***********************************************************************
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

" Indents ********************************************************************
set autoindent
set smartindent
set cindent
set copyindent

set hidden            " allow for editied buffers in the background 
set cursorline
set nowrap
set ruler             " show the cursor position all the time
set showcmd           " display incomplete commands
set showmatch

set foldlevelstart=20 " Don't start folded
set history=1000      " keep 50 lines of command line history
set undolevels=1000
set wildmode=list:longest 
set wildignore=*.swp,*.bak,*.pyc,*.class,target

set nobackup          " do not keep a backup file, use versions instead
set noswapfile

if has('mouse')
    set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
    set t_Co=256
    syntax on
endif

if exists('+colorcolumn')
    set colorcolumn=80,120
    highlight ColorColumn guibg=#222222 ctermbg=246
endif

if has("gui_running")
    " removes the toolbar in macvim
    set guioptions=egt
    set guioptions-=mrT
endif

" Sudo file if you must
cmap w!! %!sudo tee > /dev/null %

" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Enable file type detection.
    filetype plugin indent on
    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
    au!
    " When editing a file, always jump to the last known cursor position.
    autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
    augroup END

    autocmd Filetype java setlocal omnifunc=javacomplete#Complete
    set completeopt=menuone,menu,longest
    autocmd Filetype java let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

    " coffesciprt
    autocmd Filetype coffee setlocal softtabstop=2 shiftwidth=2 tabstop=2
endif " has("autocmd")

" Navigation *****************************************************************
map <Leader>p <C-^>
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
" Remap for history scrolling
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" ctrl-l is normally mapped as redraw so now I redraw and window naviagte
map <C-l> <C-w>l:redraw!<CR>

" move up and down vertically
nmap j gj
nmap k gk

" NERDCommenter
" let NERDCreateDefaultMappings=0
let NERDSpaceDelims=1
map <Leader>/ <plug>NERDCommenterToggle
map <Leader>[ <plug>NERDCommenterAlignLeft
map <Leader>] <plug>NERDCommenterUncomment

" NERDTree
let NERDTreeIgnore=['\.pyc', '\.class']
nmap <silent> <Leader>nt :NERDTreeToggle<CR>

" CtrlP
map <Leader>f :CtrlP<CR>
map <Leader>b :CtrlPBuffer<CR>
map <Leader>t :CtrlPTag<CR>
map <Leader>T :CtrlPBufTag<CR>

" File search ****************************************************************
set incsearch         " do incremental searching
set nohlsearch        " turn off highlight searches, but:

" Turn hlsearch off/on with CTRL-N
map <silent> <C-N> :set invhlsearch<CR>

set invnumber
nmap <Leader>N :set invnumber<CR>

" tags ***********************************************************************
set tags=tags,.tags,/
execute "map <F9> :!".ctags_cmd." -f '.tags' --exclude='build' --extra=+f -R .<CR>"

" rope
let g:ropevim_guess_project=1
let g:ropevim_vim_completion=1
let g:ropevim_extended_complete=1
let ropevim_enable_shortcuts=1

" preview rst
command Rst :silent !rst2html.py % > /tmp/rstprev.html && open /tmp/rstprev.html

" ruby
au FileType ruby setl sw=2 sts=2 et

" Status line
set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

nmap <Leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" prevent falling back on bad habits
" unmap arrow keys
nmap <right> <nop>
nmap <left> <nop>
nmap <up> <nop>
nmap <down> <nop>
imap <right> <nop>
imap <left> <nop>
imap <up> <nop>
imap <down> <nop>

" Showmarks
let g:showmarks_enable=0

" Style
set background=dark
try
    colorscheme xoria256
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
endtry

if exists('+colorcolumn')
    set colorcolumn=80,120
    highlight ColorColumn guibg=#373737 ctermbg=235
endif

highlight SpellBad cterm=underline,bold ctermbg=1 ctermfg=7

" system specific ************************************************************
if filereadable(expand("~/.vimrc_local"))
  source ~/.vimrc_local
endif
