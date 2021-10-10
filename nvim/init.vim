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
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
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
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jacoborus/tender.vim'
"UI plugins
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'jose-elias-alvarez/buftabline.nvim'
"Lsp Plugings
Plug 'neovim/nvim-lspconfig' 
Plug 'kabouzeid/nvim-lspinstall'
Plug 'folke/trouble.nvim'
"Core vim utils
Plug 'mbbill/undotree' 
Plug 'jiangmiao/auto-pairs'
"Git
Plug 'tpope/vim-fugitive' 
Plug 'airblade/vim-gitgutter'
"telescope and it's requarments
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim' 
Plug 'nvim-telescope/telescope-fzf-native.nvim'
"TreeSitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Completions
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'Arrow-x/friendly-snippets'
"sources
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'octaltree/cmp-look'
Plug 'hrsh7th/cmp-calc'
Plug 'f3fora/cmp-spell'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
"Lang specific
Plug 'habamax/vim-godot' 
call plug#end()

colorscheme nord 

highlight Normal guibg=none

"Neovim Keymap
let mapleader = " "

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

" Close buffer
nnoremap <leader>q :bw<Enter>

" StepOver One in insert mode
inoremap <Tab><Tab> <Escape>la

" Telescope 
nnoremap <leader>ff :Telescope find_files<Enter>
nnoremap <leader>fg :Telescope live_grep<Enter>
nnoremap <leader>fb :Telescope buffers<Enter>
nnoremap <leader>fh :Telescope help_tags<Enter>

"Trouble Keybinds
nnoremap <leader>tt <cmd>TroubleToggle<cr>
nnoremap <leader>tw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>td <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>tq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>tl <cmd>TroubleToggle loclist<cr>
nnoremap <leader>tr <cmd>TroubleToggle lsp_references<cr>

"Prime's lsp keybinds eh. I will change some later
nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>vll :call LspLocationList()<CR>
