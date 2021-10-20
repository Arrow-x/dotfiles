"Neovim Key maps
let mapleader = " "

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Make Y behave like the rest
nnoremap Y y$

" Keeping it centered
nnoremap n nzzzv
nnoremap N nzzzv
nnoremap J mzJ`z

" Quicklist nice navigation
nnoremap <C-j> :cnext<CR>zzzv
nnoremap <C-k> :cprevious<CR>zzzv

" Undo Break Points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ; ;<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap = =<C-g>u

" Moving around text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
inoremap <C-k> <Esc>:m .-2<CR>==i
inoremap <C-j> <Esc>:m .+1<CR>==i

" Jumplist mutation
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Close buffer
nnoremap <leader>q :bw<CR>

" StepOver One in insert mode
inoremap jk <Esc>la

" Window management with tab
nnoremap <Tab> <C-w>

" Better resize 
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" nvim tree bindings
nnoremap <leader>e :NvimTreeToggle<CR>

" Telescope 
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fg :Telescope live_grep<CR>
nnoremap <leader>fb :Telescope buffers<CR>
nnoremap <leader>fh :Telescope help_tags<CR>
nnoremap <leader>fd :Telescope lsp_document_diagnostics<CR>
nnoremap <leader>fD :Telescope lsp_workspace_diagnostics<CR>

" lsp key binds 
nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vH :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vD :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>vr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vR :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vc :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vl :call LspLocationList()<CR>
