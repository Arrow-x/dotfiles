require('lualine').setup {
    options = {theme = 'gruvbox_material'};
    extensions = {'nvim-tree','fugitive','fzf'};
    sections = {
        lualine_b = {{'branch', icon = ''}, 'diff'},
        lualine_c = {'filename', {"diagnostics", sources = {"nvim_lsp"}}},

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
