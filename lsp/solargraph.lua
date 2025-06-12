local lspconfig = require("lspconfig")
local on_attach = require("lsp.on_attach")

local setttings = {
  solargraph = {
    diagnostics = true,
  },
}

return {
  on_attach = on_attach,
  settings = setttings
}
