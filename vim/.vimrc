" ============================================================================
" Vim Configuration
" ============================================================================

" ---------------------------------------------------------------------------
" Basic Settings
" ---------------------------------------------------------------------------
set number                      " Show line numbers
set relativenumber              " Relative line numbers
set tabstop=4                   " Tab width
set shiftwidth=4                " Indent width
set expandtab                   " Tabs to spaces
set autoindent                  " Auto indent
set smartindent                 " Smart indenting
set hidden                      " Allow hidden buffers
set wildmenu                    " Better command-line completion
set wildmode=longest:full,full  " Completion mode
set ignorecase                  " Case-insensitive search
set smartcase                   " Case-sensitive when uppercase used
set hlsearch                    " Highlight search results
set incsearch                   " Incremental search
set scrolloff=8                 " Lines of context around cursor
set sidescrolloff=8             " Horizontal context
set signcolumn=yes              " Always show sign column
set termguicolors               " True color support
set encoding=utf-8              " UTF-8 encoding
set mouse=a                     " Mouse support
set splitright                  " Vertical splits go right
set splitbelow                  " Horizontal splits go below
set updatetime=250              " Faster update time
set timeoutlen=500              " Faster key timeout
set undofile                    " Persistent undo
set clipboard=unnamedplus       " System clipboard
set cursorline                  " Highlight current line
set nowrap                      " No line wrapping
set whichwrap+=<,>,[,],h,l      " Arrow keys wrap lines

" ---------------------------------------------------------------------------
" Key Mappings
" ---------------------------------------------------------------------------
let mapleader = " "             " Leader key = Space

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffer navigation
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprev<CR>
nnoremap <leader>bd :bdelete<CR>

" Clear search highlights
nnoremap <leader>h :nohlsearch<CR>

" Move lines up/down
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Keep cursor centered when scrolling
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" ---------------------------------------------------------------------------
" Plugin Manager (vim-plug)
" ---------------------------------------------------------------------------
" Auto-install vim-plug if missing
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugged')

" Theme
Plug 'joshdick/onedark.vim'

" File browser
Plug 'preservim/nerdtree'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Editing helpers
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'           " Auto-detect indent style

" Syntax / Linting
Plug 'dense-analysis/ale'

" Auto-completion
Plug 'jiangmiao/auto-pairs'

call plug#end()

" ---------------------------------------------------------------------------
" Plugin Settings
" ---------------------------------------------------------------------------

" One Dark theme
if exists(':colorscheme')
  colorscheme onedark
endif

" NERDTree
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1

" FZF
nnoremap <leader>sf :Files<CR>
nnoremap <leader>sg :Rg<CR>
nnoremap <leader>sb :Buffers<CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7 } }

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'onedark'

" GitGutter
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
nnoremap <leader>gn <Plug>(GitGutterNextHunk)
nnoremap <leader>gp <Plug>(GitGutterPrevHunk)
nnoremap <leader>ga <Plug>(GitGutterStageHunk)
nnoremap <leader>gu <Plug>(GitGutterUndoHunk)

" ALE
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '!'
let g:ale_fix_on_save = 1

" ---------------------------------------------------------------------------
" Filetype-specific
" ---------------------------------------------------------------------------
filetype plugin indent on
syntax enable
