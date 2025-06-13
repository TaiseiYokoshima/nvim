local on_attach = utils.on_attach;

return {
  on_attach = on_attach,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },


  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "json" },
  root_markers = { "package.json", "tsconfig.json", ".git" },
  single_file_support = true,
}
