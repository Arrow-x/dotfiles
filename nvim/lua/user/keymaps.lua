local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<Tab>", "<C-w>", opts)

keymap("n", "<leader>e", ":Lex 20<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- close buffers
keymap("n", "<leader>q", ":Bdelete<CR>", opts)
--keymap("n","<leader>Q", ":%bd\|e#<CR>", opts)

-- Quicklist nice navigation
keymap("n", "<C-j>", ":cnext<CR>zzzv", opts)
keymap("n", "<C-k>", ":cprevious<CR>zzzv", opts)

-- Quicklist nice navigation
keymap("n", "<C-j>", ":cnext<CR>zzzv", opts)
keymap("n", "<C-k>", ":cprevious<CR>zzzv", opts)

-- Move text up and Down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Keeping it centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Make Y behave like the other capital modifiers
keymap("n", "Y", "y$", opts)

-- Jumplist mutation
--nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
--nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

-- quickly fix formatting
keymap("n", "<leader>=", "gg<S-v>G=", opts)

-- Insert --
-- Press jk to step over one in insert mode
keymap("i", "jk", "<Esc>la", opts)

-- Move text up and down
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==i", opts)
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==i ", opts)

--Undo Break Points
keymap("i", ",", ",<C-g>u", opts)
keymap("i", ".", ".<C-g>u", opts)
keymap("i", ";", ";<C-g>u", opts)
keymap("i", "!", "!<C-g>u", opts)
keymap("i", "?", "?<C-g>u", opts)
keymap("i", "=", "=<C-g>u", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv=gv", opts)

-- terminal --
-- better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- System Clipboard --
-- Copy to system clipboard
keymap("v", "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", '"+yg_', opts)
keymap("n", "<leader>y", '"+y', opts)
keymap("n", "<leader>yy", '"+yy', opts)

-- Paste from system clipboard
keymap("n", "<leader>p", '"+p', opts)
keymap("n", "<leader>P", '"+P', opts)
keymap("v", "<leader>p", '"+p', opts)
keymap("v", "<leader>P", '"+P', opts)

-- nvim tree bindings
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
keymap("n", "<leader>fd", ":Telescope diagnostics<CR>", opts)
keymap("n", "<leader>fa", ":Telescope lsp_code_actions<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)

-- Lsp
keymap("n", "<leader>vd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "<leader>vc", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "<leader>vi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "<leader>vr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<leader>vH", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "<leader>vR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "<leader>va", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<leader>vn", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
keymap("n", "<leader>vp", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
keymap("n", "<leader>vh", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "<leader>vq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
