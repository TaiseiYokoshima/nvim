return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"tsserver",
					"pyright",
					"jsonls",
					"clangd",
					"taplo",
					--          "java-language-server"
				},
				automatic_installation = true,
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
      end


















			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({ capabilities = capabilities, on_attach = on_attach})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
        on_attach = on_attach,
				--        on_attach = require("plugins.configs.lspconfig").on_attach,
				filetypes = { "rust" },
				root_dir = lspconfig.util.root_pattern("Cargo.toml"),
				setttings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
					},
				},
			})
			lspconfig.tsserver.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				init_options = {
					preferences = {
						disableSuggestions = true,
					},
				},

				cmd = { "typescript-language-server", "--stdio" },
				filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "json" },
				root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
				single_file_support = true,
			})

			lspconfig.pyright.setup({ capabilities = capabilities, on_attach = on_attach})

			--      local capabilities2 = vim.lsp.protocol.make_client_capabilities()
			--      capabilities2.textDocument.completionItem.snippetSupport = true
			lspconfig.jsonls.setup({
				capabilities = capabilities,
        on_attach = on_attach
			})

			lspconfig.clangd.setup({ capabilities = capabilities, on_attach = on_attach })

			lspconfig.taplo.setup({ capabilities = capabilities, on_attach = on_attach })

		end,
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
