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
				ensure_installed = { "lua_ls", "rust_analyzer", "clangd" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			local bufnr = vim.api.nvim_get_current_buf()
			vim.keymap.set("n", "<leader>h", function()
				local current_setting = vim.lsp.inlay_hint.is_enabled(bufnr)
				vim.lsp.inlay_hint.enable(not current_setting)
			end, { noremap = true, silent = true, buffer = bufnr, desc = "toggle inlay hints" })
		end,
	},
}
