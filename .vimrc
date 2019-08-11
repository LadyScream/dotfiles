"Plug install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins
call plug#begin()
Plug 'dylanaraps/wal.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"Mappings
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
inoremap jj <Esc>
nnoremap <C-n> :Lexplore<CR>
nnoremap J :tabn<CR>
nnoremap K :tabp<CR>

"Settings
let mapleader=","
set clipboard+=unnamedplus
set conceallevel=2
set number
set shortmess+=A
set shortmess=atI
set textwidth=80
set updatetime=100
set statusline+=%{coc#status()}\ %p%%\ %l:%c
syntax on

""Hidden characters
set list
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:│ ,extends:❯,precedes:❮,nbsp:±,trail:_'
else
  let &listchars = 'tab:| ,extends:>,precedes:<,nbsp:.,trail:_'
endif

""Tabs
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

""Directories
if !exists('g:myruntime')
  let g:myruntime = split(&rtp, ',')[0]
endif
let &backupdir = g:myruntime . '/backup'
let &directory = g:myruntime . '/tmp'
let &undodir = g:myruntime . '/undodir'
set backup
set undofile

""Netrw
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
let g:netrw_list_hide = '^\.\.*'
