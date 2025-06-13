local _border = "single"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = _border
  }
)

vim.diagnostic.config {
  float = { border = _border }
}


_G.enable_mason = true

if vim.env.nvim_in_nix then
  _G.enable_mason = false

  print("enabling lsps")

  vim.lsp.enable({
    "lua_ls",
    "rust-analyzer",
    "pyright",
    "clang",
    "ts_ls",
    "jsonls",
    "bashls",
  })


end
