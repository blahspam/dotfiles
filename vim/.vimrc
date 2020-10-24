set encoding=utf-8

filetype plugin on

let mapleader = ","

if filereadable(expand("~/.vim/bundle"))
  source ~/.vim.bundle
endif

" Invisible characters
set listchars=trail:.,tab:>-,eol:$
set nolist
:noremap <Leader>i :set list!<CR> " Toggle invisible chars

" Style
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Tabs
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

" Indents
set autoindent
set smartindent
set cindent
set copyindent
set hidden
set cursorline
set nowrap
set ruler
set showcmd
set showmatch

set foldlevelstart=20
set history=1000
set undolevels=1000
set wildmode=list:longest
set wildignore=*.swp,*.bak,*.pyc,*.class,target

set nobackup
set noswapfile

" Sudo file if you must
cmap w!! %!sudo tee > /dev/null %

" Navigation
map <Leader>p <C-^>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k

" Remap for history scrolling
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" unmap arrow keys
nmap <right> <nop>
nmap <left> <nop>
nmap <up> <nop>
nmap <down> <nop>
imap <right> <nop>
imap <left> <nop>
imap <up> <nop>
imap <down> <nop>

" move up and down vertically
nmap j gj
nmap k gk

" Filetype
au FileType make set noexpandtab
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set ft=markdown
au BufNewFile,BufRead *.json set ft=javascript

highlight SpellBad cterm=underline,bold ctermbg=1 ctermfg=7
