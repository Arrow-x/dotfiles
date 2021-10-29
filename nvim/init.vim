filetype plugin on

call plug#begin('/home/arrowx/.local/share/nvim/plugged') 
"Themes
Plug 'kyazdani42/nvim-web-devicons' " for file icons
" Plug 'gruvbox-community/gruvbox'
" Plug 'arcticicestudio/nord-vim'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'jacoborus/tender.vim'
Plug 'sainnhe/gruvbox-material'
"UI plugins
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'jose-elias-alvarez/buftabline.nvim'
"Lsp Plugings
Plug 'neovim/nvim-lspconfig' 
Plug 'kabouzeid/nvim-lspinstall'
Plug 'ray-x/lsp_signature.nvim'
Plug 'folke/lsp-colors.nvim'
"Core vim utils
Plug 'mbbill/undotree' 
Plug 'jiangmiao/auto-pairs'
Plug 'b3nj5m1n/kommentary'
Plug 'folke/which-key.nvim'
Plug 'tpope/vim-surround'
"Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
"telescope and it's requarments
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim' 
Plug 'nvim-telescope/telescope-fzf-native.nvim'
"TreeSitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Completions
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
"cmp sources
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'octaltree/cmp-look'
Plug 'hrsh7th/cmp-calc'
Plug 'f3fora/cmp-spell'
"Formatter
Plug 'mhartington/formatter.nvim'
call plug#end()

colorscheme gruvbox-material 
