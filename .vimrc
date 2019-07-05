"Plug install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins
call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dylanaraps/wal.vim'
Plug 'junegunn/goyo.vim'
Plug 'chrisbra/csv.vim'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()

"Plugin settings
""Netrw
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25
let g:netrw_list_hide = '^\.\.*'
""csv.vim
let b:csv_arrange_align = 'l*'
""vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

"Mappings
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
inoremap jj <Esc>
nnoremap <C-n> :Lexplore<CR>
nnoremap J :tabn<CR>
nnoremap K :tabp<CR>

"Settings
let mapleader=","
set updatetime=300
set textwidth=80
set number
set shortmess=atI "Disable start message
set shortmess+=A "Disable swap file messages
set conceallevel=2
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
set autochdir "Change to current file pwd
set backup "Enable backups
set undofile "Enable undo file
set autoindent
filetype plugin indent on
colorscheme wal

"Functions
"" Called on BufWritePre, creates parent directories if they don't exist
function s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction

"Autogroups
"" Calls s:MkNonExDir to create parent directories if they don't exist
augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
