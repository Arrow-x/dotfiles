require('formatter').setup({
  filetype = {
    gdscript= {
      function()
        return {
          exe = "gdformat",
          -- args = {vim.api.nvim_buf_get_name(0)},
          stdin = false
        }
      end
    },
  }
})
