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
Plug 'lewis6991/gitsigns.nvim'
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
Plug 'rafamadriz/friendly-snippets'
Plug 'ray-x/lsp_signature.nvim'
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
