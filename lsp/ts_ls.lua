local lspconfig = require("lspconfig")
local on_attach = require("lsp.on_attach")

return {
  on_attach = on_attach,
  init_options = {
    preferences = {
      disableSuggestions = true,
    },
  },

  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "json" },
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
  single_file_support = true,
}
