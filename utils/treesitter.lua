local function treesitter_highlighter_active()
   print(vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()])
end


return {
  treesitter_highlighter_active = treesitter_highlighter_active
}
