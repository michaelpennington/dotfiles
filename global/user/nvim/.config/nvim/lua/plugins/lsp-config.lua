return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"folke/neoconf.nvim",
		config = function()
			require("neoconf").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer", "clangd" },
			})
		end,
	},
	{
		"tamago324/nlsp-settings.nvim",
		config = function()
			require("nlspsettings").setup({})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "folke/neoconf.nvim" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			---@diagnostic disable-next-line: missing-fields
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			---@diagnostic disable-next-line: missing-fields
			lspconfig.clangd.setup({ capabilities = capabilities })
			---@diagnostic disable-next-line: missing-fields
			lspconfig.jsonls.setup({ capabilities = capabilities })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			local bufnr = vim.api.nvim_get_current_buf()
			vim.keymap.set("n", "<leader>h", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end, { noremap = true, silent = true, buffer = bufnr, desc = "Toggle inlay hints" })
			vim.keymap.set("n", "grn", vim.lsp.buf.rename, { noremap = true, desc = "Rename symbol under cursor" })
			vim.keymap.set("n", "gtt", vim.lsp.buf.signature_help, { noremap = true, desc = "Get type signature info" })
		end,
	},
}
