local lspconfig = require("lspconfig")
local on_attach = utils.on_attach;

local settings = {
  ["rust-analyzer"] = {
    cargo = {
      allFeatures = true,
    },
    inlayHints = {
      enable = true,
      showParameterNames = true,
    }
  }
}

return {
  on_attach = on_attach,
  filetypes = { "rust" },
  root_dir = lspconfig.util.root_pattern("Cargo.toml"),
  settings = settings,
}
