local lspconfig = require("lspconfig")
local on_attach = utils.on_attach;

local setttings = {
  solargraph = {
    diagnostics = true,
  },
}

return {
  on_attach = on_attach,
  settings = setttings
}
