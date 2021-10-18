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

"nvim tree bindings
nnoremap <leader>e :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>

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
