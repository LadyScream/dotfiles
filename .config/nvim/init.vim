"Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'dylanaraps/wal.vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'honza/vim-snippets'
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
""Netrw
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
let g:netrw_list_hide = '^\.\.*'
""Coc
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
imap <C-j> <Plug>(coc-snippets-expand-jump)

let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
let g:coc_snippet_next = '<tab>'

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
