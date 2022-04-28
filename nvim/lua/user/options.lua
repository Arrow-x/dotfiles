-- :help options
o = vim.opt

o.clipboard = ""
o.cmdheight = 1 -- more space in the neovim command line for displaying messages
o.completeopt = { "menuone", "noselect" } -- mostly just for cmp
o.conceallevel = 0 -- so that `` is visible in markdown files
o.fileencoding = "utf-8" -- the encoding written to a file
-- o.mouse = "a"                             -- allow the mouse to be used in neovim
o.showmode = false
o.pumheight = 10 -- pop up menu height
o.showtabline = 2 -- always show tabs
o.smartcase = true -- smart case
o.splitbelow = true -- force all horizontal splits to go below current window
o.splitright = true -- force all vertical splits to go to the right of current window
o.hidden = true -- buffers are kept open in the background
o.errorbells = false
o.termguicolors = true -- set term gui colors (most terminals support this)
o.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
o.undofile = true -- enable persistent undo
o.backup = false -- creates a backup file
o.swapfile = false -- creates a swapfile
o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
o.updatetime = 300 -- faster completion (4000ms default)
o.shiftwidth = 4 -- the number of spaces inserted for each indentation
o.cursorline = false -- highlight the current line
o.number = true -- set numbered lines
o.relativenumber = true -- set relative numbered lines
o.numberwidth = 2 -- set number column width to 2 {default 4}
o.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
o.wrap = false -- display lines as one long line
o.scrolloff = 8 -- is one of my fav
o.sidescrolloff = 8
-- o.guifont = "monospace:h17"               -- the font used in graphical neovim applications

o.hlsearch = true -- highlight all matches on previous search pattern
o.incsearch = true
o.ignorecase = false -- ignore case in search patterns
vim.cmd("highlight Normal guibg=none")

o.smartindent = true -- make indenting smarter again
o.expandtab = false -- convert tabs to spaces
o.tabstop = 4 -- insert 4 spaces for a tab

o.shortmess:append("c")

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work
vim.cmd("let g:did_load_filetypes = 0")
vim.cmd("let g:do_filetype_lua = 1")
