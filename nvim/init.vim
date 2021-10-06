"Tabing option, this if for Godot and Python, Lua too?
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

syntax enable

"Finding FIles
set path+=**
"set exrc
"set guicursor=
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set nowrap

set noswapfile
set nobackup
set undodir=~/.cache/nvim/undodir 
set undofile

set incsearch
set termguicolors
set scrolloff=12
set sidescroll=1
set sidescrolloff=30

set signcolumn=yes

set cmdheight=1

filetype plugin on

call plug#begin('/home/arrowx/.local/share/nvim/plugged') 
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"Themes
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'gruvbox-community/gruvbox'
"UI plugins
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-tree.lua'
"Lsp Plugings
Plug 'neovim/nvim-lspconfig' 
Plug 'kabouzeid/nvim-lspinstall'
"Core vim utils
Plug 'mbbill/undotree' 
"Git
Plug 'tpope/vim-fugitive' 
Plug 'airblade/vim-gitgutter'
"telescope and it's requarments
Plug 'nvim-lua/plenary.nvim'
Plug 'https://github.com/nvim-telescope/telescope.nvim' 
Plug 'nvim-telescope/telescope-fzf-native.nvim'
"TreeSitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Completions
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
" For vsnip user. I have no Idea how to use snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Lang specific
Plug 'habamax/vim-godot' 
call plug#end()

"let g:airline_theme='gruvbox'
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1

colorscheme gruvbox

highlight Normal guibg=none

"Neovim Keymap
let mapleader = " "

"Remap the Escape key
inoremap jk <Esc>
cnoremap jk <C-C>

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
