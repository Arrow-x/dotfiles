local function getWords()
  return tostring(vim.fn.wordcount().words)
end

require('lualine').setup {
    options = {theme = 'gruvbox_material'};
    extensions = {'nvim-tree','fugitive','fzf'};
    sections = {
        lualine_b = {{'branch', icon = ''}, 'diff'},
        lualine_c = {'filename', {"diagnostics", sources = {"nvim_lsp"}}},
        lualine_x = {{getWords}, 'encoding', 'fileformat', 'filetype'},
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
        }
    }
}
