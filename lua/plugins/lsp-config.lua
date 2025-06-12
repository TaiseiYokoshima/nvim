local function telescope_ui_config()
  require("telescope").setup({
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({}),
      },
    },
  })
  require("telescope").load_extension("ui-select")
end



local function configure_lsp_config()
  local _border = "single"

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
      border = _border
    }
  )

  -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  --   vim.lsp.handlers.signature_help, {
  --     border = _border
  --   }
  -- )

  vim.diagnostic.config {
    float = { border = _border }
  }


  add_package("lsp_setup/on_attach.lua")
  run_all_except("lsp_setup", "on_attach")
end






return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {};
      },
      {

      },
      {
        "neovim/nvim-lspconfig",
        -- config = configure_lsp_config
      },
      {
        "nvim-telescope/telescope-ui-select.nvim",
        config = telescope_ui_config
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
    }
  },
}
