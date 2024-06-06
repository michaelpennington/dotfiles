return {
	"phha/zenburn.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("zenburn")
		vim.cmd("highlight Normal guibg=none ctermbg=none")
		vim.cmd("highlight NonText guibg=none ctermbg=none")
		vim.cmd("highlight FoldColumn guibg=none ctermbg=none")
    vim.cmd("highlight LineNr guibg=none ctermbg=none")
		vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#9DA9A0" })
	end,
}
