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

" NERDCommenter
" let NERDCreateDefaultMappings=0
let NERDSpaceDelims=1
map <C-?> <plug>NERDCommenterToggle

" Status line
set laststatus=2
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" ctrl-p


" git-gutter
let g:gitgutter_realtime = 1000
let g:gitgutter_sign_column_always = 1

" vim-gist
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1

" format JSON
map <leader>jt <Esc>:%!json_xs -f json -t json-pretty<CR>

" Format XML
function! DoPrettyXML()
  let l:origft = &ft
  set ft=
  silent %!xmllint --format -
  1
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()


highlight SpellBad cterm=underline,bold ctermbg=1 ctermfg=7
