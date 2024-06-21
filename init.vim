call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'         " Sensible defaults for Vim
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " syntax highlighting

Plug 'nvim-tree/nvim-web-devicons' " optional
Plug 'nvim-tree/nvim-tree.lua'

Plug 'folke/tokyonight.nvim'

Plug 'sheerun/vim-polyglot' " Syntax highlighting

Plug 'vim-airline/vim-airline' " status line stuff
Plug 'vim-airline/vim-airline-themes'

" Plug 'ryanoasis/vim-devicons'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-commentary' " code commenting

call plug#end()

lua require'nvim-tree'.setup {}

set number
set relativenumber
syntax on
set mouse=a
set clipboard=unnamedplus " use system clipboard
set hlsearch
set ignorecase
set showmatch " show matching parantheses
set cursorline " highlight current line
set wrap " line wrapping
set smartindent
set ruler " show line and column numbers in the status line
set showcmd " show cmd in the status line
set encoding=UTF-8

set guifont=Monaspace\ Nerd\ Font\ 11

colorscheme tokyonight-night

nnoremap <C-e> :NvimTreeToggle<CR>
" nnoremap <C-q> :NvimTreeClose<CR>
nnoremap <C-r> :NvimTreeRefresh<CR>
nnoremap <C-f> :NvimTreeFindFile<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>
nnoremap <M-k> :resize -2<CR>
nnoremap <M-j> :resize +2<CR>
" Set following to show "<CAPS>" in the status line when "Caps Lock" is on.
let b:keymap_name = "CAPS"
" Show b:keymap_name in status line.
:set statusline^=%k
