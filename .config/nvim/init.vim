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
