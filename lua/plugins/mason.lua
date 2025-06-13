return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {};
    },
    {

    },
    {
      "neovim/nvim-lspconfig",
    },
  },
  opts = {
    ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "ts_ls",
        "pyright",
        "jsonls",
        "clangd",
        "taplo",
        "bashls",
        "sqlls",
        "pylsp",
        "pylyzer",
    },
    automatic_enable = true,
  },
  enabled = enable_mason,
}
